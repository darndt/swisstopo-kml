# swisstopo-kml
This provides a network link for Google Earth to display the topographic map for Switzerland by Swisstopo ("ch.swisstopo.pixelkarte-farbe").

![screenshot](screenshot.jpg?raw=true)

## How to use
- Open Google Earth
- Go to "Add..." > "Network Link"
- Paste this URL: `https://yoo9r.hatchboxapp.com/kml`

## Modifications
The code can be easily adapted for other Swisstopo tile layers:
- Fork the repo
- Modify `@tile_url` in `web.rb`
- Push to Heroku etc

## Run locally
`rackup config.ru`
