import 'package:flutter/material.dart';
import 'package:yoga/patientScreen/NavBar.dart';
import 'package:yoga/patientScreen/homeScreen.dart';

class Mcq extends StatefulWidget {


  @override
  State<Mcq> createState() => _McqState();
}
List<String> question=[
  '1. I have a lack of energy',
  '2. I have nausea',
  '3. Because of my physical condition, I have trouble meeting the needs of my family',
  '4. I have pain',
  '5. I am bothered by side effects of treatment'
];
List<String> answer=[
  'at all',
  'bit',
  'a bit',
  'much'
];

int _site=0;
class _McqState extends State<Mcq> {
  int _value=1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Questionaries')),
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                  icon: const Icon(Icons.arrow_back,
                    color: Colors.black,),
                  onPressed: () {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => PatientScreen()));
                  }
              );
            },
          ),
        ),
        body: ListView(
          children:[
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                Text('PHYSICAL WELL BEING:',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(question[0],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                    ),
                    for (int i = 0; i <4; i++)
                      ListTile(
                        title: Text(
                          answer[i],
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                        ),
                        leading: Radio(
                          value: 0,
                          groupValue: _value,
                          activeColor: Color(0xFF6200EE),
                          onChanged:  (value) {
                            setState(() {
                              _value = i;
                              value=1;
                            });
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(question[1],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                    ),
                    for (int i = 0; i <4; i++)
                      ListTile(
                        title: Text(
                          answer[i],
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                        ),
                        leading: Padding(
                          padding: const EdgeInsets.only(top:1),
                          child: Radio(
                            value: 0,
                            groupValue: _value,
                            activeColor: Color(0xFF6200EE),
                            onChanged:  (value) {
                              setState(() {
                                _value = i;
                                value=1;
                              });
                            },
                          ),
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(question[2],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                    ),
                    for (int i = 0; i <4; i++)
                      ListTile(
                        title: Text(
                          answer[i],
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                        ),
                        leading: Radio(
                          value: 0,
                          groupValue: _value,
                          activeColor: Color(0xFF6200EE),
                          onChanged:  (value) {
                            setState(() {
                              _value = i;
                              value=1;
                            });
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(question[3],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                    ),
                    for (int i = 0; i <4; i++)
                      ListTile(
                        title: Text(
                          answer[i],
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                        ),
                        leading: Radio(
                          value: 0,
                          groupValue: _value,
                          activeColor: Color(0xFF6200EE),
                          onChanged:  (value) {
                            setState(() {
                              _value = i;
                              value=1;
                            });
                          },
                        ),
                      ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Text(question[4],
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400
                        ),),
                    ),
                    for (int i = 0; i <4; i++)
                      ListTile(
                        title: Text(
                          answer[i],
                          style: Theme
                              .of(context)
                              .textTheme
                              .subtitle1
                              ?.copyWith(color: i == 4 ? Colors.black38 : Colors.black),
                        ),
                        leading: Radio(
                          value: 0,
                          groupValue: _value,
                          activeColor: Color(0xFF6200EE),
                          onChanged:  (value) {
                            setState(() {
                              _value = i;
                              value=1;
                            });
                          },
                        ),
                      ),
                  ],
                )
              ]
          ),
      ]
        )
    );
  }
}