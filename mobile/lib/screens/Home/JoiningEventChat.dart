import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class JoiningEventChat extends ConsumerWidget {
  const JoiningEventChat({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const JoiningEventChat(),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Page'),
      ),
      body: const Center(
        child: Text('This is the First Page'),
      ),
    );
  }
}
