import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/models/user.dart';
import 'package:nature_eye_witness_app/services/auth_service.dart';
import 'package:nature_eye_witness_app/view/pages/AuthorityApp.dart';
import 'package:nature_eye_witness_app/view/pages/UserApp.dart';
import 'package:provider/provider.dart';

import 'authenticate/authenticate.dart';
import 'decoration/loader.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    print("wrappr$user");

    if (user == null) {
      return Authenticate();
    } else {
      return FutureBuilder<User>(
        future: AuthService().getDomainUser(user.uid),
        builder: (BuildContext context, AsyncSnapshot<User> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Loader();
          } else {
            if (snapshot.data == null)
              return Authenticate();
            else
              return snapshot.data.accountType == 'Civilian'
                  ? UserApp()
                  : AuthorityApp();
          }
        },
      );
    }
  }
}
