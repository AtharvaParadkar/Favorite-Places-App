import 'package:favorite_places_app/model/place.dart';
import 'package:favorite_places_app/screens/places_detail.dart';
import 'package:flutter/material.dart';

class PlacesList extends StatelessWidget {
  const PlacesList({super.key, required this.places});

  final List<Place> places;

  @override
  Widget build(BuildContext context) {
    return places.isEmpty
        ? Center(
            child: Text(
              'No Places to Show',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
            ),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    places[index].title,
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Theme.of(context).colorScheme.onTertiary
                        ),
                  ),
                  subtitle: Text(
                    places[index].location.address,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          color: Theme.of(context).colorScheme.inversePrimary,
                        ),
                  ),
                  leading: CircleAvatar(
                    radius: 26,
                    backgroundImage: FileImage(places[index].image),
                  ),
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => PlacesDetailScreen(
                        place: places[index],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
  }
}
