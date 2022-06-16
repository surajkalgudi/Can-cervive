
import 'package:flutter/material.dart';

import 'homeScreen.dart';



class MyHomePage extends StatefulWidget {

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // By defaut, the checkbox is unchecked and "agree" is "false"
  bool agree = false;


  // This function is triggered when the button is clicked
  void _doSomething() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
        builder: (context) =>PatientScreen() ,
    ),
    );
    // Do something
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Center(
            child: Text(
              'Terms And Condition',
              style: TextStyle(
                color: Colors.black,
                backgroundColor: Colors.transparent
              ),

            ),
          ),
        ),
          body: Expanded(
      child: Column(children: [
        Expanded(child: Container(
        ),

        ),
        SafeArea(
          child: Row(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Material(
                    child: Checkbox(
                      checkColor: Colors.white,
                      value: agree,
                      onChanged: (value) {
                        setState(() {
                          agree = value ?? false;
                        });
                      },
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(00, 0, 50, 0),
                child: const Text(
                  'I have read and accept terms and conditions',
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
        ElevatedButton(
            onPressed: agree ? _doSomething : null,
            child: const Text('Continue'))

      ]),
      ),
      ),
    );
  }
}
