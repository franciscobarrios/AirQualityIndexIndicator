using Toybox.WatchUi;

class AirQualityIndexIndicatorView extends WatchUi.View {

	hidden var _city;
    hidden var _temp;
    hidden var _hum;
    hidden var _aqi;
    hidden var txtTemp;
    hidden var txtHum;
    hidden var txtAqi;
    hidden var txtCity;
    
    function initialize(city, temp, hum, aqi) {
        View.initialize();
		_city 	= city;
		_temp 	= temp;
		_hum 	= hum;
		_aqi 	= aqi;
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
		txtTemp = View.findDrawableById("temp");
		txtHum  = View.findDrawableById("hum");
		txtAqi  = View.findDrawableById("aqi");
		txtCity = View.findDrawableById("city");
    }

    function onShow() {
    	txtTemp.setText(_temp.toString()+"°C");
    	txtHum.setText(_hum.toString()+"%");
    	txtAqi.setText(_aqi.toString());
    	txtCity.setText(_city.toString());
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
