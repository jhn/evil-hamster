namespace :db do
  desc "Populates Mongo with test data"
  task :populate => :environment do
    require 'csv'

    CSV.foreach("medallions.csv").drop(1).each do |item|
      Medallion.new.tap do |m|
        m.license_number = item[0]
        m.name = item[1]
        m.type = item[2]
        m.expiration_date = Date.strptime(item[3], "%m/%d/%Y")
        m.last_date_updated = Date.strptime(item[4], "%m/%d/%Y")
        m.last_time_updated = Time.strptime(item[5], "%H:%M")
      end.save!
    end

  end
end

