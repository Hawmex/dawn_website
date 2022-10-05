import 'package:dawn/dawn.dart';

import '../models/rgb_color.dart';

enum ThemeMode { light, dark }

class Theme extends Store {
  late ThemeMode mode;

  late RgbColor backgroundColor;
  late RgbColor onBackgroundColor;
  late RgbColor surfaceColor;
  late RgbColor onSurfaceColor;

  final RgbColor primaryColor = const RgbColor(121, 0, 234);
  final RgbColor onPrimaryColor = const RgbColor(255, 255, 255);
  final RgbColor secondaryColor = const RgbColor(0, 230, 144);
  final RgbColor onSecondaryColor = const RgbColor(0, 0, 0);

  final Duration shortDuration = const Duration(milliseconds: 200);
  final Duration standardDuration = const Duration(milliseconds: 300);
  final Duration longDuration = const Duration(milliseconds: 400);

  final Easing decelerationCurve = const Easing(0, 0, 0.2, 1);
  final Easing standardCurve = const Easing(0.4, 0, 0.2, 1);
  final Easing accelerationCurve = const Easing(0.4, 0, 1, 1);

  static Theme of(final BuildContext context) =>
      context.dependOnProvidedStoreOfExactType<Theme>();

  void toggleMode() => mode == ThemeMode.light ? useDarkMode() : useLightMode();

  void useLightMode() {
    setState(() {
      mode = ThemeMode.light;
      backgroundColor = const RgbColor(224, 224, 224);
      onBackgroundColor = const RgbColor(0, 0, 0);
      surfaceColor = const RgbColor(255, 255, 255);
      onSurfaceColor = const RgbColor(0, 0, 0);
    });
  }

  void useDarkMode() {
    setState(() {
      mode = ThemeMode.dark;
      backgroundColor = const RgbColor(31, 31, 31);
      onBackgroundColor = const RgbColor(255, 255, 255);
      surfaceColor = const RgbColor(0, 0, 0);
      onSurfaceColor = const RgbColor(255, 255, 255);
    });
  }
}
