#!/usr/bin/env bash
#
# Este script sube datos relativos a temperatura, humedad y velocidad del viento
# a un canal de ThingSpeak.
#
# Author: John Sanabria - john.sanabria@correounivalle.edu.co
# Date: 2019-09-04
#
apiKey="T9U837XR9Y382RD4"
device="dev00"

RPiTS_HOME="${HOME}/RPiThingSpeak"
PATH=${RPiTS_HOME}:${PATH}
if [ $# -eq 1 ]; then
  device=${1}
fi

if [ ! -f ${RPiTS_HOME}/${device} ]; then
  echo "[subirDatosTS] ${RPiTS_HOME}/${device} no existe"
  exit -1
fi
temp=$( readWeatherJSON.py ${RPiTS_HOME}/${device}  main temp )
humidity=$( readWeatherJSON.py ${RPiTS_HOME}/${device} main humidity )
wind=$( readWeatherJSON.py ${RPiTS_HOME}/${device} wind speed )

update=$(curl --silent --request POST --header "X-THINGSPEAKAPIKEY: $apiKey" --data "field1=$temp&field2=$humidity&field3=$wind" "http://api.thingspeak.com/update")

if [ ${update} -eq 0 ]; then
  echo "[subirDatosTS] Error al subir datos"
  exit -1
else
  exit 0
fi
