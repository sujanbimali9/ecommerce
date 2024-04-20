import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:flutter/material.dart';

class TSettingTile extends StatelessWidget {
  const TSettingTile(
      {super.key,
      required this.title,
      required this.subtitle,
      this.trailing,
      this.onPressed,
      this.padding,
      this.borderRadius,
      this.icon,
      this.iconColor});

  final String title, subtitle;
  final Widget? trailing;
  final VoidCallback? onPressed;
  final EdgeInsets? padding;
  final double? borderRadius;
  final IconData? icon;
  final Color? iconColor;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: iconColor ?? TColors.primary,
      ),
      trailing: trailing,
      onTap: onPressed,
      contentPadding: padding,
      shape: RoundedRectangleBorder(
          borderRadius: borderRadius != null
              ? BorderRadius.all(Radius.circular(borderRadius!))
              : BorderRadius.zero),
    );
  }
}
