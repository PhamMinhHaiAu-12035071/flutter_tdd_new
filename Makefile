.PHONY: help
help:
	./scripts/utilities.sh

.PHONY: playground
playground:
	dart --enable-asserts ./lib/playground/example.dart

.PHONY: install
install:
	yarn \
	&& flutter pub get \
	&& chmod u+x ./scripts/chmod.sh

.PHONY: rebuild
rebuild:
	flutter pub run build_runner clean && flutter pub run build_runner build --delete-conflicting-outputs

.PHONY: clean
clean:
	flutter clean \
	&& flutter pub cache clean \
	&& rm -rf node_modules/

.PHONY: emulator-dev-debug
emulator-dev-debug:
	flutter run -t lib/main_dev.dart --flavor=dev --debug

.PHONY: emulator-dev-profile
emulator-dev-profile:
	flutter run -t lib/main_dev.dart --flavor=dev --profile

.PHONY: emulator-dev-release
emulator-dev-release:
	flutter run -t lib/main_dev.dart --flavor=dev --release

.PHONY: emulator-stg-debug
emulator-stg-debug:
	flutter run -t lib/main_staging.dart --flavor=stg --debug

.PHONY: emulator-prod-debug
emulator-prod-debug:
	flutter run -t lib/main_production.dart --flavor=prod --debug

.PHONY: web-server-dev
web-server-dev:
	flutter run -d web-server -t lib/main_dev.dart --flavor=dev

.PHONY: web-server-stg
web-server-stg:
	flutter run -d web-server -t lib/main_staging.dart --flavor=stg

.PHONY: web-server-prod
web-server-prod:
	flutter run -d web-server -t lib/main_production.dart --flavor=prod

.PHONY: web-dev
web-dev:
	flutter run --observatory-port=9200 -d chrome -t lib/main_dev.dart --flavor=dev

.PHONY: web-stg
web-stg:
	flutter run --observatory-port=9200 -d chrome -t lib/main_staging.dart --flavor=stg

.PHONY: web-prod
web-prod:
	flutter run --observatory-port=9200 -d chrome -t lib/main_production.dart --flavor=prod

.PHONY: test
test:
	flutter test

.PHONY: coverage
coverage:
	flutter test --coverage

.PHONY: integration_test_device_dev_debug
integration_test_device_dev_debug:
	flutter drive \
	--flavor=dev  \
	--debug \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_develop.dart

.PHONY: integration_test_device_dev_profile
integration_test_device_dev_profile:
	flutter drive \
	--flavor=dev  \
	--profile \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_develop.dart

.PHONY: integration_test_real_device_android
integration_test_real_device_android:
	./scripts/run_android.sh

.PHONY: integration_test_real_device_ios
integration_test_real_device_ios:
	flutter build ios --config-only integration_test/gherkin_suite_test.dart \
	&& sleep 1 \
	&& open ios/Runner.xcworkspace

.PHONY: integration_test_report
integration_test_report:
	node integration_test/gherkin/reports/index.js

.PHONY: integration_test_web_chrome_dev_debug
integration_test_web_chrome_dev_debug:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=dev \
        	--debug \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_dev_profile
integration_test_web_chrome_dev_profile:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=dev \
        	--profile \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_dev_release
integration_test_web_chrome_dev_release:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=dev \
        	--release \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

#.PHONY: integration_test_web_demo_chrome_dev_profile
#integration_test_web_demo_chrome_dev_profile:
#	./scripts/check_driver.sh -d 'chromedriver' \
#	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
#	&& flutter drive --web-port 8080 --browser-name=chrome \
#        	--profile \
#		--driver=test_driver/driver_test.dart \
#		--target=integration_test/demo_test.dart --keep-app-running -d chrome --web-renderer html \
#	&& sleep 2 \
#	&& ./scripts/close_tab.sh

#.PHONY: integration_test_web_chrome_debug
#integration_test_web_chrome_debug:
#	./scripts/check_driver.sh -d 'chromedriver' \
#	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
#	&& flutter drive --web-port 8080 --browser-name=chrome \
#		--driver=test_driver/integration_test.dart \
#		--target=integration_test/gherkin_suite_test_develop.dart --keep-app-running -d chrome --web-renderer html \
#	&& sleep 2 \
#	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_dev_debug
integration_test_web_safari_dev_debug:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--debug \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_dev_profile
integration_test_web_safari_dev_profile:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--profile \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_dev_release
integration_test_web_safari_dev_release:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--release \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_dev_debug
integration_test_web_firefox_dev_debug:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--debug \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_dev_profile
integration_test_web_firefox_dev_profile:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--profile \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_dev_release
integration_test_web_firefox_dev_release:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=dev \
        	--release \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_develop.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh
