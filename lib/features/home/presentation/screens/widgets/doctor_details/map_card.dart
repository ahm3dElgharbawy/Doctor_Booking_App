import 'dart:async';

import 'package:doctor_booking/core/utils/constants/colors.dart';
import 'package:doctor_booking/core/utils/helpers/responsive_helpers/size_helper_extensions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class CustomMapCard extends StatefulWidget {
  const CustomMapCard({super.key, required this.latLong});
  final LatLng latLong;
  @override
  State<CustomMapCard> createState() => _CustomMapCardState();
}

class _CustomMapCardState extends State<CustomMapCard> {
  final Completer<GoogleMapController> controller =
      Completer<GoogleMapController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      height: 200.h,
      decoration: BoxDecoration(
        border: Border.all(
            color: Colors.grey[200]!,
            strokeAlign: BorderSide.strokeAlignOutside),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: widget.latLong,
          zoom: 15.151926040649414,
        ),
        markers: {
          Marker(
            markerId: const MarkerId("1"),
            position: widget.latLong,
          )
        },
        zoomControlsEnabled: false,
        onMapCreated: (GoogleMapController mapController) {
          controller.complete(mapController);
        },
        scrollGesturesEnabled: true,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          // enable scrolling map incase if the map inside ListView
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
      ),
    );
  }
}
