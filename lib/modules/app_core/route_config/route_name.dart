// ignore_for_file: public_member_api_docs, document_ignores

enum Rotue {
  root(path: RouteName.root, location: RouteName.root),
  second(
    path: '${RouteName.root}${RouteName.second}',
    location: '${RouteName.root}${RouteName.second}',
  );

  const Rotue({
    required this.path,
    required this.location,
  });

  final String location;
  final String path;
}

final class RouteName {
  static const root = '/';
  static const second = '/second';
}
