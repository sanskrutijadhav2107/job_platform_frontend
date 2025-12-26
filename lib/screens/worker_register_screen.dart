import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class WorkerRegisterScreen extends StatelessWidget {
  const WorkerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Worker Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Worker Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Hive.box('appBox').put('name', nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Worker saved locally')),
                );
              },
              child: const Text('Register Worker'),
            ),
          ],
        ),
      ),
    );
  }
}
