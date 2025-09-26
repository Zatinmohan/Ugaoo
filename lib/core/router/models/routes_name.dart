// This is an enum that represents the routes configuration.
// ignore_for_file: public_member_api_docs

enum Routes {
  root(path: RoutesName.root, name: RoutesName.root),
  second(
    path: '${RoutesName.root}${RoutesName.second}',
    name: '${RoutesName.root}${RoutesName.second}',
  );

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}

class RoutesName {
  static const root = '/';
  static const second = 'second';
}
