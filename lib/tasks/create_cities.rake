namespace :db do
  namespace :seed do

    desc 'Adds cities to the database with their coordinates'
    task :create_cities => :environment do
      require './app/models/city'
      require 'csv'
      cities = File.read('./db/csv/cities.csv')
      csv = CSV.parse(cities, :headers => true)
      google_service = GoogleGeocodingService.new
      csv.each do |row|
        coordinates = google_service.get_coordinates("#{row["city"]}, #{row["state"]}")
        City.create!(name: row["city"],
                     state: row["state"]
                   )

      end
    end

  end
end
