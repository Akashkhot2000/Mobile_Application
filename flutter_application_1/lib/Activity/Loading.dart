import 'package:flutter/material.dart';
import "package:flutter_application_1/Worker/worker.dart";
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  // const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String city = "Mumbai";
  String? temp;
  String? hum;
  String? air_speed;
  String? des;
  String? main;
  String? icon;

  void startApp(String city) async {
    worker instance = worker(location: city);
    await instance.getData();

    temp = instance.temp.toString();
    hum = instance.humidity.toString();
    air_speed = instance.air_speed.toString();
    des = instance.description.toString();
    main = instance.main.toString();
    icon = instance.icon.toString();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/home', arguments: {
        "temp_value": temp,
        "hum_value": hum,
        "airspeed_value": air_speed,
        "des_value": des,
        "main_value": main,
        "icon_value": icon,
        "city_value": city
      });
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if (search?.isNotEmpty ?? false) {
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(
                "images/b.png",
                scale: 4,
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                "Weather App",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Made By Akash Khot",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 20,
              ),
              SpinKitWave(
                color: Colors.black,
                size: 60.0,
              ),
            ]),
      ),
      backgroundColor: const Color.fromARGB(255, 153, 214, 243),
    );
  }
}
