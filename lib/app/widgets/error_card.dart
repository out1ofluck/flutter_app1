import 'package:flutter/material.dart';

class ErrorCard extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onReload;

  const ErrorCard({
    Key? key,
    required this.title,
    required this.description,
    required this.onReload,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(16.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.0),
            Text(
              description,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: onReload,
              child: const Text('Перезагрузить'),
            ),
          ],
        ),
      ),
    );
  }
}
