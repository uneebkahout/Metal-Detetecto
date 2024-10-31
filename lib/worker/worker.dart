import 'dart:convert';
import 'package:http/http.dart';
class worker {
  String location ;
  worker({required this.location}){
    location=this.location;
  }
  String?temp ;
  String? humidity;
  String? air_speed ;
  String? description ;
  String? main ;
String? icon;

   
Future<void>getData() async {
 try{
    Response response=await  get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q= $location&appid=4f90ddf03f9c48a120c0f85bdf89eedc'));


    Map data = jsonDecode(response.body);

// Getting Temp , Humidity
    Map temp_data = data['main'];
    double getTemp = temp_data['temp']-273;

    String getHumidity = temp_data['humidity'].toString();
print(data);

//  Getting   
    List weather_data = data['weather'];
    Map weather_main_data = weather_data[0];


    // air speed
    Map wind = data['wind'];
    double getAir_speed = wind["speed"]/0.2777778;

    String getMain_desc = weather_main_data['main'];
    String getDes = weather_main_data['description'];

 String geticon=weather_main_data['icon'];
 
 // Assigning Value

 temp=getTemp.toStringAsFixed(2);
 description=getDes;
 air_speed=getAir_speed.toStringAsFixed(2);
 humidity=getHumidity;
 main=getMain_desc;
 icon=geticon;

 
 }
 catch(e){
 temp='NA';
 description='NA';
 air_speed="NA";
 humidity='NA';
 main='NA';
icon='02d';
 
  };
}
}
