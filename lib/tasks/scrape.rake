namespace :scrape do
  desc "TODO"
  task funcheap: :environment do
    fun = FunCheap.new

    fun.next_7_days.each do |fun|
      Event.create!(fun)
    end
  end

end
