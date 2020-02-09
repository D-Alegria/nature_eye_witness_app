import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/models/alert.dart';
import 'package:nature_eye_witness_app/services/alert_service.dart';
import 'package:nature_eye_witness_app/view/pages/main/alert_description_page.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/loader.dart';

class AlertPage extends StatefulWidget {
  @override
  _AlertPageState createState() => _AlertPageState();
}

class _AlertPageState extends State<AlertPage> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AlertService().alerts,
      builder: (context, snap) {
        if (snap.hasData && !snap.hasError && snap.data != null) {
          Event snapshot = snap.data;

          List<Alert> item = [];
          Map<dynamic, dynamic> map = {};

          map = snapshot.snapshot.value;
          map.values.forEach(
            (f) {
              print('f$f');
              if (f != null) {
                print("object${Alert.fromJson(f)}");
                item.add(new Alert.fromJson(f));
              }
            },
          );

          return snapshot.snapshot.value == null
              ? SizedBox()
              : Scaffold(
                  appBar: AppBar(
                    centerTitle: true,
                    backgroundColor: Colors.black,
                    title: Text(
                      "ALERTS",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
                    ),
                  ),
                  body: ListView.separated(
                    itemBuilder: (context, index) {
                      print('item[index]${item[index]}');
                      return ListTile(
                        trailing: Text("${item[index].createdAt.toUtc().toString().substring(0,11)}"),
                        title: Text("${item[index].description}", style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => AlertDescription(
                                alert: item[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    itemCount: item.length, separatorBuilder: (BuildContext context, int index) {
                      return Divider(height: 5,);
                    },
                  ),
                );
        } else {
          return Loader();
        }
      },
    );
  }
}
