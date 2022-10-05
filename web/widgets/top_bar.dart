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
              if (leading != null)
                leading!
              else
                Button.normalText(
                  icon: 'menu',
                  onTap: (final event) => context.openDrawer(),
                ),
            ],
          ),
          Text(
            title,
            style: const Style({
              'line-height': '40px',
              'font-size': '24px',
              'font-variation-settings': '"wght" 480',
              'user-select': 'none',
            }),
          ),
          Container(
            [if (trailing != null) ...?trailing],
            style: const Style({
              'display': 'flex',
              'flex-flow': 'row',
              'gap': '8px',
              'overflow': 'auto',
            }),
          )
        ],
        style: Style({
          'display': 'flex',
          'min-width': '0px',
          'flex-flow': 'row',
          'justify-content': 'space-between',
          'gap': '16px',
          'padding': '8px',
          'background': store.surfaceColor.toString(),
          'color': store.onSurfaceColor.toString(),
        }),
      );
    });
  }
}
