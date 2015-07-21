namespace :scrape do
  desc "TODO"
  task funcheap: :environment do
    fun = FunCheap.new

    fun.next_7_days.each do |event|
      Event.create(event)
    end
  end

end
