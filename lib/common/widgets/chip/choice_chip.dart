import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';
import 'package:ecommerce_flutter/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TChoiceChip extends StatelessWidget {
  const TChoiceChip({
    super.key,
    required this.isSelected,
    required this.text,
    this.onSelected,
  });
  final bool isSelected;
  final String text;
  final void Function(bool value)? onSelected;

  @override
  Widget build(BuildContext context) {
    final isColored = THelperFunctions.getColor(text) != null;
    return ChoiceChip(
      label: isColored ? const SizedBox() : Text(text),
      selected: isSelected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: isSelected ? TColors.white : null),
      avatar: isColored
          ? TRoundedContainer(
              radius: 25,
              width: 50,
              height: 50,
              backgroundColor: THelperFunctions.getColor(text)!,
            )
          : null,
      labelPadding: isColored ? EdgeInsets.zero : null,
      padding: isColored ? EdgeInsets.zero : null,
      shape: isColored ? const CircleBorder() : null,
      backgroundColor: isColored ? THelperFunctions.getColor(text) : null,
    );
  }
}
