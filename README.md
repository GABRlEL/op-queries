# op-queries
Overpass Turbo queries for finding potentially eligible POIs for Scopely Explore Wayfarer from public OpenStreetMap data

## Important disclaimer
Use this as guidance for exploring your local area. Don't blindly submit and always check the Wayfarer criteria. This should only help you find potential POIs.

## How to use
This README file will have the link to all queries, so you can use them right away. The raw queries will be in the queries folder.

Open the link, enter your coordinates on the fixed coordinates version/set the map center properly, (in large cities like Munich lower the radius, by default it's set to 10km unless stated otherwise) and then start.

Note that using those queries is CPU intensive and may take a few minutes to complete a full run. If you time out, consider lowering the radius or increasing the timeout. 

If you run into rate limits, consider changing the Overpass Turbo server in your settings or look into self-hosting.

## Links to queries
### General POI scanner
This scanner looks for the following features:
* Exploration: historic, cultural, religious, educational, art, landmarks
* Exercise / recreation: parks, sports, trails, minigolf, courses, swimming
* Social / gathering: pavilions, picnic areas, fountains, markets, post offices
#### Unfiltered
* Map center: https://overpass-turbo.eu/s/2s6D
* Fixed coordinates: https://overpass-turbo.eu/s/2s6F
#### Without gardens
* Map center without gardens: https://overpass-turbo.eu/s/2ubv
* Fixed coordinates without gardens: https://overpass-turbo.eu/s/2ubx


### Bench scanner
#### Unfiltered
* Map center: https://overpass-turbo.eu/s/2s6K
* Fixed coordinates: https://overpass-turbo.eu/s/2s6I
#### Without bus stops
* Map center without bus stops: https://overpass-turbo.eu/s/2s6O
* Fixed coordinates without bus stops: https://overpass-turbo.eu/s/2s6M


### Bridge scanner
#### Unfiltered
*The full bridge scanner queries are very intense, that's why the radius was significantly decreased, to work in a rural area at all. I recommend using the foot/cycling bridge scanner instead.*
* 1 km radius map center: https://overpass-turbo.eu/s/2ubn
* 1 km radius fixed coordinates: https://overpass-turbo.eu/s/2ubp
#### Foot & cycling bridges only
* 10 km radius map center without car bridges: https://overpass-turbo.eu/s/2ubt
* 10 km radius fixed coordinates without car bridges: https://overpass-turbo.eu/s/2ubr
