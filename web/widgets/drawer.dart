import 'package:dawn/dawn.dart';

import 'scrim.dart';

final _drawerState = _DrawerState();

extension DrawerModal on BuildContext {
  void openDrawer() {
    _drawerState.setState(() => _drawerState._isOpen = true);

    pushModal(
      onPop: () => _drawerState.setState(() => _drawerState._isOpen = false),
    );
  }
}

class Drawer extends StatefulWidget {
  final List<Widget> children;

  const Drawer(this.children, {super.key});

  @override
  State createState() => _drawerState;
}

class _DrawerState extends State<Drawer> {
  bool _isOpen = false;

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Scrim(isOpen: _isOpen),
        Container(
          [
            Container(
              widget.children,
              style: const Style({
                'display': 'flex',
                'flex-flow': 'column',
                'gap': '16px',
                'padding': '32px',
              }),
            ),
          ],
          style: Style({
            'background': '#0f192a',
            'position': 'fixed',
            'bottom': '0px',
            'left': '0px',
            'height': 'max-content',
            'max-height': '50vh',
            'overflow': 'auto',
            'width': '100vw',
            'transform': _isOpen ? 'translateY(0%)' : 'translateY(100%)',
            'transition': 'transform 300ms cubic-bezier(0.4, 0, 0.2, 1)',
            'border-radius': '48px 48px 0px 0px',
          }),
        ),
      ],
      style: const Style({'display': 'contents'}),
    );
  }
}
