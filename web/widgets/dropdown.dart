import 'package:dawn/dawn.dart';

class DropDown extends StatefulWidget {
  final Widget child;
  final List<Widget> items;

  const DropDown({required this.child, required this.items, super.key});

  @override
  State createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  bool _isActive = false;

  @override
  Widget build(final BuildContext context) {
    return Container(
      [
        Container(
          [widget.child],
          onTap: (final event) => setState(() => _isActive = !_isActive),
          style: const Style({'display': 'flex'}),
        ),
        Container(
          [
            Container(
              widget.items,
              style: const Style({
                'margin-top': '16px',
                'display': 'flex',
                'flex-flow': 'column',
                'padding': '16px',
                'border-radius': '16px',
                'gap': '16px',
                'background': 'white',
                'box-shadow': '0px 2px 2px 0px rgb(0 0 0 / 0.16)',
              }),
            ),
          ],
          style: Style({
            'position': 'absolute',
            'z-index': '1',
            'width': 'max-content',
            'top': '100%',
            'left': '50%',
            'transform':
                _isActive ? 'translate(-50%, 0px)' : 'translate(-50%, -16px)',
            'visibility': _isActive ? 'visible' : 'hidden',
            'opacity': _isActive ? '1' : '0',
            'transition': 'all 300ms cubic-bezier(0.4, 0, 0.2, 1)',
          }),
        ),
      ],
      style: const Style({'position': 'relative'}),
    );
  }
}
