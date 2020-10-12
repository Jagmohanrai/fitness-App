import 'package:flutter/material.dart';
import './src/weight_slider_background.dart';
import './src/weight_slider_interal.dart';

class WeightSlider extends StatelessWidget {
  final int weight;
  final int minWeight;
  final int maxWeight;
  final double width;
  final ValueChanged<int> onChange;

  const WeightSlider(
      {Key key,
      this.weight = 80,
      this.minWeight = 30,
      this.maxWeight = 130,
      this.width,
      @required this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeightBackground(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return constraints.isTight
              ? Container()
              : WeightSliderInternal(
                  minValue: this.minWeight,
                  maxValue: this.maxWeight,
                  value: this.weight,
                  onChange: this.onChange,
                  width: this.width ?? constraints.maxWidth,
                );
        },
      ),
    );
  }
}
