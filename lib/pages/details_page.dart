import 'package:flutter/material.dart';

import 'feedback_page.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.heartRateBpm});

  final int heartRateBpm;

  Future<void> _openFeedback(BuildContext context) async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const FeedbackPage()),
    );

    if (context.mounted) {
      Navigator.pop(context, result); // send result back to HeartRatePage
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Received heart rate: $heartRateBpm BPM'),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _openFeedback(context),
              child: const Text('Go to Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}
