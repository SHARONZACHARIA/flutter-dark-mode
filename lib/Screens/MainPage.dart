import 'package:flutter/material.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:locations/Screens/image.dart';
import 'package:locations/Screens/parameters.dart';
import 'package:provider/provider.dart';
import 'package:locations/Bloc/WeatherAPi.dart';


import 'AddressLine.dart';
import 'DetailBlock.dart';


class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}


class _MainPageState extends State<MainPage>  {
 
bool  _isLocationFound = false;
bool _isWeatherDataLoaded = false;
WeatherBloc counterBloc;
WeatherAPi apiBloc;

 @override
  Widget build(BuildContext context) {
     counterBloc = Provider.of<WeatherBloc>(context);
     apiBloc = Provider.of<WeatherAPi>(context);
     if(! _isLocationFound)
  {  _isLocationFound = true;
     counterBloc.getCurrentLocation().then((_)
    {    
         apiBloc.getWeatherData(counterBloc.getLatitude(),counterBloc.getLongitude());
       
         
    });
  
  
  }


  //   if(! _isWeatherDataLoaded)
  // {
     
  //   _isWeatherDataLoaded = true;
  // }
      
    
    return Container(
        width:MediaQuery.of(context).size.width,
       decoration:BoxDecoration(
        // color:Colors.white
       ),
      
              
                child: Column(
         
              crossAxisAlignment:CrossAxisAlignment.center,
            children: <Widget>[ 
          
       
          
              SizedBox(height:10,),
            MainImage(),
              SizedBox(height:10,),
                 Padding(child: Divider(),padding:EdgeInsets.all(16)),
             Details(),
              SizedBox(height:10,),
              Parameters(),
              Padding(child: Divider(),padding:EdgeInsets.all(16)),
              AddressLine()
           
          ],),
        
      
    );
 
  }

  @override
  void dispose() {
   
    counterBloc.cancelLocation();
    super.dispose();
  }


}