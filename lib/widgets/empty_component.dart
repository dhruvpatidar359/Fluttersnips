import 'package:flutter/material.dart';
import 'package:fluttersnips/shared/exports.dart';

class EmptyComponent extends StatelessWidget {
  const EmptyComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        height: 200,
        width: 200,
        child: RiveAnimation.asset('assets/empty.riv'),
      ),
    );
  }
}
