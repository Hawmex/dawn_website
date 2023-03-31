import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import 'button.dart';
import 'content.dart';
import 'drawer.dart';
import 'theme.dart';
import 'top_bar.dart';

class Screen extends StatelessWidget {
  final Content content;
  final Button? previous;
  final Button? next;

  final int? drawerActiveItemIndex;

  const Screen({
    required this.content,
    this.previous,
    this.next,
    this.drawerActiveItemIndex,
    super.key,
    super.ref,
  });

  @override
  Widget build(final BuildContext context) {
    if (drawerActiveItemIndex != null) {
      Drawer.setActiveItemIndex(drawerActiveItemIndex!);
    }

    return ConsumerBuilder<Theme>((final context, final store) {
      return Container(
        [
          TopBar(
            title: 'Dawn',
            trailing: [
              Button.normalText(
                icon: store.mode == ThemeMode.dark ? 'light_mode' : 'dark_mode',
                onTap: (final details) => store.toggleMode(),
              ),
            ],
          ),
          content,
          if (previous != null || next != null)
            Container(
              [
                if (previous != null) previous! else const Container([]),
                if (next != null) next! else const Container([]),
              ],
              style: Style({
                'display': 'grid',
                'grid-template-columns':
                    html.window.innerWidth! > 640 ? '1fr 1fr' : 'unset',
                'grid-template-rows':
                    html.window.innerWidth! > 640 ? 'unset' : 'auto',
                'background': store.surfaceColor.toString(),
                'color': store.onSurfaceColor.toString(),
                'gap': '16px',
                'padding': '16px',
                'margin-top': 'auto',
                'min-width': '0px',
              }),
            ),
        ],
        style: const Style({
          'display': 'grid',
          'grid-template-rows': 'max-content 1fr max-content',
          'min-height': '100vh',
          'position': 'relative',
          'overflow': 'hidden',
        }),
      );
    });
  }
}
