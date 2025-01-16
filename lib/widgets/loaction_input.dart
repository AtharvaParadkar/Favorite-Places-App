import 'package:flutter/material.dart';

class LoactionInput extends StatefulWidget {
  const LoactionInput({super.key});

  @override
  State<LoactionInput> createState() => _LoactionInputState();
}

class _LoactionInputState extends State<LoactionInput> {
  @override
  Widget build(BuildContext context) {
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
          child: Text(
            'No Loaction Chosen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton.icon(
              onPressed: () {},
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
