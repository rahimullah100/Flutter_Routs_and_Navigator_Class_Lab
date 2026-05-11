import 'package:flutter/material.dart';

import 'heart_rate_page.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  String? _lastFeedback;

  Future<void> _openHeartRateFlow() async {
    final result = await Navigator.push<String>(
      context,
      MaterialPageRoute(builder: (_) => const HeartRatePage()),
    );

    if (!mounted) return;
    setState(() {
      _lastFeedback = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Smart Health Monitoring App',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _openHeartRateFlow,
              child: const Text('Check Heart Rate'),
            ),
            const SizedBox(height: 16),
            Text(
              _lastFeedback == null
                  ? 'Feedback result: (none)'
                  : 'Feedback result: $_lastFeedback',
            ),
          ],
        ),
      ),
    );
  }
}
