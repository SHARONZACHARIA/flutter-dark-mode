import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:locations/Bloc/WeatherAPi.dart';
import 'package:provider/provider.dart';

class Parameters extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    WeatherAPi counterBloc = Provider.of<WeatherAPi>(context);
    // TODO: implement build
    return Center(
          child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        crossAxisAlignment:CrossAxisAlignment.center,
        children: <Widget>[
          Row(
             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               getWidget(counterBloc.pressure.toString(),FontAwesomeIcons.thermometerQuarter),
           getWidget(counterBloc.humidity.toString(), FontAwesomeIcons.water),
            ],
          ),
          SizedBox(height:20,),
          Row(
             mainAxisAlignment:MainAxisAlignment.spaceEvenly,
            children: <Widget>[
          getWidget(counterBloc.wind_speed.toString(),FontAwesomeIcons.wind ),
             getWidget(counterBloc.min_temp.toString(), FontAwesomeIcons.temperatureLow)
          ],)
          ],

      ),
    );
  }

  
}

Widget getWidget(data,icon)
{
return Row(
  mainAxisAlignment:MainAxisAlignment.center,
  children: <Widget>[
Icon(icon),
 SizedBox(width:20,),
Text(data==null?"---":data)
  ],
);
}