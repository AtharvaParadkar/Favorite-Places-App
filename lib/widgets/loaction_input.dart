import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LoactionInput extends StatefulWidget {
  const LoactionInput({super.key});

  @override
  State<LoactionInput> createState() => _LoactionInputState();
}

class _LoactionInputState extends State<LoactionInput> {
  Location? _pickedLocation;
  var _isGettingLocation = false;

  void _getCurrentLocation() async {
    Location location = Location();

    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    setState(() {
      _isGettingLocation = true;
    });

    locationData = await location.getLocation();

    setState(() {
      _isGettingLocation = false;
    });

    debugPrint('$locationData');
  }

  @override
  Widget build(BuildContext context) {
    Widget previewContent = Text(
      'No Location Chosen',
      textAlign: TextAlign.center,
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            color: Theme.of(context).colorScheme.onSecondary,
          ),
    );

    if (_isGettingLocation) {
      previewContent = const CircularProgressIndicator();
    }

    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Theme.of(context)
                  .colorScheme
                  .onPrimaryFixedVariant
                  .withAlpha(128),
            ),
          ),
          child: previewContent,
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: const Text('Get Current Location',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.location_on, color: Colors.white),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Select on map',
                  style: TextStyle(color: Colors.white)),
              icon: const Icon(Icons.map, color: Colors.white),
            ),
          ],
        ),
      ],
    );
  }
}
