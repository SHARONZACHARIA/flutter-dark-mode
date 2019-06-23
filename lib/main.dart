import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Bloc/NightMode.dart';
import 'Bloc/Weather.dart';
import 'package:provider/provider.dart';
import 'Bloc/WeatherAPi.dart';
import 'Screens/MainPage.dart';
import 'settingsScreen/settings.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return  MultiProvider(
          providers:[ChangeNotifierProvider<WeatherBloc>.value(
        value: WeatherBloc()),
       ChangeNotifierProvider<WeatherAPi>.value(
        value: WeatherAPi()),
        ChangeNotifierProvider<NightMode>.value(
        value: NightMode())],
        child:MainWidget()
    );
    
    
  }
}

class MainWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
     NightMode  usertheme = Provider.of<NightMode>(context);
    return MaterialApp(
          //  color:Colors.white,
           
            theme:usertheme.getTheme(),
            home: Scaffold(appBar:AppBar(
              //leading:Icon(FontAwesomeIcons),
              
              elevation:0,
              title:Text("Weather Now",style:TextStyle(fontWeight:FontWeight.normal,fontSize:20)),
              leading:Icon(FontAwesomeIcons.cloud),
              
             
            ),
            floatingActionButton:Builder(
                          builder:(context)=>FloatingActionButton(
                onPressed:(){
                  Navigator.push(context,MaterialPageRoute(builder:(context)=>Settings()));
                },
                child:Center(child: Icon(Icons.settings)),
              ),
            ),
            body: SingleChildScrollView(child: MainPage())),
    );
  }
}
