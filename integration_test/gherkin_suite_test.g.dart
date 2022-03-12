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
              'When I fill the "loginForm_emailInput_textField" field with "au dep trai"',
              <String>[],
              null,
              dependencies,
            );

            await runStep(
              'Then I pause for 10 seconds',
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
