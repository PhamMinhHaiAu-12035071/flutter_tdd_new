import 'package:flutter_tdd_new/modules/auth/login/data/exceptions/login_failed_exception.dart';
import 'package:flutter_tdd_new/modules/auth/login/data/models/models.dart'
    as models;
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockError extends Mock implements models.Error {}

void main() {
  group('LoginFailedException', () {
    test('Test initial constructor', () {
      final mockError = MockError();
      when(() => mockError.error).thenReturn('Missing password');
      final loginFailedException = LoginFailedException(error: mockError);
      expect(loginFailedException.toString(), 'Missing password');
    });
  });
}
