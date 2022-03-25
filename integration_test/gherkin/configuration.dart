// ignore_for_file: avoid_print
import 'package:flutter_gherkin/flutter_gherkin.dart';
import 'package:flutter_tdd_new/constants/env.dart';
import 'package:flutter_tdd_new/main_dev.dart' as app;
import 'package:flutter_tdd_new/utilities/logs/emoji_log.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:gherkin/gherkin.dart';

import '../gherkin_suite_test.dart';
import 'hooks/hooks.dart';
import 'mock/mock_api_login.dart';
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
      ..createWorld = (config) => Future.value(CustomWorld());

Future<void> appInitializationFn(World world) async {
  EmojiLog.printSuccess(
    message: '[appInitializationFn]',
  );
  globalCountApp += 1;
  final result = await app.main(
    environment: Env.endToEndTest,
    isAddUrlStrategy: globalCountApp <= 1,
  );
  MockApiLogin();

  return result;
}
