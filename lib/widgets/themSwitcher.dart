import 'package:flutter/material.dart';
import 'package:funfacts/providers/themeProvider.dart';
import 'package:provider/provider.dart';

class ThemSwitcher extends StatefulWidget {
  const ThemSwitcher({super.key});

  @override
  State<ThemSwitcher> createState() => _ThemswitcherState();
}

class _ThemswitcherState extends State<ThemSwitcher> {


  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<Themeprovider>(context );
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Theme Mode",style: TextStyle(
            fontWeight: FontWeight.bold
          ),),
          Row(children: 
          [
         Switch(value: themeProvider.isDarkModeCheked, onChanged: (value){
        themeProvider.updateMode(darkMode: value);
         }),
      SizedBox(width: 20,),
          Text(themeProvider.isDarkModeCheked ? "Dark Mode":"Light Mode")]),
        ],
      ),
    );
  }
}
