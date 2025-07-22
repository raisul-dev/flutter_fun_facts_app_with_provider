import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Themeprovider extends ChangeNotifier {
bool isDarkModeCheked =true;


 void updateMode ({required bool darkMode})async{
 isDarkModeCheked = darkMode;

 final SharedPreferences prefs = await SharedPreferences.getInstance();
 notifyListeners();

 prefs.setBool("isDarkModeChacker", darkMode);

 }
 void lodeMode()async{
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  isDarkModeCheked = prefs.getBool("isDarkModeChacker")?? true;
  notifyListeners();
 }
}
