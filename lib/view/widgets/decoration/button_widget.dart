import 'package:flutter/material.dart';

class Button extends StatelessWidget {

  final Function action;
  final String name;

  const Button({Key key, @required this.action,@required this.name}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: action,
          child: Container(
            alignment: Alignment.center,
            child: Text("$name",textAlign: TextAlign.center,style:TextStyle(fontWeight: FontWeight.bold, fontSize: 30,color: Colors.white) ,),
            width: double.infinity,
            height: 59,
            decoration: BoxDecoration(
                color: Color.fromRGBO(59 , 48, 210, 1),
                boxShadow: [
                  BoxShadow(
                      color: Color.fromRGBO(0, 0, 0, 0.44),
                      blurRadius: 6,
                      offset: Offset(3, 3))
                ],
                borderRadius: BorderRadius.all(Radius.circular(5))),
          ),
        ),
    );
  }
}
