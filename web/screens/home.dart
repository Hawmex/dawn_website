import 'dart:html' as html;

import 'package:dawn/dawn.dart';

import '../components/docs_dropdown.dart';
import '../widgets/button.dart';
import '../widgets/screen.dart';
import '../widgets/top_bar.dart';
import 'get_started.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(final BuildContext context) {
    return Screen(
      [
        TopBar(
          title: 'Dawn',
          trailing: [
            const DocsDropDown(),
            Button(
              'Get Started',
              onTap: (final event) => context.pushRoute(
                builder: (final context) => const GetStarted(),
              ),
              solid: true,
            ),
          ],
        ),
        const Text(
          'Build Fast & User-Friendly Web Apps',
          style: Style({
            'font-size': '48px',
            'font-variation-settings': '"wght" 700',
            'text-align': 'center',
            'padding': '32px',
          }),
          animation: Animation(
            keyframes: [
              Keyframe(
                offset: 0,
                style: Style({'opacity': '0', 'transform': 'translateY(100%)'}),
              ),
              Keyframe(
                offset: 1,
                style: Style({'opacity': '1', 'transform': 'translateY(0%)'}),
              )
            ],
            duration: Duration(milliseconds: 300),
            easing: Easing(0.4, 0, 0.2, 1),
          ),
        ),
        Container(
          [
            Button(
              'Pub',
              solid: true,
              onTap: (final event) => html.window.open(
                'https://pub.dev/packages/dawn',
                '',
              ),
            ),
            Button(
              'GitHub',
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
              style: Style({
                'width': html.window.innerWidth! > 720 ? '360px' : '100%',
                'border-radius': '32px',
              }),
            ),
            Text(
              'Dawn is a Dart web framework that lets developers develop UIs '
              'with a widget model that is similar to Flutter. Dawn '
              'applications are compiled to JavaScript and are painted using '
              'HTML and CSS.',
              style: Style({
                'font-size': '24px',
                'text-align':
                    html.window.innerWidth! > 720 ? 'start' : 'center',
              }),
            ),
          ],
          style: Style({
            'display': 'flex',
            'flex-flow': html.window.innerWidth! > 720 ? 'row' : 'column',
            'gap': '32px',
            'padding': '32px',
            'align-items': 'center',
          }),
          animation: const Animation(
            keyframes: [
              Keyframe(
                offset: 0,
                style: Style({'opacity': '0', 'transform': 'translateY(100%)'}),
              ),
              Keyframe(
                offset: 1,
                style: Style({'opacity': '1', 'transform': 'translateY(0%)'}),
              )
            ],
            duration: Duration(milliseconds: 300),
            easing: Easing(0.4, 0, 0.2, 1),
            startDelay: Duration(milliseconds: 600),
            fillMode: AnimationFillMode.both,
          ),
        ),
      ],
    );
  }
}
