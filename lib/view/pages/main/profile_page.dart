import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/models/user.dart';
import 'package:nature_eye_witness_app/services/auth_service.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final AuthService _authService = AuthService();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Container(
            height: 210,
            child: Stack(
              children: <Widget>[
                Container(
                  height: 195,
                  margin: EdgeInsets.all(17),
                  decoration: BoxDecoration(
                      color: Color.fromRGBO(243, 243, 243, 1),
                      boxShadow: [
                        BoxShadow(
                            color: Color.fromRGBO(255, 255, 255, 0.77),
                            blurRadius: 6,
                            offset: Offset(-3, -3)),
                        BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.16),
                            blurRadius: 6,
                            offset: Offset(3, 3))
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                ),
                Container(
                  margin: EdgeInsets.only(left: 40),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 80,
                        width: 80,
//                    margin: EdgeInsets.only(top: 60, left: 40),
                        decoration: BoxDecoration(
                            color: Color.fromRGBO(243, 243, 243, 1),
                            boxShadow: [
                              BoxShadow(
                                  color: Color.fromRGBO(255, 255, 255, 0.77),
                                  blurRadius: 6,
                                  offset: Offset(-3, -3)),
                              BoxShadow(
                                  color: Color.fromRGBO(0, 0, 0, 0.16),
                                  blurRadius: 6,
                                  offset: Offset(3, 3))
                            ],
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Welcome",
                              textAlign: TextAlign.right,
                              style: TextStyle(),
                            ),
                            Text(
                              user.username??"User",
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(
            children: <Widget>[
//              Container(child: ListTile(leading: Icon(Icons.account_circle),),decoration: BoxDecoration(color: Colors.white),)
//              Container(
//                child: Row(
//                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                  children: <Widget>[
//                    Container(
//                      margin: EdgeInsets.only(left: 17),
//                      width: 45,
//                      height: 45,
//                      decoration: BoxDecoration(
//                          color: Colors.white,
//                          boxShadow: [
//                            BoxShadow(
//                                color: Color.fromRGBO(255, 255, 255, 0.77),
//                                blurRadius: 6,
//                                offset: Offset(-3, -3)),
//                            BoxShadow(
//                                color: Color.fromRGBO(0, 0, 0, 0.44),
//                                blurRadius: 6,
//                                offset: Offset(3, 3))
//                          ],
//                          borderRadius: BorderRadius.all(Radius.circular(5))),
//                    ),
//                    Expanded(child: Container(margin: EdgeInsets.only(left: 10),child: Text("Availability",style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                        letterSpacing: 2,
//                        fontSize: 18),),),),
//                    Container(
//                      child: Row(
//                        mainAxisAlignment:MainAxisAlignment.spaceBetween,children: <Widget>[
//                      Text(
//                        "On",
//                        style: TextStyle(
//                            fontWeight: FontWeight.bold,
//                            letterSpacing: 2,
//                            fontSize: 18),
//                      ),
//                      Icon(Icons.arrow_forward_ios)
//                    ],),)
//                  ],
//                ),
//              ),
              SizedBox(height: 10,),
              ListTile(title: Text("Logout"),leading: Icon(Icons.person),onTap: ()async{
                await _authService.signOut();
              },)
            ],
          ),
        ],
      ),
    );
  }
}
