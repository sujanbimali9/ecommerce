import 'package:flutter/material.dart';

class AddAddressFormField extends StatelessWidget {
  const AddAddressFormField({
    super.key,
    required this.icon,
    required this.title,
  });

  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        label: Text(
          title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        prefixIcon: Icon(icon),
      ),
    );
  }
}
