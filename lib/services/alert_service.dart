import 'package:firebase_database/firebase_database.dart';
import 'package:nature_eye_witness_app/models/alert.dart';

class AlertService {
  final DatabaseReference alertDatabase =
      FirebaseDatabase.instance.reference().child('all-alerts');


  //Create alert
  Future createAlert(Alert alert) async {
    try {
      print('json${alert.toJson()}');
      await alertDatabase.push().set(alert.toJson());
    } catch (e) {
      print(e);
    }
  }

  //update alert

  //delete alert

  //view alert
  Stream get alerts {
    return alertDatabase.onValue;
  }

}