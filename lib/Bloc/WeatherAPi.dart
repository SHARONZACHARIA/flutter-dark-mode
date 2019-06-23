import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class WeatherAPi extends ChangeNotifier {
  double temp=0;
  String humidity='';
  double max_temp=0;
  double min_temp=0;
  double wind_speed=0;
  String description='----';
  String main='---';
  String pressure='';
  static String _API_KEY = "YOUR_API_KEY";
   getTemp()
    {
      return temp;
    }

 Future<void>getWeatherData(lat,lon) async {
   print(lat+lon);
   
    var data = await http.get( "https://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$lon&units=metric&appid=" +
          _API_KEY);
    var jsondata = json.decode(data.body);
    temp = jsondata['main']['temp_max'];
    humidity = jsondata['main']['humidity'].toString();
    max_temp = jsondata['main']['temp_max'];
    min_temp = jsondata['main']['temp_min'];
    print(temp);
    pressure = jsondata['main']['pressure'].toString();
    description = jsondata['weather'][0]['description'];
    main = jsondata['weather'][0]['main'];
    notifyListeners();
  }
}
