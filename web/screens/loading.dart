import 'package:dawn/dawn.dart';

import '../widgets/progress_bar.dart';
import '../widgets/screen.dart';

class Loading extends StatelessWidget {
  const Loading({super.key});

  @override
  Widget build(final BuildContext context) {
    return const Screen([ProgressBar()]);
  }
}
