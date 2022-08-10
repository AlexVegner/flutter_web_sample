import 'package:flutter/material.dart';
import 'package:web_app/common/routes/app_router.dart';

class UnknownPage extends StatelessWidget {
  const UnknownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const Text("Page not found"),
            TextButton(
              child: const Text("Continue"),
              onPressed: () {
                AutoRouter.of(context).pushAndPopUntil(const SplashRoute(),
                    predicate: (route) => false);
              },
            ),
          ],
        ),
      ),
    );
  }
}
