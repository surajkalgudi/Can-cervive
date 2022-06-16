import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:yoga/patientScreen/homeScreen.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:yoga/core/const/color_constants.dart';
import 'package:yoga/core/const/path_constants.dart';
import 'package:yoga/core/const/text_constants.dart';
import 'package:yoga/core/service/auth_service.dart';
import 'package:yoga/questionaries/mcq.dart';
import 'package:yoga/screens/common_widgets/settings_container.dart';
import 'package:yoga/screens/edit_account/edit_account_screen.dart';
import 'package:yoga/screens/reminder/page/reminder_page.dart';
import 'package:yoga/screens/settings/bloc/bloc/settings_bloc.dart';
import 'package:yoga/screens/sign_in/page/sign_in_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

class NavBar extends StatelessWidget {
  String? photoUrl;
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Scaffold(body: _buildContext(context)));
  }

  BlocProvider<SettingsBloc> _buildContext(BuildContext context) {
    return BlocProvider<SettingsBloc>(
      create: (context) => SettingsBloc(),
      child: BlocConsumer<SettingsBloc, SettingsState>(
        buildWhen: (_, currState) => currState is SettingsInitial,
        builder: (context, state) {
          return _settingsContent(context);
        },
        listenWhen: (_, currState) => true,
        listener: (context, state) {},
      ),
    );
  }

  Widget _settingsContent(BuildContext context) {
    final User? user = FirebaseAuth.instance.currentUser;
    final displayName = user?.displayName ?? "No Username";
    photoUrl = user?.photoURL ?? null;
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
          child: Column(children: [
            Stack(alignment: Alignment.topRight, children: [
              Center(
                child: photoUrl == null
                    ? CircleAvatar(backgroundImage: AssetImage(PathConstants.profile), radius: 60)
                    : CircleAvatar(
                  child: ClipOval(
                      child: FadeInImage.assetNetwork(
                        placeholder: PathConstants.profile,
                        image: photoUrl!,
                        fit: BoxFit.cover,
                        width: 200,
                        height: 120,
                      )),
                  radius: 60,
                ),
              ),
              TextButton(
                  onPressed: () async {
                    await Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountScreen()));
                    // setState(() {
                    //   photoUrl = user?.photoURL ?? null;
                    // });
                  },
                  style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: ColorConstants.primaryColor.withOpacity(0.16)),
                  child: Icon(Icons.edit, color: ColorConstants.primaryColor)),
            ]),
            SizedBox(height: 15),
            Text(displayName, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 15),
            // SettingsContainer(
            //   child: Text(TextConstants.reminder, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
            //   withArrow: true,
            //   onTap: () {
            //     Navigator.push(context, MaterialPageRoute(builder: (_) => ReminderPage()));
            //   },
            // ),
              SettingsContainer(
                child: Text('Personal Information ',
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                },
              ),
            SettingsContainer(
              child: Text('Questionnaire',
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
              onTap: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Mcq()));
              },
            ),
            SettingsContainer(
                onTap: () {}, child: Text(TextConstants.terms, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))),
            SettingsContainer(
                child: Text(TextConstants.signOut, style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500)),
                onTap: () {
                  AuthService.signOut();
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => SignInPage()),
                  );
                }),
            // SizedBox(height: 15),
            // Text(TextConstants.joinUs, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            // SizedBox(height: 15),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     TextButton(
            //         onPressed: () => launch('https://www.facebook.com/perpetio/'),
            //         style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
            //         child: Image.asset(PathConstants.facebook)),
            //     TextButton(
            //         onPressed: () => launch('https://www.instagram.com/perpetio/'),
            //         style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
            //         child: Image.asset(PathConstants.instagram)),
            //     TextButton(
            //         onPressed: () => launch('https://twitter.com/perpetio'),
            //         style: TextButton.styleFrom(shape: CircleBorder(), backgroundColor: Colors.white, elevation: 1),
            //         child: Image.asset(PathConstants.twitter)),
            //   ],
            // )
          ]),
        ),
      ),
    );
  }
}































//       child: ListView(
//         // Remove padding
//         padding: EdgeInsets.zero,
//         children: [
//           UserAccountsDrawerHeader(
//             accountName: Text('Suraj Kalgudi'),
//             accountEmail: Text('surajkalgudi@gmail.com'),
//             currentAccountPicture: CircleAvatar(
//               child: ClipOval(
//                 child: Image.network(
//                   'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.pinterest.com%2Fpin%2F501940320971441032%2F&psig=AOvVaw3GpB9vJMGdJ7ZVCVAnwkB3&ust=1651160706510000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCJDQrY7LtPcCFQAAAAAdAAAAABAD',
//                   fit: BoxFit.cover,
//                   width: 90,
//                   height: 90,
//                 ),
//               ),
//             ),
//             decoration: BoxDecoration(
//               color: Colors.blue,
//               image: DecorationImage(
//                   fit: BoxFit.fill,
//                   image: NetworkImage(
//                       'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.vectorstock.com%2Froyalty-free-vector%2Fyoung-man-profile-vector-14770074&psig=AOvVaw1rn4sJ9WzW7TyeOHVRQZqT&ust=1651160744728000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCODQ9qHLtPcCFQAAAAAdAAAAABAD')),
//             ),
//           ),
//           ListTile(
//             leading: Icon(Icons.favorite),
//             title: Text('Personel detials'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.person),
//             title: Text('Doctor'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.workspaces_outline),
//             title: Text('Trainer'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.notifications),
//             title: Text('Request'),
//           ),
//           Divider(),
//           ListTile(
//             leading: Icon(Icons.settings),
//             title: Text('Settings'),
//             onTap: () => null,
//           ),
//           ListTile(
//             leading: Icon(Icons.description),
//             title: Text('Policies'),
//             onTap: () => null,
//           ),
//           Divider(),
//           ListTile(
//             title: Text('Exit'),
//             leading: Icon(Icons.exit_to_app),
//             onTap: () => PatientScreen(),
//           ),
//         ],
//       ),
//     );
//   }
// }