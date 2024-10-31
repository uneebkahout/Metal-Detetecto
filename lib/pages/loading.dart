import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:wheather_app/worker/worker.dart';

class loadingPage extends StatefulWidget {
  const loadingPage({super.key});
  State<loadingPage> createState() => _loadingPageState();
}

class _loadingPageState extends State<loadingPage> {
  String city = "NA";
  String? temp;
  String? hum;
  String? desc;
  String? main;
  String? airSpeed;
  String? icon;
  void showData() async {
    worker instance = worker(location: city);
    await instance.getData();
    temp = instance.temp;
    hum = instance.temp;
    desc = instance.description;
    main = instance.main;
    airSpeed = instance.air_speed;
    icon = instance.icon;
    Future.delayed(Duration(seconds: 5), () {
      Navigator.pushNamed(context, '/home', arguments: {
        'temp_value': temp,
        'hum_value': hum,
        'desc_value': desc,
        'airSpeed_value': airSpeed,
        'main_value': main,
        'icon_value': icon,
        'city_value': city,
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState

    showData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    try {
      Map search =
          ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
      if (search != Null) {
        city = search['searchText'];
      }
      showData();
    } catch (e) {}
    return Scaffold(
      body: Center(
        child: Container(
          height: h,
          width: w,
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromARGB(255, 75, 131, 243),
              Color.fromARGB(255, 163, 50, 201)
            ], stops: [
              0.2,
              0.9
            ], begin: Alignment.topLeft, end: Alignment.bottomRight),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/mlogo.png',
                width: 300,
                height: 150,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Weather App',
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white),
              ),
              Text(
                'Made by Uneeb ',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              SpinKitThreeInOut(
                itemBuilder: (_, int index) {
                  return DecoratedBox(
                    decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(20),
                        color: index.isEven
                            ? const Color.fromARGB(255, 235, 244, 54)
                            : Color.fromARGB(255, 0, 108, 172)),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Color.fromARGB(255, 105, 196, 240),
    );
  }
}











// import 'package:flutter/material.dart';
// import 'package:wheather_app/worker/worker.dart';

// class loadingPage extends StatefulWidget {
//   const loadingPage({super.key});

//   @override
//   State<loadingPage> createState() => _loadingPageState();
// }

// class _loadingPageState extends State<loadingPage> {
//   String? temp;
//   String? hum;
//   String? desc;
//   String? main;
//   String? air_speed;
//   void showData() async {
//     worker instance = worker(location: 'Chakwal');
//     await instance.getData();
//     temp = instance.temp;
//     hum = instance.temp;
//     desc = instance.description;
//     main = instance.main;
//     air_speed = instance.air_speed;
//     Navigator.pushReplacementNamed(context, '/home',arguments: {
//       'temp_value':temp,
//       'hum_value':hum,
//       'desc_value':desc,
//       'airSpeed_value':air_speed,
//       'main_value':main,

//   });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     showData();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Container(
//           height: 200,
//           width: 200,
//           color: Colors.amberAccent,
//           child: Center(
//               child: Text(
//             'Loading',
//             style: TextStyle(color: Colors.purple,fontSize: 20),
//           )),
//         ),
//       ),
//     );
//   }
// 
