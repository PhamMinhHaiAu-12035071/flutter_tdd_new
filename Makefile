.PHONY: rebuild
rebuild:
	flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: integration_test_report
integration_test_report:
	node integration_test/gherkin/reports/index.js

.PHONY: integration_test_device
integration_test_device:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart

.PHONY: integration_test_web
integration_test_web:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d web-server --no-headless

.PHONY: integration_test_web_debug
integration_test_web_debug:
	flutter drive --driver=test_driver/integration_test.dart --target=integration_test/gherkin_suite_test.dart -d chrome --web-renderer html

.PHONY: integration_test_web_demo
integration_test_web_demo:
	flutter drive --web-port 8080 --browser-name=safari --driver=test_driver/driver_test.dart --target=integration_test/demo_test.dart -d chrome --web-renderer html

.PHONY: chromedriver_start
chromedriver_start:
	./scripts/chromedriver --port=4444 --disable-gpu

.PHONY: test
test:
	flutter test


.PHONY: install
install:
	yarn add && flutter pub get

.PHONY: clean
clean:
	flutter clean && flutter pub cache clean

.PHONY: coverage
coverage:
	flutter test --coverage

.PHONY: run-web
run-web:
	flutter run -d web-server
