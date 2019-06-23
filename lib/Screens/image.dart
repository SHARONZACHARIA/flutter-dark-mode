import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:locations/Bloc/WeatherAPi.dart';
import 'package:provider/provider.dart';

class MainImage extends StatelessWidget

{
  WeatherBloc counterBloc;
WeatherAPi apiBloc;
  @override
  Widget build(BuildContext context) {
     counterBloc = Provider.of<WeatherBloc>(context);
     apiBloc = Provider.of<WeatherAPi>(context);
    // TODO: implement build
    return Column(
     // mainAxisAlignment:MainAxisAlignment.center,
      crossAxisAlignment:CrossAxisAlignment.center,
      children: <Widget>[
        Text("SATURDAY 19 MARCH 2019",textAlign:TextAlign.center,style:TextStyle(color:Colors.grey,fontWeight:FontWeight.normal,fontSize:18),),
         SizedBox(height:8,),
         Text("double tap to refresh data ",style:TextStyle(color:Colors.grey)),
        SizedBox(height:8,),
        GestureDetector(
                  child: Icon(FontAwesomeIcons.cloudSunRain,color:Colors.blue,size:150,),onDoubleTap: ()
          {
             counterBloc.getCurrentLocation().then((_)
    {    
           apiBloc.getWeatherData(counterBloc.getLatitude(),counterBloc.getLongitude());
       
           
    });
          },
        ),
          //SizedBox(height:16,),
         //Text("double tap to refresh data ",style:TextStyle(color:Colors.grey))
      ],
    );
  }
  
}