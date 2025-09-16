// ignore_for_file: public_member_api_docs, document_ignores

enum Rotue {
  root(path: RouteName.root, location: RouteName.root);

  const Rotue({
    required this.path,
    required this.location,
  });

  final String location;
  final String path;
}

final class RouteName {
  static const root = '/';
}
