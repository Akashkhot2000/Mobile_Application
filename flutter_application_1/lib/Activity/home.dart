import 'dart:convert';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather_icons/weather_icons.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController seachcontroller = new TextEditingController();
  @override
  void initState() {
    super.initState();
    print("This is a init state");
  }

  @override
  void setState(fn) {
    // TODO: implement setState
    super.setState(fn);
    print("Set state called");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("Widget Destroyed");
  }

  @override
  Widget build(BuildContext context) {
    Map info = ModalRoute.of(context)?.settings.arguments as Map;

    // temp value in three digit
    String temp = ((info['temp_value']).toString());
    String air = ((info['airspeed_value']).toString());
    if (temp == "NA") {
      print("NA");
    } else {
      temp = ((info['temp_value']).toString()).substring(0, 4);
      air = ((info['airspeed_value']).toString()).substring(0, 4);
    }
    String icon = info['icon_value'];
    String getcitys = info['city_value'];
    String hum = info['hum_value'];
    String desc = info['des_value'];

    // print(air);

    var city_name = ["Mumbai", "Kolhapur", "Sangali", "Satara", "Solapur"];
    final random = new Random();
    var city = city_name[random.nextInt(city_name.length)];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: Colors.amber,
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [
                      Colors.white,
                      Colors.blueAccent,
                      Colors.amberAccent
                    ])),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8),
                      margin:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(24)),
                      child: Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              if ((seachcontroller.text).replaceAll(" ", "") ==
                                  "") {
                                print("Blank search");
                              } else {
                                Navigator.pushReplacementNamed(
                                    context, "/loading",
                                    arguments: {
                                      "searchText": seachcontroller.text,
                                    });
                              }
                            },
                            child: Container(
                              child: Icon(
                                Icons.search,
                                color: Colors.blueAccent,
                              ),
                              margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              controller: seachcontroller,
                              decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Search $city"),
                            ),
                          )
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.symmetric(horizontal: 25),
                            padding: EdgeInsets.all(10),
                            child: Row(
                              children: [
                                Image.network(
                                    "https://openweathermap.org/img/wn/$icon@2x.png"),
                                SizedBox(
                                  width: 20,
                                ),
                                Column(
                                  children: [
                                    Text(
                                      "$desc",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text("IN $getcitys",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 200,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.symmetric(
                                horizontal: 25, vertical: 10),
                            padding: EdgeInsets.all(26),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Icon(WeatherIcons.thermometer),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "$temp",
                                      style: TextStyle(fontSize: 90),
                                    ),
                                    Text(
                                      "C",
                                      style: TextStyle(fontSize: 30),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                            padding: EdgeInsets.all(26),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.day_windy),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "$air",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text("Km/hr")
                            ]),
                            height: 200,
                          ),
                        ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(14),
                                color: Colors.white.withOpacity(0.5)),
                            margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                            padding: EdgeInsets.all(26),
                            child: Column(children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(WeatherIcons.humidity),
                                ],
                              ),
                              SizedBox(
                                height: 30,
                              ),
                              Text(
                                "$hum",
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                              Text("Percent")
                            ]),
                            height: 200,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 120,
                    ),
                    Container(
                      padding: EdgeInsets.all(30),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Made By Akash Khot"),
                            Text("Data Provided By OpenWeather.org")
                          ]),
                    )
                  ],
                ))),
      ),
    );
  }
}
