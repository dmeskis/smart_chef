namespace :db do
  namespace :seed do

    desc 'Adds cities to the database with their coordinates'
    task :create_cities do
      cities = File.read('./db/csv/cities.csv')
      csv = CSV.parse(cities, :headers => true)
      csv.each do |row|
        

      end
    end

  end
end
