import 'package:favorite_places_app/screens/add_place.dart';
import 'package:favorite_places_app/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatefulWidget {
  const PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Your Places',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          actions: [
            IconButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const AddPlaceScreen(),
                ),
              ),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ],
        ),
        body: const PlacesList(places: []));
  }
}
