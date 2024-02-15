import 'dart:convert' as convert;

import 'package:http/http.dart' as http;

class LocationService {
  final String key = 'AIzaSyAPHLy53RU05Kh0TXtLh19tEAhzgnQcIpk';
  Future<String> getPlaceId(String input) async {
    final String url =
        'https://maps.googleapis.com/maps/api/place/findplacefromtext/json?input=$input&inputtype=textquery&key=AIzaSyAPHLy53RU05Kh0TXtLh19tEAhzgnQcIpk';
    var response = await http.get(Uri.parse(url));
    var json = convert.jsonDecode(response.body);
    var placeId = json['cantidate'][0]['place_id'] as String;
    print(placeId);
    return placeId;
  }

  // Future<Map<String, dynamic>> getPlaced(String input) {
  //   final String = 'https://maps.googleapis.com/maps/api/place/details/json?place_id=$placeId&key=AIzaSyDtVKtGJUfuOMASrRiXmri75C8a2IO93lQ';
  // }
}
