import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:golden_soft_test/core/constant/assets.dart';
import 'package:golden_soft_test/core/global/app_input_field.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:golden_soft_test/core/app_manager/color_manager/color_manager.dart';
import 'package:golden_soft_test/core/extention/context_extension.dart';

class MapContainer extends StatefulWidget {
  const MapContainer({Key? key, required this.selectLocation}) : super(key: key);
  final Function(double , double) selectLocation;

  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  late GoogleMapController mapController;
  LatLng? _currentPosition;
  TextEditingController name = TextEditingController();

  double? pickedLatitude;
  double? pickedLongitude;

  @override
  void initState() {
    super.initState();
    _getCurrentLocation();
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<void> _getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );
      setState(() {
        _currentPosition = LatLng(position.latitude, position.longitude);
      });
      mapController.animateCamera(CameraUpdate.newLatLng(_currentPosition!));
    } catch (e) {
      print(e);
    }
  }

  Future<void> _pickLocation() async {
    LatLng? pickedLocation = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FullScreenMap(currentPosition: _currentPosition),
      ),
    );

    if (pickedLocation != null) {
      setState(() {
        _currentPosition = pickedLocation;
        pickedLatitude = pickedLocation.latitude;
        pickedLongitude = pickedLocation.longitude;
      });
      widget.selectLocation(pickedLatitude ??  0.0,pickedLongitude ?? 0.0);
      mapController.animateCamera(CameraUpdate.newLatLng(pickedLocation));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppInputField(
          controller: name,
          hintText: "الموقع الجغراقي",
          labelText: "",
          isRequired: false,
          readOnly: true,
          prefix: Image.asset(Assets.addressImage),
          onTap: () {
            _pickLocation();
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: Container(
            width: context.width(),
            height: context.height(0.2),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: ColorManager.greyColor),
            ),
            child: Padding(
              padding: const EdgeInsets.all(0.9),
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: _currentPosition ?? LatLng( 33.510414, 36.278336),
                  zoom: 7.0,
                ),
                markers: {
                  Marker(
                    markerId: MarkerId('userLocation'),
                    position: _currentPosition ?? LatLng( 33.510414, 36.278336),
                    infoWindow: InfoWindow(title: 'Your Location'),
                  ),
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class FullScreenMap extends StatefulWidget {
  final LatLng? currentPosition;

  FullScreenMap({Key? key, required this.currentPosition}) : super(key: key);

  @override
  _FullScreenMapState createState() => _FullScreenMapState();
}

class _FullScreenMapState extends State<FullScreenMap> {
  late GoogleMapController mapController;
  LatLng? selectedLocation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        onMapCreated: (controller) {
          mapController = controller;
        },
        initialCameraPosition: CameraPosition(
          target: widget.currentPosition ?? LatLng(0.0, 0.0),
          zoom: 2.0,
        ),
        onTap: (LatLng latLng) {
          Navigator.of(context).pop(latLng);
        },
      ),
    );
  }
}