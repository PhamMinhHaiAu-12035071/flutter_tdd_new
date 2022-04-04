// ignore_for_file: avoid_print
import 'package:flutter/foundation.dart';
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_tdd_new/main_dev.dart' as app_develop;
import 'package:flutter_tdd_new/main_production.dart' as app_production;
import 'package:flutter_tdd_new/main_staging.dart' as app_staging;
import 'package:flutter_tdd_new/utilities/logs/emoji_log.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../gherkin_suite_test_develop.dart';
import '../gherkin_suite_test_production.dart';
import '../gherkin_suite_test_staging.dart';
import 'hooks/hooks.dart';
import 'parameters/parameters.dart';
import 'step_definitions/steps.dart';
import 'world/custom_world.dart';

FlutterTestConfiguration gherkinTestConfiguration =
    FlutterTestConfiguration.DEFAULT([...steps])
      ..customStepParameterDefinitions = [...parameters]
      ..hooks = [...hooks]
      ..reporters = [
        StdoutReporter(MessageLevel.error)
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        ProgressReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        TestRunSummaryReporter()
          ..setWriteLineFn(print)
          ..setWriteFn(print),
        JsonReporter(
          writeReport: (_, __) => Future<void>.value(),
        ),
      ]
      ..semanticsEnabled = kDebugMode
      ..createWorld = (config) => Future.value(CustomWorld());
Future<void> appInitializationFnDevelop(World world) async {
  EmojiLog.printSuccess(
    message: '[appInitializationFn]',
  );
  globalCountAppDevelop += 1;
  final result = await app_develop.main(
    isAddUrlStrategy: globalCountAppDevelop <= 1,
  );
  // MockApiLogin();

  return result;
}

Future<void> appInitializationFnStaging(World world) async {
  EmojiLog.printSuccess(
    message: '[appInitializationFn]',
  );
  globalCountAppStaging += 1;
  final result = await app_staging.main(
    isAddUrlStrategy: globalCountAppStaging <= 1,
  );
  // MockApiLogin();

  return result;
}

Future<void> appInitializationFnProduction(World world) async {
  EmojiLog.printSuccess(
    message: '[appInitializationFn]',
  );
  globalCountAppProduction += 1;
  final result = await app_production.main(
    isAddUrlStrategy: globalCountAppProduction <= 1,
  );
  // MockApiLogin();

  return result;
}
