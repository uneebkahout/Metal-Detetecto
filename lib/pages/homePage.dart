// import 'package:flutter/material.dart';

// class homePage extends StatefulWidget {
//   const homePage({super.key});

//   @override
//   State<homePage> createState() => _homePageState();
// }

// class _homePageState extends State<homePage> {
//   @override
//   Widget build(BuildContext context) {
//     final info =
//         ModalRoute.of(context)?.settings.arguments as Map<dynamic,dynamic>;
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         backgroundColor: Colors.purple,
//         title: Text('Home Activity'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text(info['temp_value'])],
//         ),
//       ),
//     );
//   }
// }
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:weather_icons/weather_icons.dart';

class homePage extends StatefulWidget {
  const homePage({super.key});

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  TextEditingController searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    final weather_info =
        ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>;
    String temp = (weather_info['temp_value']);
    String hum = weather_info['hum_value'];
    String air_speed = weather_info['airSpeed_value'];
    String getCity = weather_info['city_value'];
    String desc = weather_info['desc_value'];
    String icon = weather_info['icon_value'];

    var w = MediaQuery.of(context).size.width;
    var h = MediaQuery.of(context).size.height;
    var city_name = ['Karachi', 'Lahore', 'Chakwal', 'Islamabad', 'Rawlipindi'];
      final _random = new Random();
      var city = city_name[_random.nextInt(city_name.length)];
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(0),
          child: AppBar(
            backgroundColor: Colors.blue,
          )),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Container(
            height: h,
            width: w,
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 177, 132, 249)
            ),
            // main container or body Container
        
            child: Column(children: [
              Container(
                // search Container
                padding: EdgeInsets.symmetric(horizontal: 8),
                margin: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
        
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        if (searchController.text.replaceAll(' ', '') == '') {
                        } else {
                          Navigator.pushNamed(context, '/loading',
                              arguments: {'searchText': searchController.text});
                        }
                      },
                      child: Container(
                        child: Icon(
                          Icons.search,
                          color: Colors.blue,
                        ),
                        margin: EdgeInsets.fromLTRB(3, 0, 7, 0),
                      ),
                    ),
                    Expanded(
                        child: TextField(
                      controller: searchController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search $city',
                      ),
                    ))
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      padding: EdgeInsets.all(25),
                      child: Row(
                        children: [
                          Image.network(
                              'https://openweathermap.org/img/wn/$icon@2x.png'),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            children: [
                              Text(
                                '$desc',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                'in $getCity',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
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
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Icon(WeatherIcons.thermometer),
                          Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  '$temp',
                                  style: TextStyle(fontSize: 70),
                                ),
                                Text(
                                  'C',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ])
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
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(20, 0, 10, 0),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(WeatherIcons.day_windy)],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '$air_speed',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text('km/h'),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white.withOpacity(0.5)),
                      margin: EdgeInsets.fromLTRB(10, 0, 20, 0),
                      padding: EdgeInsets.all(25),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [Icon(WeatherIcons.humidity)],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '$hum',
                            style: TextStyle(
                                fontSize: 40, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '%',
                            style: TextStyle(fontSize: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.all(25),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Made By Uneeb'),
                    Text('Data Provided by openwathermap.org')
                  ],
                ),
        
                //e
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
