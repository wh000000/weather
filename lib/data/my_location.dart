import 'package:geolocator/geolocator.dart';

class MyLocation {
  late double lat;
  late double lon;

  Future<void> getMyCurrentLocation() async {
    try {
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

      lat = position.latitude;
      lon = position.longitude;
      print(lat);
      print(lon);
    } catch (e) {
      print('no');
    }
  }
}
