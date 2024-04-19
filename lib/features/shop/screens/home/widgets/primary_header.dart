// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:ecommerce_flutter/common/widgets/custom_shapes/container/circle_container.dart';
import 'package:ecommerce_flutter/common/widgets/custom_shapes/curved_edges/curve_edge_widget.dart';
import 'package:ecommerce_flutter/utils/constants/colors.dart';

class TPrimaryHeaderContainer extends StatelessWidget {
  const TPrimaryHeaderContainer({
    Key? key,
    required this.child,
  }) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TCurveEdgeWidget(
      child: Container(
        color: TColors.primary,
        padding: const EdgeInsets.all(0),
        child: Stack(
          children: [
            child,
            Positioned(
              top: -150,
              right: -250,
              child: TCircularContainer(
                height: 400,
                width: 400,
                backgroundColor: TColors.white.withOpacity(0.1),
                radius: 400,
              ),
            ),
            Positioned(
              bottom: -150,
              right: -250,
              child: TCircularContainer(
                height: 400,
                width: 400,
                backgroundColor: TColors.white.withOpacity(0.1),
                radius: 400,
              ),
            )
          ],
        ),
      ),
    );
  }
}
