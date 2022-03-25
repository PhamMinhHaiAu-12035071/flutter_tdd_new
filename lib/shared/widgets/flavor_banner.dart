import 'package:flutter/material.dart';
import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/configs/flavors/flavor_config.dart';
import 'package:flutter_tdd_new/shared/widgets/text_banner.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        child,
        TextBanner(
          name: getIt<FlavorConfig>().name,
          backgroundColor: getIt<FlavorConfig>().backgroundColor,
        ),
      ],
    );
  }
}
