import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/services/auth_service.dart';
import 'package:nature_eye_witness_app/view/widgets/wrapper.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(NatureEyeWitnessApp());

class NatureEyeWitnessApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      catchError: (BuildContext context, Object err){
        print('err$err');
        return null;
      },
      value: AuthService().user,
      child: MaterialApp(
        title: "Nature Eye Witness",
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF3EBACE),
          accentColor: Color(0xFFD8EcF1),
          scaffoldBackgroundColor: Color(0xFFF3F5F7),
        ),
        home: Wrapper(),
      ),
    );
  }
}