import 'package:flutter/material.dart';

import 'details_page.dart';

class HeartRatePage extends StatelessWidget {
  const HeartRatePage({super.key});

  static const int _dummyHeartRate = 78;

  Future<void> _openDetails(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(
        builder: (_) => const DetailsPage(heartRateBpm: _dummyHeartRate),
      ),
    );

    if (context.mounted) {
      Navigator.pop(context, result); // return result back to Dashboard
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Heart Rate'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Current heart rate:'),
            const SizedBox(height: 8),
            const Text(
              '78 BPM',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _openDetails(context),
              child: const Text('View Details'),
            ),
          ],
        ),
      ),
    );
  }
}
