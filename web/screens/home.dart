import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../widgets/button.dart';
import '../widgets/drawer.dart';
import '../widgets/screen.dart';
import '../widgets/top_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      [
        TopBar(
          title: 'Dawn',
          trailing: Button(
            icon: 'menu',
            onTap: (final event) => context.openDrawer(),
          ),
        ),
        Container(
          [
            const Text(
              'Build Fast & User-Friendly Web Apps',
              style: Style({
                'font-size': '48px',
                'line-height': '64px',
                'font-variation-settings': '"wght" 700',
                'text-align': 'center',
              }),
              animation: Animation(
                keyframes: [
                  Keyframe(
                    offset: 0,
                    style: Style({
                      'opacity': '0',
                      'transform': 'translateY(100%)',
                    }),
                  ),
                  Keyframe(
                    offset: 1,
                    style: Style({
                      'opacity': '1',
                      'transform': 'translateY(0%)',
                    }),
                  )
                ],
                duration: Duration(milliseconds: 300),
                easing: Easing(0.4, 0, 0.2, 1),
              ),
            ),
            Container(
              [
                Button(
                  text: 'Pub',
                  icon: 'open_in_new',
                  solid: true,
                  onTap: (final event) => html.window.open(
                    'https://pub.dev/packages/dawn',
                    '',
                  ),
                ),
                Button(
                  text: 'GitHub',
                  icon: 'open_in_new',
                  solid: true,
                  onTap: (final event) => html.window.open(
                    'https://github.com/Hawmex/dawn',
                    '',
                  ),
                ),
              ],
              style: const Style({'display': 'flex', 'gap': '16px'}),
            ),
            Container(
              [
                Image(
                  '/assets/code.png',
                  alternativeText: 'Example Code',
                  style: Style({
                    'width': html.window.innerWidth! > 720 ? '360px' : '100%',
                    'border-radius': '24px',
                    'max-width': '100%',
                    'user-select': 'none',
                  }),
                ),
                Text(
                  'Dawn is a Dart web framework that lets developers create UIs '
                  'with a widget model that is similar to Flutter. Dawn '
                  'applications are compiled to JavaScript and are painted using '
                  'HTML and CSS.',
                  style: Style({
                    'font-size': '24px',
                    'line-height': '36px',
                    'text-align':
                        html.window.innerWidth! > 720 ? 'start' : 'center',
                  }),
                ),
              ],
              style: Style({
                'display': 'flex',
                'flex-flow': html.window.innerWidth! > 720 ? 'row' : 'column',
                'gap': '48px',
                'align-items': 'center',
              }),
              animation: const Animation(
                keyframes: [
                  Keyframe(
                    offset: 0,
                    style: Style({
                      'opacity': '0',
                      'transform': 'translateY(100%)',
                    }),
                  ),
                  Keyframe(
                    offset: 1,
                    style: Style({
                      'opacity': '1',
                      'transform': 'translateY(0%)',
                    }),
                  )
                ],
                duration: Duration(milliseconds: 300),
                easing: Easing(0.4, 0, 0.2, 1),
                startDelay: Duration(milliseconds: 600),
                fillMode: AnimationFillMode.both,
              ),
            ),
          ],
          style: const Style({
            'display': 'flex',
            'flex-flow': 'column',
            'justify-content': 'space-around',
            'align-items': 'center',
            'background': '#1d2737',
            'min-width': '0px',
            'padding': '48px',
            'gap': '48px',
            'color': 'white',
          }),
        ),
      ],
    );
  }
}
