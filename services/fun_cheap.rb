require 'mechanize'
require 'pry'
require 'json' #required for activesupport
require 'active_support/all'

class FunCheap
  MECHANIZE = Mechanize.new
  EAST_URL = "http://eastbay.funcheap.com"
  SF_URL = "http://sf.funcheap.com"

  def initialize
  end

  def next_7_days
    @next_7_days ||= get_next_7_days
  end

  def today
    @today ||= events_on(Date.today)
  end

  private


  def path_for(date)
    "#{SF_URL}/#{date.year}/#{date.month}/#{date.day}/"
  end

  def get_next_7_days
    (0..6).inject([]) do |memo_arr, d|
      memo_arr + events_on( DateTime.parse(d.days.from_now.to_s) )
    end
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
      location: location,
      source_id: ListingSource.where(name: "FunCheap").first_or_create.id }
  end

end