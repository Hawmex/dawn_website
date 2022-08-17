import 'package:dawn/dawn.dart';

class TopBar extends StatelessWidget {
  final String title;
  final List<Widget> trailing;

  const TopBar({required this.title, this.trailing = const [], super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Text(
          title,
          style: const Style({
            'font-size': '32px',
            'font-variation-settings': '"wght" 600',
          }),
          animation: const Animation(
            keyframes: [
              Keyframe(
                offset: 0,
                style: Style({'opacity': '0', 'transform': 'rotateY(-90deg)'}),
              ),
              Keyframe(
                offset: 1,
                style: Style({'opacity': '1', 'transform': 'rotateY(0deg)'}),
              )
            ],
            duration: Duration(milliseconds: 600),
            easing: Easing(0.4, 0, 0.2, 1),
          ),
        ),
        Container(
          trailing,
          style: const Style({'display': 'flex', 'gap': '16px'}),
        ),
      ],
      style: const Style({
        'display': 'flex',
        'gap': '16px',
        'padding': '32px',
        'align-items': 'center',
        'justify-content': 'space-between',
        'width': '100%',
      }),
      animation: const Animation(
        keyframes: [
          Keyframe(
            offset: 0,
            style: Style({'opacity': '0', 'transform': 'translateY(-100%)'}),
          ),
          Keyframe(
            offset: 1,
            style: Style({'opacity': '1', 'transform': 'translateY(0%)'}),
          )
        ],
        duration: Duration(milliseconds: 300),
        easing: Easing(0.4, 0, 0.2, 1),
      ),
    );
  }
}
