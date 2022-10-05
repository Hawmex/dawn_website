import 'package:dawn/dawn.dart';

import 'theme.dart';

class Content extends StatelessWidget {
  final List<Widget> children;

  const Content(this.children, {super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Container(
        children,
        style: Style({
          'display': 'flex',
          'flex-flow': 'column',
          'min-height': '100%',
          'min-width': '0px',
          'gap': '12px',
          'padding': '16px',
          'background': store.surfaceColor.toString(),
          'color': store.onSurfaceColor.toString(),
        }),
      );
    });
  }
}
