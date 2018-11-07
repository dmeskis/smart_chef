namespace :db do
  namespace :seed do

    desc 'Adds cities to the database with their coordinates'
    task :create_cities do
      cities = File.read('./db/csv/cities.csv')
      csv = CSV.parse(cities, :headers => true)
      google_service = GoogleGeocodingService.new
      csv.each do |row|
        coordinates = GoogleGeocodingService.get_coordinates("#{row.city}, #{row.state}")
        City.create!(name: row.city,
                     state: row.state,
                     latitude: coordinates[:lat],
                     longitude: coordinates[:lng]
                   )

      end
    end

  end
end
