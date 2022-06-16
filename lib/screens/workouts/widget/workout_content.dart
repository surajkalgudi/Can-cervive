import 'package:yoga/core/const/color_constants.dart';
import 'package:yoga/core/const/data_constants.dart';
import 'package:yoga/data/workout_data.dart';
import 'package:yoga/screens/workouts/widget/workout_card.dart';
import 'package:flutter/material.dart';

class WorkoutContent extends StatelessWidget {
  WorkoutContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorConstants.homeBackgroundColor,
      height: double.infinity,
      width: double.infinity,
      child: _createHomeBody(context),
    );
  }

  Widget _createHomeBody(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text('Workouts',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 5),
          Expanded(
            child: ListView(
              children: DataConstants.workouts
                  .map(
                    (e) => _createWorkoutCard(e),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _createWorkoutCard(WorkoutData workoutData) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: WorkoutCard(workout: workoutData),
    );
  }
}
