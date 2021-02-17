using Toybox.WatchUi;

class AirQualityIndexIndicatorView extends WatchUi.View {

	hidden var _city;
    hidden var _temp;
    hidden var _hum;
    hidden var _aqi;
    
    function initialize(city, temp, hum, aqi) {
        View.initialize();
		_city 	= city;
		_temp 	= temp;
		_hum 	= hum;
		_aqi 	= aqi;
    }

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
        View.findDrawableById("city").setText(_city.toString());
		View.findDrawableById("temp").setText(_temp.toString());
		View.findDrawableById("hum").setText(_hum.toString());
		View.findDrawableById("aqi").setText(_aqi.toString());
    }

    function onShow() {
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
    }

    function onHide() {
    }

}
