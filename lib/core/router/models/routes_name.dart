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
