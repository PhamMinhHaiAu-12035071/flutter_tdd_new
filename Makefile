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

.PHONY: emulator_dev_debug
emulator_dev_debug:
	flutter run -t lib/main_dev.dart --flavor=dev --debug

.PHONY: emulator_dev_profile
emulator_dev_profile:
	flutter run -t lib/main_dev.dart --flavor=dev --profile

.PHONY: emulator_dev_release
emulator_dev_release:
	flutter run -t lib/main_dev.dart --flavor=dev --release

.PHONY: emulator_stg_debug
emulator_stg_debug:
	flutter run -t lib/main_staging.dart --flavor=stg --debug

.PHONY: emulator_stg_profile
emulator_stg_profile:
	flutter run -t lib/main_staging.dart --flavor=stg --profile

.PHONY: emulator_stg_release
emulator_stg_release:
	flutter run -t lib/main_staging.dart --flavor=stg --release

.PHONY: emulator_prod_debug
emulator_prod_debug:
	flutter run -t lib/main_production.dart --flavor=prod --debug

.PHONY: emulator_prod_profile
emulator_prod_profile:
	flutter run -t lib/main_production.dart --flavor=prod --profile

.PHONY: emulator_prod_release
emulator_prod_release:
	flutter run -t lib/main_production.dart --flavor=prod --release

.PHONY: web_server_dev_debug
web_server_dev_debug:
	flutter run -d web-server -t lib/main_dev.dart --flavor=dev --debug

.PHONY: web_server_dev_profile
web_server_dev_profile:
	flutter run -d web-server -t lib/main_dev.dart --flavor=dev --profile

.PHONY: web_server_dev_release
web_server_dev_release:
	flutter run -d web-server -t lib/main_dev.dart --flavor=dev --release

.PHONY: web_server_stg_debug
web_server_stg_debug:
	flutter run -d web-server -t lib/main_staging.dart --flavor=stg --debug

.PHONY: web_server_stg_profile
web_server_stg_profile:
	flutter run -d web-server -t lib/main_staging.dart --flavor=stg --profile

.PHONY: web_server_stg_release
web_server_stg_release:
	flutter run -d web-server -t lib/main_staging.dart --flavor=stg --release

.PHONY: web_server_prod_debug
web_server_prod_debug:
	flutter run -d web-server -t lib/main_production.dart --flavor=prod --debug

.PHONY: web_server_prod_profile
web_server_prod_profile:
	flutter run -d web-server -t lib/main_production.dart --flavor=prod --profile

.PHONY: web_server_prod_release
web_server_prod_release:
	flutter run -d web-server -t lib/main_production.dart --flavor=prod --release

.PHONY: web_dev_debug
web_dev_debug:
	flutter run --observatory-port=9200 -d chrome -t lib/main_dev.dart --flavor=dev --debug

.PHONY: web_dev_profile
web_dev_profile:
	flutter run --observatory-port=9200 -d chrome -t lib/main_dev.dart --flavor=dev --profile

.PHONY: web_dev_release
web_dev_release:
	flutter run --observatory-port=9200 -d chrome -t lib/main_dev.dart --flavor=dev --release

.PHONY: web_stg_debug
web_stg_debug:
	flutter run --observatory-port=9200 -d chrome -t lib/main_staging.dart --flavor=stg --debug

.PHONY: web_stg_profile
web_stg_profile:
	flutter run --observatory-port=9200 -d chrome -t lib/main_staging.dart --flavor=stg --profile

.PHONY: web_stg_release
web_stg_release:
	flutter run --observatory-port=9200 -d chrome -t lib/main_staging.dart --flavor=stg --release

.PHONY: web_prod_debug
web_prod_debug:
	flutter run --observatory-port=9200 -d chrome -t lib/main_production.dart --flavor=prod --debug

.PHONY: web_prod_profile
web_prod_profile:
	flutter run --observatory-port=9200 -d chrome -t lib/main_production.dart --flavor=prod --profile

.PHONY: web_prod_release
web_prod_release:
	flutter run --observatory-port=9200 -d chrome -t lib/main_production.dart --flavor=prod --release

.PHONY: test
test:
	flutter test

.PHONY: coverage
coverage:
	flutter test --coverage

.PHONY: integration_test_device_dev_debug
integration_test_device_dev_debug:
	flutter drive \
	--flavor=dev \
	--debug \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_develop.dart

.PHONY: integration_test_device_dev_profile
integration_test_device_dev_profile:
	flutter drive \
	--flavor=dev \
	--profile \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_develop.dart

.PHONY: integration_test_device_staging_debug
integration_test_device_staging_debug:
	flutter drive \
	--flavor=stg \
	--debug \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_staging.dart

