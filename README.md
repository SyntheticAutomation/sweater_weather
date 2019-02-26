# README

<a href="https://bit.ly/2TfKX92" target="_blank">Click Here to View Project Requirements</a>

API is deployed at `https://rocky-cliffs-95700.herokuapp.com/`
but since there isn't a front end for this project, you'll want to enter endpoints directly.
try: `https://rocky-cliffs-95700.herokuapp.com/api/v1/forecast?location=denver,co`

## Project Management
- Waffle Board: https://waffle.io/SyntheticAutomation/sweater_weather


## APIs Consumed:

<img src="http://i.dailymail.co.uk/i/pix/2015/09/01/18/2BE1E88B00000578-3218613-image-m-5_1441127035222.jpg" width="8%">

-Google Geocode API, for geocoding
<hr>
<img src="https://pbs.twimg.com/profile_images/428154467448389632/gOij3QhC_400x400.png" width="7%">

-DarkSky Forecast, for weather data
<hr>
<img src="https://bit.ly/2SnnkqK" width="5%">

-Flickr photos.search, for background image
<hr>
<img src="https://bit.ly/2Nrr7m5" width="8%">

-Giphy, for weather gifs
<hr>

## Backend Features
- Serialization
- POROs
- Authentication

## Design
- I decided to not save current weather to the database, given that current weather changes so much. It would have made sense to do so if we were dealing with a persistent object lookup. However, weather is constantly changing, so it's better to do the extra legwork of a fresh API call in this instance, in my opinion.
- That being said, locations are saved to the database to improve overall performance. This means that the backend doesn't have to go look up the latitude and longitude from an external service every time a location param is passed into the api - it can just pull it out of the database instead, which is much faster. Once this was implemented, there was a significant improvement in load time by 2 full seconds (2000ms).

## Endpoints
- Weather - provides current weather and forecast data
  - `GET /api/v1/forecast?location=miami,fl`
