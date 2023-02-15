import 'package:dawn/dawn.dart';

import 'button.dart';
import 'drawer.dart';
import 'theme.dart';

class TopBar extends StatelessWidget {
  final Button? leading;
  final String title;
  final List<Button>? trailing;

  const TopBar({this.leading, required this.title, this.trailing, super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Container(
        [
          Container(
            [
              Container([
                if (leading != null)
                  leading!
                else
                  Button.normalText(
                    icon: 'menu',
                    onTap: (final event) => context.openDrawer(),
                  ),
              ])
            ],
            style: const Style({'display': 'flex'}),
          ),
          Text(
            title,
            style: const Style({
              'line-height': '40px',
              'font-size': '24px',
              'font-variation-settings': '"wght" 480',
              'user-select': 'none',
              'overflow': 'hidden',
              'white-space': 'nowrap',
              'text-overflow': 'ellipsis',
            }),
          ),
          Container(
            [
              if (trailing != null)
                for (final singleTrailing in trailing!)
                  Container([singleTrailing])
            ],
            style: const Style({
              'display': 'flex',
              'flex-flow': 'row',
              'gap': '8px',
              'justify-content': 'end',
            }),
          )
        ],
        style: Style({
          'display': 'grid',
          'min-width': '0px',
          'grid-template-columns': '1fr max-content 1fr',
          'gap': '16px',
          'padding': '8px',
          'background': store.surfaceColor.toString(),
          'color': store.onSurfaceColor.toString(),
        }),
      );
    });
  }
}
