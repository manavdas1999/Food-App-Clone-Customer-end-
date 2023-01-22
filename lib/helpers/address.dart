// Contains all the functions needed to get users current address using Reverse geolocation.

import 'dart:core';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:food_customer_app/components/errorDialogBox.dart';

Future<List<String>> getPlacemarks(double latitude, double longitude) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(latitude, longitude);

  String address1 = "${placemarks[0].street}, ${placemarks[0].thoroughfare}";
  String address2 =
      "${placemarks[0].subLocality},${placemarks[0].locality},${placemarks[0].postalCode}";
  return [address1, address2];
}

Future<List<String>> getAddress() async {
  // Determine the current position of the device.

  // When the location services are not enabled or permissions are denied the it will show an error.

  bool serviceEnabled;
  LocationPermission permission;
  String errorMessage;

  // Test if location services are enabled.
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
    // Location services are not enabled don't continue accessing the position and request users of the App to enable the location services.
    errorMessage = 'Location services are disabled.';
    printDialog(errorMessage);
  }

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    // if Location services are denied then ask again.
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      // Permissions are denied
      errorMessage = 'Location permissions are denied';
      printDialog(errorMessage);
    }
  }

  if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, user has to change it manually.
    errorMessage =
        'Location permissions are permanently denied, change it from phone settings.';
    printDialog(errorMessage);
  }

  // When we reach here, permissions are granted and we can
  // continue accessing the position of the device.
  if (serviceEnabled && (permission != LocationPermission.denied)) {
    Position position = await Geolocator.getCurrentPosition();

    List<String> address =
        await getPlacemarks(position.latitude, position.longitude);

    return address;
  } else {
    return [];
  }
}
