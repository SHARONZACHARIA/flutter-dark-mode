import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:provider/provider.dart';


class AddressLine extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    WeatherBloc counterBloc = Provider.of<WeatherBloc>(context);
    // TODO: implement build
    return Center(
          child: Container(
            width: 300,
            child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        
 children: <Widget>[
   Icon(Icons.location_on,color:Colors.redAccent),
   Padding(
     padding: const EdgeInsets.all(8.0),
     child: Text(counterBloc.location_address,softWrap:true,),
   )
 ],
      
            ),
          ),
    );
  }
  
}