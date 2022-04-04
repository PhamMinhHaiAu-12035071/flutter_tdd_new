import 'package:flutter/foundation.dart';

abstract class EmojiLog {
  static void printError({required String message}) {
    debugPrint('😭 $message');
  }

  static void printWarning({required String message}) {
    debugPrint('😰 $message');
  }

  static void printSuccess({required String message}) {
    debugPrint('🥳 $message');
  }

  static void printStatus({required String message}) {
    debugPrint('🫣 $message');
  }

  static void printAction({required String message}) {
    debugPrint('👉🏻 $message');
  }

  static void printCancel({required String message}) {
    debugPrint('❌ $message');
  }
}
