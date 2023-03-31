import 'package:dawn/dawn.dart';

import 'theme.dart';

class Scrim extends StatelessWidget {
  final bool active;

  const Scrim({required this.active, super.key, super.ref});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      final duration = store.standardDuration;
      final curve = store.standardCurve;

      final transition = '''
        background ${duration.inMilliseconds}ms $curve,
        visibility ${duration.inMilliseconds}ms $curve
      ''';

      return Container(
        [],
        onPointerDown: (final details) => Navigator.pop(),
        style: Style({
          'position': 'fixed',
          'top': '0px',
          'right': '0px',
          'width': '100vw',
          'height': '100vh',
          'background':
              store.onSurfaceColor.withAlpha(active ? 0.08 : 0).toString(),
          'visibility': active ? 'visible' : 'hidden',
          'transition': transition,
        }),
      );
    });
  }
}
