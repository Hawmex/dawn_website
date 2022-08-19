import 'package:dawn/dawn.dart';

class Scrim extends StatelessWidget {
  final bool isOpen;

  const Scrim({required this.isOpen, super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      [],
      onPointerDown: (final event) => context.pop(),
      style: Style({
        'position': 'absolute',
        'width': '100vw',
        'height': '100vh',
        'left': '0px',
        'top': '0px',
        'background': isOpen ? 'rgb(0 0 0 / 0.16)' : 'transparent',
        'visibility': isOpen ? 'visible' : 'hidden',
        'transition': '''
          background 300ms cubic-bezier(0.4, 0, 0.2, 1),
          visibility 300ms cubic-bezier(0.4, 0, 0.2, 1)
        ''',
      }),
    );
  }
}
