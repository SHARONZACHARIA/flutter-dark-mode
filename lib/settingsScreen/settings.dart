import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:locations/Bloc/NightMode.dart';
import 'package:locations/Bloc/Weather.dart';
import 'package:provider/provider.dart';

class Settings extends StatefulWidget {
  
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
   var checked;
  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar:AppBar(centerTitle:true,title:Text("Settings"),),
          body: Container(
            padding:EdgeInsets.all(16.0),
        child:Center(
                child: Column(
            children: <Widget>[
              settingsWidget("Dark mode", FontAwesomeIcons.moon,context)
            ],
          ),
        ),
      ),
    );
  }

Widget settingsWidget(name,icon,context)
{
    NightMode  usertheme = Provider.of<NightMode>(context);
    checked = usertheme.getEnabled();
 
return ListTile(title:Text(name), subtitle:Text("Turn dark mode on / off"),
leading:Icon(icon,color:Colors.blue,),
onTap: ()
  {
  
   setState(() {
      checked = !checked;
      if(checked)
      usertheme.UserthemeMode = ThemeData.dark();
      else
      usertheme.UserthemeMode = ThemeData.light();
      usertheme.Enabled = checked;
    
   });
  },
 trailing: Checkbox(onChanged:(value)
  { 
   
     setState(() {
        checked = value;
       
      if(checked)
      usertheme.UserthemeMode = ThemeData.dark();
      else
      usertheme.UserthemeMode = ThemeData.light();
       usertheme.Enabled = checked;
     });
  },
  value:checked,)
);

}
}