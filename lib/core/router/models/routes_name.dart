enum Routes {
  root(path: '/', name: 'home');

  const Routes({
    required this.path,
    required this.name,
  });

  final String path;
  final String name;
}

class RoutesName {
  static const home = '/';
}
