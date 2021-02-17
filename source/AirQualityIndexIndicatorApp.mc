using Toybox.Application;
using Toybox.WatchUi;
using Toybox.WatchUi as Ui;
using Toybox.Position;
using Toybox.System;

const URL_BASE = "https://api.airvisual.com/v2/nearest_city?";
const KEY = "de4e9f34-2b3e-4c25-b120-f8f7aee8c81d";

class AirQualityIndexIndicatorApp extends Application.AppBase {

	hidden var _lat;
	hidden var _lon;

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) {
    	Position.enableLocationEvents(Position.LOCATION_ONE_SHOT, method(:onPosition));
    	makeRequest(_lat,_lon);
    	onPosition();
    }

    function onStop(state) {
    }

    function getInitialView() {
        return [new AirQualityIndexIndicatorView("","","","")];
    }

	function onReceive(responseCode, data) {
       if(responseCode==200){
	       var jsonInfo = data;
	       var jsonData = jsonInfo.get("data");
	       
	       var jsonCity = jsonData.get("city");
	       var jsonState = jsonData.get("state");
	       var city= jsonCity+",\n "+jsonState;
	       
	       var jsonCurrent = jsonData.get("current");
	       var jsonPollution = jsonCurrent.get("pollution");
	       var aqiUs = "AQI: "+jsonPollution.get("aqius");
	       
	       var jsonWeather = jsonCurrent.get("weather");
	       var temp = "temp: "+jsonWeather.get("tp");
	       var hum = "hum:  "+jsonWeather.get("hu");
	       	    
	       Ui.switchToView(new AirQualityIndexIndicatorView(city,temp,hum,aqiUs), null, Ui.SLIDE_IMMEDIATE);
       }
   	}
    
    function makeRequest(lat, lon){
    	var url= URL_BASE + "lat=" + lat + "lon=" + lon + "&key=" + KEY;
    	var params =null;
    	var options = {
			:method       => Communications.HTTP_REQUEST_METHOD_GET,
         	:responseType => Communications.HTTP_RESPONSE_CONTENT_TYPE_JSON
    	};
    	var responseCallback = method(:onReceive);
    	Communications.makeWebRequest(url, params, options, method(:onReceive));
    }
    
    function onPosition() {
		var location =  Position.getInfo().position.toDegrees();
		var lat = location[0];
		var lon = location[1];
	}
}
