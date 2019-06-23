import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geocoder/model.dart';
import 'package:location/location.dart';


class WeatherBloc extends ChangeNotifier {
  double _latitude = 0;
  double _longitude = 0;
  double _altitude = 0;
  double _speed = 0;
  var loc = Location();
  String location_name ='';
  String location_address='----';
 
   StreamSubscription<LocationData> _locationSubscription;

  getLongitude() {
    return _longitude;
  }

  getLatitude() {
    return _latitude;
  }

  
  getAltituder() {
    return _altitude;
  }

  getSpeed() {
    return _speed;
  }

  getContinousLocation() {
    _locationSubscription =
        loc.onLocationChanged().listen((LocationData currentLoc) {
      _latitude = currentLoc.latitude;
      _longitude = currentLoc.longitude;
      _altitude = currentLoc.altitude;
      _speed = currentLoc.speed; 
      // speed data not getting ...
      getLocationName(_latitude,_longitude);
      notifyListeners();
    });
  }

  Future<void>getCurrentLocation()async
  {
   
 
     if(await loc.hasPermission())
     {
     CurrentLocationMethod();
    
     }
     else
     await loc.requestPermission().then((value)
     {
       if(value)
       {
         CurrentLocationMethod();
       }

     });
      
    }

   
  

  cancelLocation() {
    _locationSubscription.cancel(); // call this function in mainpage
  }

  getLocationName(lat,lon) async {
    final coordinates = new Coordinates(lat,lon);
    var addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    var first = addresses.first;
  //  print("${first.featureName} : ${first.addressLine}");
    location_name = first.featureName;
    location_address = first.addressLine;
    //notifyListeners();
  }

  CurrentLocationMethod()async
  {
     var current =  await loc.getLocation();
    print("getCurrebtLOcation metho d called ....");
    _latitude = current.latitude;
    _longitude = current.longitude;
   // _speed = current.speed;
   // _altitude = current.altitude;
      getLocationName(_latitude,_longitude);
    //getWeatherData(_latitude,_longitude);
     notifyListeners();
  }
}
