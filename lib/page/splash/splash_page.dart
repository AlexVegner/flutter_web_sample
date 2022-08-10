import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:web_app/common/routes/app_router.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), () {
      AutoRouter.of(context)
          .pushAndPopUntil(const LoginRoute(), predicate: (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.grey.shade900,
      child: Center(
        child: _buildLiquidText(),
      ),
    );
  }

  Widget _buildLiquidText() {
    return Container(
      color: Colors.white,
      child: SizedBox(
        child: TextLiquidFill(
          text: 'Sample Project',
          waveColor: Colors.lightBlue,
          boxBackgroundColor: Colors.grey.shade900,
          textStyle: const TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
          ),
          loadDuration: const Duration(seconds: 4),
        ),
      ),
    );
  }
}
