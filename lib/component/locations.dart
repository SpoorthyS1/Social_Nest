import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class LocationService {
  /// Fetches the current geographical position of the device.
  Future<Position> getGeoLocationPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw Exception('Location permissions are denied.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw Exception(
          'Location permissions are permanently denied, cannot request permissions.');
    }

    // Return the current position of the device.
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  /// Converts latitude and longitude to a human-readable address.
  Future<String> getAddressFromLatLong(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      return '${place.street}, ${place.subLocality}, ${place.locality}, ${place.postalCode}, ${place.country}';
    } catch (e) {
      throw Exception('Failed to get address: $e');
    }
  }

  Future<String> getSublocality(Position position) async {
    try {
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      return '${place.subLocality}';
    } catch (e) {
      throw Exception('Failed to get sublocality: $e');
    }
  }
}
