#!/bin/bash -e

# https://openweathermap.org/forecast5
: ${OPENWEATHER_API_KEY?}
: ${LOC_LAT?}
: ${LOC_LON?}

# event id and webhook key from https://maker.ifttt.com/
: ${MAKER_EVENT?}
: ${MAKER_WEBHOOK_KEY?}

curl "https://api.openweathermap.org/data/2.5/forecast?cnt=8&lat=${LOC_LAT}&lon=${LOC_LON}&appid=${OPENWEATHER_API_KEY}" >forecast.json

pct_clouds=$(jq -r '[.list|.[]|select(.sys.pod=="d")|.clouds.all]|add/length|round' forecast.json)

if (( $pct_clouds <= 40 )); then
	echo "Cloud cover will be less than ${pct_clouds}% today."
	echo "Turning down the heating..."
	curl -X POST https://maker.ifttt.com/trigger/${MAKER_EVENT}/with/key/${MAKER_WEBHOOK_KEY}
fi
