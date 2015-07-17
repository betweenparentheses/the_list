require 'mechanize'
require 'pry'
class FunCheap
  MECHANIZE = Mechanize.new
  EAST_URL = "http://eastbay.funcheap.com"
  SF_URL = "http://sf.funcheap.com"

  def initialize
  end

  def weekend
    @weekend ||= get_weekend
  end


  def path_for(date)
    "#{SF_URL}/#{date.year}/#{date.month}/#{date.day}/"
  end

  def events_today
    events_on(Date.today)
  end

  # returns array of hashes of events
  def events_on(date)
    raise ArgumentError unless date.is_a? Date

    path = path_for(date)
    page = MECHANIZE.get(path)

    listings = page.search('div.tanbox')

    listings.map{ |l| parse_listing(l, date)}.
             reject {|event| event[:name].nil? }
  end


  def parse_listing(listing, date)
    link = listing.search('a').first

    event_name = link.text.strip if link
    event_href = link.attributes['href'].value if link

    if event_name && event_name =~ /\|/
      event_name, location = event_name.split('|')[0..1]
    end

    time_td = listing.search('td').first
    time_text = time_td ? time_td.text : nil

    if archive_meta = listing.search('.archive-meta')
      location ||= archive_meta.text.split('|').last
      location.strip! if location

      time_text ||= archive_meta.text.scan(/\d+:\d{2}\s[a|p]m/)[0]
    end

    time = begin
      Time.parse(time_text)
    rescue
      nil
    end

    { name: event_name,
      href: event_href,
      date: date,
      time: time,
      location: location }
  end

end

fun = FunCheap.new

binding.pry

puts "blah"