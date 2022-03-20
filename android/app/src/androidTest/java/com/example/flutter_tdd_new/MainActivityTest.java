package com.example.flutter_tdd_new;// Change this line to YOUR package name:

import androidx.test.rule.ActivityTestRule;

import com.flutter_tdd_new.flutter_tdd_new.MainActivity;

import dev.flutter.plugins.integration_test.FlutterTestRunner;
import org.junit.Rule;
import org.junit.runner.RunWith;
// Import MainActivity from YOUR package

@RunWith(FlutterTestRunner.class)
public class MainActivityTest {
    @Rule
    public ActivityTestRule<MainActivity> rule = new ActivityTestRule<>(MainActivity.class, true, false);
}