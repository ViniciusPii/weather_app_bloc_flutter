import 'dart:math' as math show sin, pi;

import 'package:flutter/material.dart';

import '/src/core/theme/app_styles.dart';
import '/src/core/theme/infra/app_dimension.dart';

class DelayTween extends Tween<double> {
  DelayTween({
    super.begin,
    super.end,
    required this.delay,
  });

  final double delay;

  @override
  double lerp(double t) => super.lerp((math.sin((t - delay) * 2 * math.pi) + 1) / 2);

  @override
  double evaluate(Animation<double> animation) => lerp(animation.value);
}

class ThreeBounceComponent extends StatefulWidget {
  const ThreeBounceComponent({
    super.key,
    this.size = AppDimension.big,
    this.color = AppStyles.primary,
    this.duration = const Duration(milliseconds: 1400),
    this.itemBuilder,
    this.controller,
  }) : assert(
          !(itemBuilder is IndexedWidgetBuilder && color is Color) &&
              !(itemBuilder == null && color == null),
          'You should specify either a itemBuilder or a color',
        );

  final double size;
  final Color? color;
  final Duration duration;
  final AnimationController? controller;
  final IndexedWidgetBuilder? itemBuilder;

  @override
  ThreeBounceComponentState createState() => ThreeBounceComponentState();
}

class ThreeBounceComponentState extends State<ThreeBounceComponent>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = (widget.controller ??
        AnimationController(
          vsync: this,
          duration: widget.duration,
        ))
      ..repeat();
  }

  @override
  void dispose() {
    if (widget.controller == null) {
      _controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox.fromSize(
        size: Size(widget.size * 2, widget.size),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
            3,
            (i) {
              return ScaleTransition(
                scale: DelayTween(begin: 0.0, end: 1.0, delay: i * .2).animate(_controller),
                child: SizedBox.fromSize(
                  size: Size.square(widget.size * 0.5),
                  child: _itemBuilder(i),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget _itemBuilder(int index) => widget.itemBuilder != null
      ? widget.itemBuilder!(
          context,
          index,
        )
      : DecoratedBox(
          decoration: BoxDecoration(
            color: widget.color,
            shape: BoxShape.circle,
          ),
        );
}
