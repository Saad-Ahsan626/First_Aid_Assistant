import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class MapUtils {
  static Future<void> openNearestHospital() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // Explicitly get the current position to ensure precision
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    final Uri googleMapsUrl = Uri.parse(
      "https://www.google.com/maps/search/?api=1&query=hospital+near+${position.latitude},${position.longitude}",
    );

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl, mode: LaunchMode.externalApplication);
    } else {
      return Future.error('Could not open the map in browser.');
    }
  }
}
