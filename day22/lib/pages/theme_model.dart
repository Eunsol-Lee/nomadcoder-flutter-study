import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'theme_model.g.dart';

@riverpod
class ThemeModel extends _$ThemeModel {
  @override
  bool build() => false;

  void updateDarkModel(bool value) {
    state = value;
  }
}
