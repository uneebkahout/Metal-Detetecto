import 'package:flutter/material.dart';

class locationPage extends StatefulWidget {
  const locationPage({super.key});

  @override
  State<locationPage> createState() => _locationPageState();
}

class _locationPageState extends State<locationPage> {
  String selectedCountry='Choose your Location';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.cyanAccent.shade400,
        title: Text(
          'Choose your location',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
      body: Center(
        child: Container(
          
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
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
              Container(
                // margin: EdgeInsets.fromLTRB(100, 0, 100, 0),
                width: 300,
          
                child: DropdownButton<String>(
                  isExpanded: true,
                  disabledHint: Text('Choose your location'),
                  value: selectedCountry,
                    
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedCountry=newValue!;
                    });
                  },
                  items:<String>['Choose your Location','Pakistan','India','Canda','USA','Dubai'].map<DropdownMenuItem<String>>((String value){
return DropdownMenuItem<String>(
  value: value,
  child: Text(value));
                  }).toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
