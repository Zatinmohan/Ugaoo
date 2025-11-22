#!/bin/bash

# Run Dart Runner
dart run build_runner build --delete-conflicting-outputs

# Run Easy Localization translation generation
dart run easy_localization:generate -S "assets/data/translations" -O "lib/modules/app_core/localisation" -o "locale_keys.g.dart" -f keys