import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/shared/widgets/text_banner.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // get backgroundColor based on mode buildTypes
    const backgroundColor = kDebugMode
        ? Colors.deepOrange
        : kProfileMode
            ? Colors.amber
            : Colors.green;
    const textMode = kDebugMode
        ? 'DEBUG'
        : kProfileMode
            ? 'PROFILE'
            : 'RELEASE';

    return Stack(
      children: <Widget>[
        child,
        TextBanner(
          name: getIt<FlavorConfig>().name,
          backgroundColor: getIt<FlavorConfig>().backgroundColor,
        ),
        Positioned(
          right: 0,
          child: SizedBox(
            width: 50,
            height: 50,
            child: CustomPaint(
              painter: BannerPainter(
                message: textMode,
                textDirection: Directionality.of(context),
                layoutDirection: Directionality.of(context),
                location: BannerLocation.topEnd,
                color: backgroundColor,
                textStyle: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
