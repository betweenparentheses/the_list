require 'mechanize'
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


  # returns array of hashes of events
  def events_on(date)
    raise ArgumentError unless date.is_a? Date

    path = path_for(date)
    page = MECHANIZE.get(path)

    listings = page.search('div.tanbox')

    # TODO: parse_listing method
    # TODO: handle some more cases
    listings.map do |listing|
      table = listing.children[0].children[0]
      link = listing.search('a').first

      event_name = link.text.strip if link
      event_href = link.attributes['href'].value if link

      time_td = listing.search('td').first
      time = Time.parse(time_td.text) if time_td

      { name: event_name,
        href: event_href,
        date: date,
        time: time }
    end
  end

end