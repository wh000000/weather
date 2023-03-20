import 'package:geolocator/geolocator.dart';
import 'location_weather.dart';

Position? _currentPosition;
void _getCurrentLocation() async {
  try {
    _currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    final weatherData =
        await getCurrentLocationWeather(_currentPosition!.latitude.toString(),
            _currentPosition!.longitude.toString());
    // Use the weatherData map to display the current weather
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
