import 'package:equatable/equatable.dart';
import 'package:flutter_tdd_new/configs/routers/e_page.dart';
import 'package:flutter_tdd_new/configs/routers/routes.dart';
import 'package:flutter_tdd_new/utilities/extensions/map_extension.dart';

class PageConfig extends Equatable {
  PageConfig({
    required String location,
    Map<String, dynamic>? args,
    this.name,
  }) {
    path = location.isNotEmpty ? Uri.parse(location) : Uri.parse('/');
    route = path.toString();
    this.args.addIfNotNull(args);

    ///get the page from defined pages
    page = getEPage(this);
  }

  ///full path to the page
  late final Uri path;

  ///to make it easier to use the path with different interfaces
  late final String route;

  ///an identifier for the page (optional)
  final String? name;

  ///page args: can be added in the path as a string literal, or manually when
  /// creating the route
  final args = {'isScreen': true};

  ///Our route description, this is where actual builds happen
  late final EPage page;

  @override
  String toString() {
    return 'PageConfig: path = $path, args = $args';
  }

  @override
  List<Object?> get props => [path, args];
}
