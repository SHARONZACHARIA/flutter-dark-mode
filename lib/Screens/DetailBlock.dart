import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:locations/Bloc/WeatherAPi.dart';
import 'package:provider/provider.dart';

class Details extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
   WeatherAPi counterBloc = Provider.of<WeatherAPi>(context);
    // TODO: implement build
    return Center(
          child: Container(
            width:MediaQuery.of(context).size.width,
            padding:EdgeInsets.all(32),
            child: Row(
             mainAxisAlignment:MainAxisAlignment.center,
        children: <Widget>[
            Text(counterBloc.getTemp().toString()==null?"---" :counterBloc.getTemp().toString() +" | ",style:TextStyle(fontSize:62),),
           
            Flexible(
                          child: Column(
                            crossAxisAlignment:CrossAxisAlignment.start,
                //mainAxisAlignment:MainAxisAlignment.start,
                children: <Widget>[
              Text(counterBloc.main==null?"---":counterBloc.main,style:TextStyle(fontSize:16,fontWeight:FontWeight.bold),overflow:TextOverflow.fade,textAlign:TextAlign.left,softWrap:true,),
              
                 Text(counterBloc.description ,style:TextStyle(fontSize:14,color:Colors.grey),overflow:TextOverflow.fade,),
                ],
              ),
            )
        ],
      ),
          ),
    );
  }
  
}