import 'package:dawn/dawn.dart';

import 'screens/cookbook.dart' deferred as cookbook;
import 'screens/donate.dart' deferred as donate;
import 'screens/features.dart' deferred as features;
import 'screens/get_started.dart' deferred as get_started;
import 'screens/home.dart';
import 'screens/install.dart' deferred as install;
import 'screens/loading.dart';
import 'widgets/button.dart';
import 'widgets/drawer.dart';
import 'widgets/theme.dart';

void main() {
  runApp(
    Provider(
      stores: [
        Theme()
          ..useLightMode()
          ..initialize()
      ],
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(final BuildContext context) {
    return ConsumerBuilder<Theme>((final context, final store) {
      return Container(
        [
          Container(
            [
              Navigator(
                loading: const Loading(),
                child: const Home(),
                pushAnimation: Animation(
                  keyframes: const [
                    Keyframe(
                      offset: 0,
                      style: Style({
                        'opacity': '0',
                        'transform': 'translateY(64px)',
                      }),
                    ),
                    Keyframe(
                      offset: 1,
                      style: Style({
                        'opacity': '1',
                        'transform': 'translateY(0px)',
                      }),
                    )
                  ],
                  duration: store.standardDuration,
                  easing: store.decelerationCurve,
                  startDelay: store.standardDuration,
                  fillMode: AnimationFillMode.both,
                ),
                popAnimation: Animation(
                  keyframes: const [
                    Keyframe(
                      offset: 0,
                      style: Style({
                        'opacity': '0',
                        'transform': 'translateY(-64px)',
                      }),
                    ),
                    Keyframe(
                      offset: 1,
                      style: Style({
                        'opacity': '1',
                        'transform': 'translateY(0px)',
                      }),
                    )
                  ],
                  duration: store.standardDuration,
                  easing: store.decelerationCurve,
                  startDelay: store.standardDuration,
                  fillMode: AnimationFillMode.both,
                ),
              )
            ],
            style: const Style({'overflow': 'hidden'}),
          ),
          Drawer([
            Button.drawer(
              text: 'Home',
              icon: 'home',
              onTap: (final event) => context
                ..pushRoute(builder: (final context) => const Home())
                ..pop(),
            ),
            Button.drawer(
              text: 'Install',
              icon: 'download',
              onTap: (final event) => context
                ..pushRouteLazily(
                  loader: install.loadLibrary,
                  builder: (final context) => install.Install(),
                )
                ..pop(),
            ),
            Button.drawer(
              text: 'Get Started',
              icon: 'start',
              onTap: (final event) => context
                ..pushRouteLazily(
                  loader: get_started.loadLibrary,
                  builder: (final context) => get_started.GetStarted(),
                )
                ..pop(),
            ),
            Button.drawer(
              text: 'Features',
              icon: 'list',
              onTap: (final event) => context
                ..pushRouteLazily(
                  loader: features.loadLibrary,
                  builder: (final context) => features.Features(),
                )
                ..pop(),
            ),
            Button.drawer(
              text: 'Cookbook',
              icon: 'book',
              onTap: (final event) => context
                ..pushRouteLazily(
                  loader: cookbook.loadLibrary,
                  builder: (final context) => cookbook.Cookbook(),
                )
                ..pop(),
            ),
            Button.drawer(
              text: 'Donate',
              icon: 'monetization_on',
              onTap: (final event) => context
                ..pushRouteLazily(
                  loader: donate.loadLibrary,
                  builder: (final context) => donate.Donate(),
                )
                ..pop(),
            ),
            const Button.drawer(
              icon: 'open_in_new',
              text: 'Pub',
              link: 'https://pub.dev/packages/dawn',
            ),
            const Button.drawer(
              icon: 'open_in_new',
              text: 'GitHub',
              link: 'https://github.com/Hawmex/dawn',
            ),
            const Button.drawer(
              text: 'Contribute To This Website',
              icon: 'open_in_new',
              link: 'https://github.com/Hawmex/dawn_website',
            )
          ]),
        ],
        style: Style({
          'background': store.backgroundColor.toString(),
          'color': store.onBackgroundColor.toString(),
          'height': '100vh',
          'overflow': 'auto',
        }),
      );
    });
  }
}
