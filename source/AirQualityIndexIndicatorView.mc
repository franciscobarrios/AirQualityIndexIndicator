using Toybox.WatchUi;
using Toybox.Graphics as Gfx;

class AirQualityIndexIndicatorView extends WatchUi.View {

	hidden var _temp;
    hidden var _hum;
    hidden var _aqi;
    hidden var _aqiColor;
    hidden var _city;
    hidden var txtTemp;
    hidden var txtHum;
    hidden var txtAqi;
    hidden var txtCity;
    
    function initialize(temp, hum, aqi, aqiColor, city) {
        View.initialize();
		_temp 		= temp;
		_hum 		= hum;
		_aqi 		= aqi;
		_aqiColor 	= aqiColor;
		_city 		= city;
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
		txtTemp = View.findDrawableById("temp");
		txtHum  = View.findDrawableById("hum");
		txtAqi  = View.findDrawableById("aqi");
		txtCity = View.findDrawableById("city");
		
		txtTemp.setText("");
		txtHum.setText("");
		txtAqi.setText("");
		txtCity.setText("");
    }

    function onShow() {
    	txtTemp.setText("T: " + _temp.toString()+"°C");
    	txtHum.setText("H: " + _hum.toString()+"%");
    	txtAqi.setText("AQI: "+ _aqi.toString());
   
    	if(_aqiColor !=null){
    		switch(_aqiColor){	
    			case "green":
    				txtAqi.setColor(Gfx.COLOR_GREEN);
    				break;
    			case "yellow":
    				txtAqi.setColor(Gfx.COLOR_YELLOW);
    				break;
    			case "orange":
    				txtAqi.setColor(Gfx.COLOR_ORANGE);
    				break;
    			case "red":
    				txtAqi.setColor(Gfx.COLOR_RED);
    				break;
    			case "purple":
    				txtAqi.setColor(Gfx.COLOR_PURPLE);
    				break;
    			case "dark_red":
    				txtAqi.setColor(Gfx.COLOR_DK_RED);
    				break;
    		}
    	}
    	
    	txtCity.setText(_city.toString());
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
