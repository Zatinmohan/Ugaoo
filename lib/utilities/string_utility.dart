enum StringValidationType {
  lower,
  upper,
  all,
}

extension XStringExtension on String {
  bool isString({
    StringValidationType type = StringValidationType.all,
  }) =>
      switch (type) {
        StringValidationType.lower => RegExp('[a-z]').hasMatch(this),
        StringValidationType.upper => RegExp('[A-Z]').hasMatch(this),
        StringValidationType.all => RegExp('[a-zA-Z]').hasMatch(this),
      };

  bool isNumber() => RegExp(r'^\d+$').hasMatch(this);
}
