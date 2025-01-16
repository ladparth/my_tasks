import 'package:flutter/material.dart';

class BottomSheetContainer extends StatelessWidget {
  final Widget child;
  const BottomSheetContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: child,
        ),
      ),
    );
  }
}
