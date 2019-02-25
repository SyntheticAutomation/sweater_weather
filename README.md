# README

<a href="https://bit.ly/2TfKX92" target="_blank">Click Here to View Project Requirements</a>

## Project Management
- Waffle Board: https://waffle.io/SyntheticAutomation/sweater_weather


## APIs Consumed:

<img src="https://bit.ly/2GVzKnH" width="25%">

-SmartyStreets ZipCode, for geocoding
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

## Rate Limits
- SmartyStreets has a very steep rate limit so please do not load the location endpoints unless necessary.

## Backend Features
- Serialization
- POROs
- Authentication

## Endpoints
###### `location` can be used with any American city and state using the same format. Cities with spaces in their names should have a plus sign in them instead. For example, if you wanted the weather for ann arbor, you would use: `location=ann+arbor,mi`.
- Weather - provides current weather and forecast data
  - `GET /api/v1/forecast?location=miami,fl`
