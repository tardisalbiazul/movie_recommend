import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../theme/theme_export.dart';
import '../../../core/core.dart';
import '../movie_flow_export.dart';

class LandingScreen extends ConsumerWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.light_mode),
            onPressed: () {
              Navigator.restorablePushNamed(context, ThemeView.routeName);
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.horizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Text(
                    '${AppLocalizations.of(context)?.landingFindMovie}',
                    style: Theme.of(context).textTheme.headline5,
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Flexible(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.all(AppConstants.horizontalPadding),
                    child: Image.asset('assets/images/cinema_vector.png'),
                  ),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              onPressed: () =>
                  ref.read(pageControllerProvider.notifier).nextPage(),
              text: '${AppLocalizations.of(context)?.landingGetStarted}',
            ),
          ],
        ),
      ),
    );
  }
}
