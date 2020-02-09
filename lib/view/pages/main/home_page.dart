import 'package:flutter/material.dart';
import 'package:nature_eye_witness_app/services/endanger_species_service.dart';
import 'package:nature_eye_witness_app/view/widgets/decoration/loader.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: EndangeredSpeciesService().fetchPost(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Loader();
        } else {
          if (snapshot.data == null)
            return Center(
              child: Text("An Error Occurred"),
            );
          else
            return ListView.builder(
              itemCount: snapshot.data['allSpecies'].length,
              itemBuilder: (context, index) {
                return Card(
                  margin: EdgeInsets.all(20),
                  child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.all(10),
                    child: Column(
                      children: <Widget>[
                        Text("${snapshot.data['allSpecies'][index]['name']}", style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                        SizedBox(height: 20,),
                        Container(child: Image.network("http://www.bloowatch.org${snapshot.data['allSpecies'][index]['image']['url']}"),),
                        Text("${snapshot.data['allSpecies'][index]['description']}", style: TextStyle(fontSize: 18),)
                      ],
                    ),
                  ),
                );
              },
            );
        }
      },
    );
  }
}
