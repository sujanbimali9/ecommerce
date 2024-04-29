import 'package:flutter/material.dart';

class TSectionHeading extends StatelessWidget {
  const TSectionHeading({
    super.key,
    this.textColor,
    required this.title,
    this.showButton = true,
    this.buttonText = 'View All',
    this.onPressed,
  });
  final String title;
  final Color? textColor;
  final bool showButton;
  final String buttonText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .apply(color: textColor),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showButton)
          TextButton(
              onPressed: onPressed,
              child: Text(
                buttonText,
              ))
      ],
    );
  }
}
