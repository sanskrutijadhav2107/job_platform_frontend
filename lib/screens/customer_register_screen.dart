import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class CustomerRegisterScreen extends StatelessWidget {
  const CustomerRegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();

    return Scaffold(
      appBar: AppBar(title: const Text('Customer Registration')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(labelText: 'Customer Name'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Hive.box('appBox').put('name', nameController.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Customer saved locally')),
                );
              },
              child: const Text('Register Customer'),
            ),
          ],
        ),
      ),
    );
  }
}
