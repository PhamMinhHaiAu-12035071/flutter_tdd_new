// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gherkin_suite_test.dart';

// **************************************************************************
// GherkinSuiteTestGenerator
// **************************************************************************

class _CustomGherkinIntegrationTestRunner extends GherkinIntegrationTestRunner {
  _CustomGherkinIntegrationTestRunner(
    TestConfiguration configuration,
    Future<void> Function(World) appMainFunction,
  ) : super(configuration, appMainFunction);

  @override
  void onRun() {
    testFeature0();
  }

  void testFeature0() {
    runFeature(
      'Login Page:',
      <String>[],
      () {
        runScenario(
          'Email is not allow empty Examples: (1)',
          <String>[],
          (TestDependencies dependencies) async {
            await runStep(
              'Given I am on the login page',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I fill the "loginForm_emailInput_textField" field with "eve.holt@reqres.in"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I see "eve.holt@reqres.in" on the login page',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I press the backspace keyboard 18 times',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'When I pause for 30 seconds',
              <String>[],
              null,
              dependencies,
            );
          },
          onBefore: () async => onBeforeRunFeature(
            'Login Page',
            <String>[],
          ),
          onAfter: () async => onAfterRunFeature(
            'Login Page',
          ),
        );
      },
    );
  }
}

void executeTestSuite(
  TestConfiguration configuration,
  Future<void> Function(World) appMainFunction,
) {
  _CustomGherkinIntegrationTestRunner(configuration, appMainFunction).run();
}