.PHONY: integration_test_device_staging_profile
integration_test_device_staging_profile:
	flutter drive \
	--flavor=stg \
	--profile \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_staging.dart

.PHONY: integration_test_device_production_debug
integration_test_device_production_debug:
	flutter drive \
	--flavor=prod \
	--debug \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_production.dart

.PHONY: integration_test_device_production_profile
integration_test_device_production_profile:
	flutter drive \
	--flavor=prod \
	--profile \
	--driver=test_driver/integration_test.dart \
	--target=integration_test/gherkin_suite_test_production.dart

.PHONY: integration_test_real_device_android_dev_debug
integration_test_real_device_android_dev_debug:
	./scripts/run_android.sh -e dev -f debug -p gherkin_suite_test_develop.dart

.PHONY: integration_test_real_device_android_dev_profile
integration_test_real_device_android_dev_profile:
	./scripts/run_android.sh -e dev -f profile -p gherkin_suite_test_develop.dart

.PHONY: integration_test_real_device_android_dev_release
integration_test_real_device_android_dev_release:
	./scripts/run_android.sh -e dev -f release -p gherkin_suite_test_develop.dart

.PHONY: integration_test_real_device_android_staging_debug
integration_test_real_device_android_staging_debug:
	./scripts/run_android.sh -e stg -f debug -p gherkin_suite_test_staging.dart

.PHONY: integration_test_real_device_android_staging_profile
integration_test_real_device_android_staging_profile:
	./scripts/run_android.sh -e stg -f profile -p gherkin_suite_test_staging.dart

.PHONY: integration_test_real_device_android_staging_release
integration_test_real_device_android_staging_release:
	./scripts/run_android.sh -e stg -f release -p gherkin_suite_test_staging.dart

.PHONY: integration_test_real_device_android_production_debug
integration_test_real_device_android_production_debug:
	./scripts/run_android.sh -e prod -f debug -p gherkin_suite_test_production.dart

.PHONY: integration_test_real_device_android_production_profile
integration_test_real_device_android_production_profile:
	./scripts/run_android.sh -e prod -f profile -p gherkin_suite_test_production.dart

.PHONY: integration_test_real_device_android_production_release
integration_test_real_device_android_production_release:
	./scripts/run_android.sh -e prod -f release -p gherkin_suite_test_production.dart

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

.PHONY: integration_test_web_chrome_staging_debug
integration_test_web_chrome_staging_debug:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=stg \
        	--debug \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_staging_profile
integration_test_web_chrome_staging_profile:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=stg \
        	--profile \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_staging_release
integration_test_web_chrome_staging_release:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=stg \
        	--release \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_production_debug
integration_test_web_chrome_production_debug:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=prod \
        	--debug \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_production_profile
integration_test_web_chrome_production_profile:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=prod \
        	--profile \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_chrome_production_release
integration_test_web_chrome_production_release:
	./scripts/check_driver.sh -d 'chromedriver' \
	&& ./scripts/new_tab.sh -e 'chromedriver --port=4444' \
	&& flutter drive --web-port 8080 --browser-name=chrome \
		--flavor=prod \
        	--release \
		--driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

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

.PHONY: integration_test_web_safari_staging_debug
integration_test_web_safari_staging_debug:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--debug \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_staging_profile
integration_test_web_safari_staging_profile:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--profile \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_staging_release
integration_test_web_safari_staging_release:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--release \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_production_debug
integration_test_web_safari_production_debug:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--debug \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_production_profile
integration_test_web_safari_production_profile:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--profile \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
	&& ./scripts/close_tab.sh

.PHONY: integration_test_web_safari_production_release
integration_test_web_safari_production_release:
	sudo safaridriver --enable \
	&& ./scripts/new_tab.sh -e '/usr/bin/safaridriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--release \
		--browser-name=safari --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
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

.PHONY: integration_test_web_firefox_staging_debug
integration_test_web_firefox_staging_debug:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--debug \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_staging_profile
integration_test_web_firefox_staging_profile:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--profile \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_staging_release
integration_test_web_firefox_staging_release:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=stg \
        	--release \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_staging.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_production_debug
integration_test_web_firefox_production_debug:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--debug \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_production_profile
integration_test_web_firefox_production_profile:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--profile \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh

.PHONY: integration_test_web_firefox_production_release
integration_test_web_firefox_production_release:
	./scripts/check_driver.sh -d 'geckodriver' \
	&& ./scripts/new_tab.sh -e 'geckodriver --port=4444' \
	&& flutter drive --web-port 8080 \
		--flavor=prod \
        	--release \
		--browser-name=firefox --driver=test_driver/integration_test.dart \
		--target=integration_test/gherkin_suite_test_production.dart -d web-server --no-headless \
	&& sleep 2 \
    && ./scripts/close_tab.sh
