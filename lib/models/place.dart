import 'package:flutter/foundation.dart';
import 'dart:io';

class Location {
  final double longitude;
  final double latitude;
  final String address;

  const Location({@required this.longitude, @required this.latitude, this.address });
}

class Place {
  final String id;
  final String title;
  final Location location;
  final File image;

  Place({
    @required this.id,
    @required this.title,
    @required this.location,
    @required this.image,
  });
}