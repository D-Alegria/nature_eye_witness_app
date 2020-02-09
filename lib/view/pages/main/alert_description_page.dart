import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/models/alert.dart';

class AlertDescription extends StatelessWidget {
  final Alert alert;

  const AlertDescription({Key key, this.alert}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black12,
        title: Text("Alert", style: TextStyle(color: Colors.white),),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          Text("${alert.description}"),
          Text("${alert.location}"),
          Text("${alert.createdAt}"),
          Container(
            height: 200,
            width: 200,
            child: Image.network(alert.imageURL??""),
          )
        ],
      ),
    );
  }
}
