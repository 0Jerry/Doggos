import 'dart:convert';
import 'dart:io';

class Dog {
  final String name;
  final String location;
  final String description;
  String imageUrl;

  int rating = 10;

  Dog(this.name, this.location, this.description);

  Future getImageUrl() async {
    if (imageUrl != null) {
      return;
    }

    HttpClient http = new HttpClient();
    try {
      var uri = Uri.http("dog.ceo", "/api/breeds/image/random");
      var request = await http.getUrl(uri);
      var response = await request.close();
      var responseBody = await utf8.decoder.bind(response).join();

      imageUrl = json.decode(responseBody)['message'];

    } catch (e) {
      print(e);
    }
  }

}