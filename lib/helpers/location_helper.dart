import 'package:http/http.dart' as http;
import 'dart:convert';

const GOOGLE_API_KEY = 'AIzaSyDuC64IhqlEKH7WtHmm-zaegmlSE1Y4rmE';

class LocationHelper {
  static String generateLocationPreviewImage(double lat, double lng) {
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:C%7C$lat,$lng&key=$GOOGLE_API_KEY';
  }

  static Future<String> getPlaceAddress(double lat, double lng)  async {
    String url = 'https://maps.googleapis.com/maps/api/geocode/json?latlng=$lat,$lng&key=$GOOGLE_API_KEY';

    final response = await http.get(url);
    print(json.decode(response.body)['results']);
    return json.decode(response.body)['results'][0]['formatted_address'];
  }
}