import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yoga/chat/main.dart';
import 'package:yoga/core/const/color_constants.dart';
import 'package:yoga/core/const/path_constants.dart';
import 'package:yoga/core/const/text_constants.dart';
import 'package:yoga/patientScreen/NavBar.dart';
import 'package:yoga/patientScreen/homeScreen.dart';
import 'package:yoga/screens/home/page/home_page.dart';
import 'package:yoga/screens/settings/settings_screen.dart';
import 'package:yoga/screens/tab_bar/bloc/tab_bar_bloc.dart';
import 'package:yoga/screens/workouts/page/workouts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TabBarPage extends StatelessWidget {

  int selsctedIconIndex = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TabBarBloc>(
      create: (BuildContext context) => TabBarBloc(),
      child: BlocConsumer<TabBarBloc, TabBarState>(
        listener: (context, state) {},
        buildWhen: (_, currState) =>
            currState is TabBarInitial || currState is TabBarItemSelectedState,
        builder: (context, state) {
          final bloc = BlocProvider.of<TabBarBloc>(context);
          return Scaffold(
            body: _createBody(context, bloc.currentIndex),
            bottomNavigationBar: CurvedNavigationBar(

              index: selsctedIconIndex,

              height: 60.0,

              onTap: (index) {
                selsctedIconIndex = index;
              },
              animationDuration: Duration(
                milliseconds: 200,
              ),
              items: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  MyApp()));

                  },
                  child: Icon(Icons.add, size: 30
                      ,color: Colors.black54),
                ),
                GestureDetector(
                  onTap: ()
                  {
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  TabBarPage()));
                  },
                  child: Icon(Icons.search, size: 30,
                      color: Colors.black54),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  PatientScreen()));
                  },
                  child: Icon(Icons.home_outlined, size: 30,
                      color: Colors.black54),
                ),

                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  WorkoutsPage()));
                  },
                  child: Icon(Icons.favorite_border_outlined, size: 30,
                      color: Colors.black54),
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) =>  NavBar()));
                  },
                  child: Icon(Icons.person_outline, size: 30
                      ,color: Colors.black54),
                ),
              ],
              color: Colors.white,
              buttonBackgroundColor: Colors.white,
              backgroundColor: Colors.grey,
              animationCurve: Curves.easeInOut,
            ),
          );
        },
      ),
    );
  }

  // Widget _createdBottomTabBar(BuildContext context) {
  //   final bloc = BlocProvider.of<TabBarBloc>(context);
  //   return BottomNavigationBar(
  //     currentIndex: bloc.currentIndex,
  //     fixedColor: ColorConstants.primaryColor,
  //     items: [
  //       BottomNavigationBarItem(
  //         icon: Image(
  //           image: AssetImage(PathConstants.home),
  //           color: bloc.currentIndex == 0 ? ColorConstants.primaryColor : null,
  //         ),
  //         label: TextConstants.homeIcon,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image(
  //           image: AssetImage(PathConstants.workouts),
  //           color: bloc.currentIndex == 1 ? ColorConstants.primaryColor : null,
  //         ),
  //         label: TextConstants.workoutsIcon,
  //       ),
  //       BottomNavigationBarItem(
  //         icon: Image(
  //           image: AssetImage(PathConstants.settings),
  //           color: bloc.currentIndex == 2 ? ColorConstants.primaryColor : null,
  //   ),
  //   label: TextConstants.settingsIcon,
  //   ),
  //   ],
  //   onTap: (index) {
  //   bloc.add(TabBarItemTappedEvent(index: index));
  //   },
  //   );
  // }

  Widget _createBody(BuildContext context, int index) {
    final children = [
      HomePage(),
      WorkoutsPage(),
      SettingsScreen()
      // Scaffold(
      //   body: Center(
      //     child: RawMaterialButton(
      //       fillColor: Colors.red,
      //       child: Text(
      //         TextConstants.signOut,
      //         style: TextStyle(
      //           color: ColorConstants.white,
      //         ),
      //       ),
      //       onPressed: () {
      //         AuthService.signOut();
      //         Navigator.pushReplacement(
      //           context,
      //           MaterialPageRoute(builder: (_) => SignInPage()),
      //         );
      //       },
      //     ),
      //   ),
      // ),
    ];
    return children[index];
  }
}
