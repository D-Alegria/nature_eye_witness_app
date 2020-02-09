import 'dart:convert';

import 'package:http/http.dart' as http;

class EndangeredSpeciesService {
  //get all endangered species

  Future fetchPost() async {
  final response =
      await http.get('http://www.bloowatch.org/developers/json/species');

  if (response.statusCode == 200) {
    // If server returns an OK response, parse the JSON.
    print(json.decode(response.body));
    return json.decode(response.body);
  } else {
    // If that response was not OK, throw an error.
    throw Exception('Failed to load post');
  }
}

}
