# README

## Sweater Weather Back-End

# Description
This is the back-end repository for the sweater weather project. The front-end repository can be found here: https://github.com/dmeskis/sweater_weather_FE
Sweater Weather is a project bridging between Mod 3 and Mod 4 at Turing School of Software and Design. I built out an API on the back-end in Mod 3 over one week that utilizes several API to fetch weather data, and built the front-end out over the first week of Mod 4.

This back-end utilizing PostgreSQL to store User, cities, and favorites data.
The feature I'm most proud of in this back-end is how cities are saved to the database. It parses the location query and checks if the city already exists in the database. If it does not, it creates the city and makes a call to Google's Geocoding API to get the city's coordinates. It also uses google's data to grab the name and state of the city to ensure consistency. The app is smart enough to avoid duplicating cities in the DB, even if user enters partial location names or abbreviated states.

# How to Use
Check out the app at: https://dmeskis.github.io/sweater_weather_FE/

### API Endpoints

Content-Type: application/json
Accept: application/json

Get Weather:
  GET /api/v1/forecast
  Parameters: location
  
Retrieve Background Image Based on Location:
  GET /api/v1/backgrounds
  Parameters: location
  
Account Creation:
  POST /api/v1/users
  Parameters: email, password, password_confirmation

Log In:
  POST /api/v1/sessions
  Parameters: email, password
  
Favorite Location:
  POST /api/v1/favorites
  Parameters: location, api_key
  
List Favorite Locations:
  GET /api/v1/favorites
  Parameters: api_key

Delete Favorite Locations:
  DELETE /api/v1/favorites
  Parameters: api_key, location

## Built With

APIs used: 
* [Darksky API](https://darksky.net/dev)
* [Google Geocoding API](https://developers.google.com/maps/documentation/geocoding/start)
* [Flickr API](https://www.flickr.com/services/api/)

Tools used:

* [Ruby](https://www.ruby-lang.org/en/)
* [Rails](https://rubyonrails.org/)
* [PostgreSQL](https://www.postgresql.org/)
* [RSpec](http://rspec.info/)
