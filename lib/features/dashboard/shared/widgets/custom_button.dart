
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {

  final IconData icon;  
  final VoidCallback? onPressed;

  const CustomButton({
    super.key,
    required this.icon,
    this.onPressed,

  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        shape: const StadiumBorder(),
        onPressed: onPressed,
        child: const Icon( Icons.add )
    );
  }
}