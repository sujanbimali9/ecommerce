import 'package:ecommerce_flutter/common/widgets/custom_shapes/curved_edges/curve_edge.dart';
import 'package:flutter/material.dart';

class TCurveEdgeWidget extends StatelessWidget {
  const TCurveEdgeWidget({
    super.key,
    this.child,
  });

  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: TCustomCurveEdges(),
      child: child,
    );
  }
}
