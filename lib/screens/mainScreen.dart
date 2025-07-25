import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:funfacts/screens/Settings_screen.dart';
import 'package:dio/dio.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<dynamic> facts = [];
  bool isLoading = true;
  void getData() async {
    try {
      Response response = await Dio().get(
        "https://raw.githubusercontent.com/raisul-dev/flutter_dummy_api-/refs/heads/main/facts.jeson",
      );
      facts = jsonDecode(response.data);
      isLoading = false;
      setState(() {});
    } catch (e) {
         isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Funfacts"),
        actions: [
          InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.settings),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: isLoading
                ? Center(child: CircularProgressIndicator())
                : PageView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: facts.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              textAlign: TextAlign.center,
                              facts[index],
                              style: TextStyle(fontSize: 35),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Container(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("Swipoe left for more"),
            ),
          ),
        ],
      ),
    );
  }
}
