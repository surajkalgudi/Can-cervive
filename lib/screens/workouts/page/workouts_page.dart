import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:yoga/patientScreen/NavBar.dart';
import 'package:yoga/patientScreen/homeScreen.dart';
import 'package:yoga/screens/workout_details_screen/page/workout_details_page.dart';
import 'package:yoga/screens/workouts/bloc/workouts_bloc.dart';
import 'package:yoga/screens/workouts/widget/workout_content.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../tab_bar/page/tab_bar_page.dart';

class WorkoutsPage extends StatelessWidget {

  int selsctedIconIndex = 3;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _buildContext(context),
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
            Icon(Icons.add, size: 30
                , color: Colors.black54),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => TabBarPage()));
              },
              child: Icon(Icons.search, size: 30,
                  color: Colors.black54),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => PatientScreen()));

              },
              child: Icon(Icons.home_outlined, size: 30,
                  color: Colors.black54),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => WorkoutsPage()));
              },
              child: Icon(Icons.favorite_border_outlined, size: 30,
                  color: Colors.black54),
            ),
            GestureDetector(
              onTap: (){
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (_) => NavBar()));
              },
              child: Icon(Icons.person_outline, size: 30
                  , color: Colors.black54),
            ),
          ],
          color: Colors.white,
          buttonBackgroundColor: Colors.white,
          backgroundColor: Colors.grey,
          animationCurve: Curves.easeInOut,
        )
    );
  }

    BlocProvider<WorkoutsBloc> _buildContext(BuildContext context) {
      return BlocProvider<WorkoutsBloc>(
        create: (context) => WorkoutsBloc(),
        child: BlocConsumer<WorkoutsBloc, WorkoutsState>(
          buildWhen: (_, currState) => currState is WorkoutsInitial,
          builder: (context, state) {
            return WorkoutContent();
          },
          listenWhen: (_, currState) => currState is CardTappedState,
          listener: (context, state) {
            if (state is CardTappedState) {
              Navigator.of(context, rootNavigator: true).push(
                MaterialPageRoute(
                  builder: (_) => WorkoutDetailsPage(workout: state.workout),
                ),
              );
            }
          },
        ),
      );
    }
  }
