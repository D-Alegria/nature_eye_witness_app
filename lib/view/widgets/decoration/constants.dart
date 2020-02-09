import 'package:flutter/material.dart';

const textInputDecoration = InputDecoration(
  focusColor: Colors.red,
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Color.fromRGBO(56, 48, 210, 1), width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 1.5),
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
  ),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.red),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(5.0)),
    borderSide: BorderSide(color: Colors.red),
  ),
);

const containerDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Color.fromRGBO(0, 0, 0, 0.33),
      blurRadius: 6,
      offset: Offset(3, 3),
    )
  ],
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
