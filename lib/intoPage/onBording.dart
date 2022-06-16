// import 'package:canceryogi/screen/loginPage/loginPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yoga/screens/sign_up/page/sign_up_page.dart';


import '../loginPage/loginPage.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {

  final int _numPages = 4;
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  List<Widget> _buildPageIndicator() {
    List<Widget> list = [];
    for (int i = 0; i < _numPages; i++) {
      list.add(i == _currentPage ? _indicator(true) : _indicator(false));
    }
    return list;
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 150),
      margin: EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 24.0 : 16.0,
      decoration: BoxDecoration(
        color: isActive ? Colors.blueAccent : Color(0xFF7B51D3),
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.light,
          child: Container(

            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.1, 0.4, 0.7, 0.9],
                colors: [
                  // Color(0xFF3594DD),
                  // Color(0xFF4563DB),
                  // Color(0xFF5036D5),
                  // Color(0xFF5B16D0),
                  Colors.white,
                  Colors.white,
                  Colors.white,
                  Colors.white,
                ],
              ),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    alignment: Alignment.centerRight,
                    child: FlatButton(
                      onPressed: () {
                          goToHome(context);
                      },
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 500.0,
                    child: PageView(
                      physics: ClampingScrollPhysics(),
                      controller: _pageController,
                      onPageChanged: (int page) {
                        setState(() {
                          _currentPage = page;
                        });
                      },
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/1.jpg',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Center(
                                child: Text(
                                  'Every moment is a fresh beginning.',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 27
                                  ),
                                ),
                              ),
                              SizedBox(height: 15.0)
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/3.jpg',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 30.0),
                              Center(
                                child: Text(
                                  'At your service, always.',
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                        fontSize: 27
                                ),
                                ),
                              ),
                              SizedBox(height: 15.0),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/5.jpg',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 25.0),
                              Center(
                                child: Text(
                                    'Yoga is the journey of self to the self.',
                                    style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 27,

                                ),
                                ),

                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(30.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const <Widget>[
                              Center(
                                child: Image(
                                  image: AssetImage(
                                    'assets/images/4.jpg',
                                  ),
                                  height: 300.0,
                                  width: 300.0,
                                ),
                              ),
                              SizedBox(height: 20.0),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                child: Text(
                                  'Once you choose hope, anything is possible.',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 26,
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.0),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: _buildPageIndicator(),
                  ),
                  _currentPage != _numPages-1
                      ? Expanded(
                    child: Align(
                      alignment: FractionalOffset.bottomRight,
                      child: FlatButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.ease,
                          );
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Text(
                              'Next',
                              style: TextStyle(
                                color: Colors.blueAccent,
                                fontSize: 22.0,
                              ),
                            ),
                            SizedBox(width: 10.0),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.blue,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ),
                    ),
                  )
                      : Text(''),

                ],
              ),
            ),
          ),
        ),
        bottomSheet: _currentPage == 3
            ? Container(
          height: 95.0,
          width: double.infinity,
          color: Colors.white,
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushReplacement(
  MaterialPageRoute(builder: (_) =>SignUpPage() ));

            },
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: Text(
                  'Get started',
                  style: TextStyle(
                    color: Colors.blueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
          ),
        )
            : Text(''),
      ),
    );
  }
}
 void goToHome(context) =>
     Navigator.of(context).pushReplacement(
     MaterialPageRoute(builder: (_) =>SignUpPage() ),
   );