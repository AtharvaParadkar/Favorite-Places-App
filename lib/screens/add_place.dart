import 'package:flutter/material.dart';

class AddPlaceScreen extends StatefulWidget {
  const AddPlaceScreen({super.key});

  @override
  State<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController = TextEditingController();

    // ignore: unused_element
    void dispose() {
      titleController.dispose();
      super.dispose();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add New Place',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            Column(
              spacing: 10,
              children: [
                TextField(
                  controller: titleController,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    label: Text(
                      'Title',
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: (){},
                  icon: const Icon(Icons.add),
                  label: const Text('Add Place'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
