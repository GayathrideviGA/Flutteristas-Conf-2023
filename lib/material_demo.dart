import 'package:flutter/material.dart';

class CustomProgressIndicatorMaterial extends StatelessWidget {
  const CustomProgressIndicatorMaterial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(Colors.purple),
          strokeWidth: 5,
        ),
      ),
    );
  }
}
