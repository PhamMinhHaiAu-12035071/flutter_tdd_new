import 'package:flutter_tdd_new/configs/di/injection.dart';
import 'package:flutter_tdd_new/utilities/logs/emoji_log.dart';
import 'package:gherkin/gherkin.dart';

import '../world/custom_world.dart';

class ResetAppHook extends Hook {
  @override
  int get priority => 100;

  /// Run after a scenario has executed
  @override
  Future<void> onAfterScenario(
    TestConfiguration config,
    String scenario,
    Iterable<Tag> tags,
  ) async {
    EmojiLog.printSuccess(
      message: '[ResetAppHook] [onAfterScenario] reset get_it',
    );
    await getIt.reset();
    return Future.value(null);
  }

  /// Resets the application state before the test is run to ensure
  /// no test side effects
  @override
  Future<void> onAfterScenarioWorldCreated(
    World world,
    String scenario,
    Iterable<Tag> tags,
  ) async {
    if (world is CustomWorld) {
      EmojiLog.printSuccess(
        message:
            '[ResetAppHook] [onAfterScenarioWorldCreated] reset application',
      );
    }
  }
}
