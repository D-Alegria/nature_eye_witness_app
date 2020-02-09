import 'package:cloudinary_client/cloudinary_client.dart';
import 'package:cloudinary_client/models/CloudinaryResponse.dart';
import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/models/alert.dart';
import 'package:nature_eye_witness_app/models/user.dart';
import 'package:nature_eye_witness_app/services/alert_service.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/button_widget.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/constants.dart';
import 'package:provider/provider.dart';

class CreateAlertForm extends StatefulWidget {
  final Function loader;
  final String imagepath;

  const CreateAlertForm({Key key, this.loader, this.imagepath})
      : super(key: key);

  @override
  _CreateAlertFormState createState() => _CreateAlertFormState();
}

class _CreateAlertFormState extends State<CreateAlertForm> {
  final _formKey = GlobalKey<FormState>();
  String description = '';
  String location = '';
  String imageURL = '';
  String error = '';

  final CloudinaryClient client = CloudinaryClient(
      "658569538144662", "KLeE66q_ppABGn0JZhGgOF2h_Qk", "demilade");

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<User>(context);

    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Text("Report Bad guys",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
            SizedBox(
              height: 10,
            ),
            Text(
              error,
              style: TextStyle(color: Colors.red, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: 'Description',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Description is required';
                }
                return null;
              },
              onChanged: (val) {
                setState(() {
                  description = val;
                });
              },
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: textInputDecoration.copyWith(
                hintText: 'Location',
              ),
              validator: (value) {
                if (value.isEmpty) {
                  return 'Location is required';
                }
                return null;
              },
              onChanged: (val) {
                setState(() {
                  location = val;
                });
              },
            ),
            Button(
              action: () async {
                if (_formKey.currentState.validate()) {
                  Navigator.pop(context);
                  widget.loader();
                  print('description$description');
                  print('location$location');

                  CloudinaryResponse response =
                      await client.uploadImage(widget.imagepath);
                  print("response$response");
                  Alert alert = Alert(
                    description: description,
                    location: location,
                    userId: user.uid,
                    imageURL: response.url,
                    createdAt: DateTime.now().toUtc(),
                  );

                  dynamic result = await AlertService().createAlert(alert);
                  if (result == null) {
                    widget.loader();
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        // duration: Duration(seconds: 10),
                        content: Text("Successfully reported those guys"),
                        // elevation: 3,
                      ),
                    );
                  }
                }
              },
              name: "Create",
            ),
          ],
        ),
      ),
    );
  }
}
