import 'package:dawn/dawn.dart';

class Content extends StatelessWidget {
  final List<Widget> children;

  const Content(this.children, {super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      children,
      style: const Style({
        'display': 'flex',
        'flex-flow': 'column',
        'align-self': 'start',
        'padding': '32px 48px',
        'height': '100%',
        'min-width': '0px',
        'gap': '32px',
        'background': 'white',
        'color': 'black',
        'width': '100%',
      }),
      animation: const Animation(
        keyframes: [
          Keyframe(
            offset: 0,
            style: Style({'opacity': '0', 'transform': 'translateY(64px)'}),
          ),
          Keyframe(
            offset: 1,
            style: Style({'opacity': '1', 'transform': 'translateY(0px)'}),
          )
        ],
        duration: Duration(milliseconds: 300),
        easing: Easing(0.4, 0, 0.2, 1),
        startDelay: Duration(milliseconds: 300),
        fillMode: AnimationFillMode.both,
      ),
    );
  }
}
