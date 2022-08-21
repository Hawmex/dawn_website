import 'package:dawn/dawn.dart';

import 'button.dart';

class TopBar extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const TopBar({required this.title, this.trailing, super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Text(
          title,
          style: const Style({
            'font-size': '32px',
            'line-height': '56px',
            'font-variation-settings': '"wght" 600',
            'padding': '0px 16px',
            'white-space': 'nowrap',
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
          [
            if (trailing != null)
              trailing!
            else
              Button(icon: 'arrow_back', onTap: (final event) => context.pop()),
          ],
          style: const Style({'display': 'flex', 'gap': '16px'}),
        ),
      ],
      style: const Style({
        'display': 'flex',
        'gap': '32px',
        'padding': '32px',
        'background': '#1d2737',
        'color': 'white',
        'min-width': '0px',
        'align-items': 'center',
        'justify-content': 'space-between',
        'width': '100%',
        'overflow-x': 'auto',
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
