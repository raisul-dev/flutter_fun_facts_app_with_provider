import 'package:flutter/material.dart';
import 'package:funfacts/providers/themeProvider.dart';
import 'package:funfacts/screens/mainScreen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context)=>Themeprovider(), child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

@override
void initState() {
  super.initState();
  Provider.of<Themeprovider>(context,listen: false ).lodeMode();
}

 
  @override
  Widget build(BuildContext context) {
  var themeProvider = Provider.of<Themeprovider>(context );
    return MaterialApp(
      theme:themeProvider.isDarkModeCheked 
      ? ThemeData.dark(useMaterial3: true)
      :ThemeData.light(useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}

