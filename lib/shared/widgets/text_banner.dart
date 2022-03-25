import 'package:flutter/material.dart';

class TextBanner extends StatelessWidget {
  const TextBanner({
    Key? key,
    double? width,
    double? height,
    TextStyle? textStyle,
    required this.name,
    required this.backgroundColor,
  })  : width = width ?? 50.0,
        height = height ?? 50.0,
        textStyle = textStyle ??
            const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
        super(key: key);

  final double? width;
  final double? height;
  final TextStyle? textStyle;
  final String name;
  final Color backgroundColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: CustomPaint(
        painter: BannerPainter(
          message: name,
          textDirection: Directionality.of(context),
          layoutDirection: Directionality.of(context),
          location: BannerLocation.topStart,
          color: backgroundColor,
          textStyle: textStyle!,
        ),
      ),
    );
  }
}
