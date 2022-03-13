import 'package:gherkin/gherkin.dart';

import 'keyboard_enum.dart';
import 'status_element_enum.dart';
import 'time_enum.dart';

Iterable<CustomParameter> parameters = [
  TimeParameter(),
  KeyboardParameter(),
  StatusElementParameter()
];
