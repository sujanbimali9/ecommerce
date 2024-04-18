import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class SignUpTextField extends StatelessWidget {
  const SignUpTextField(
    this.isPassword, {
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });
  final TextEditingController controller;
  final String label;
  final IconData icon;
  final bool? isPassword;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(label),
        prefixIcon: Icon(icon),
        suffixIcon: isPassword != null && isPassword!
            ? const Icon(Iconsax.eye_slash)
            : null,
      ),
    );
  }
}
