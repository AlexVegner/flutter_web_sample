import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:web_app/common/routes/app_router.dart';
import 'package:web_app/cubits/theme/theme_cubit.dart';
import 'package:web_app/widget/common_scaffold.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextButton(
                  onPressed: () {
                    context.read<ThemeCubit>().toggle();
                  },
                  child: const Text('Switch Theme')),
              TextButton(
                  onPressed: () {
                    AutoRouter.of(context).replaceAll([const LoginRoute()]);
                  },
                  child: const Text('Logout')),
            ],
          ),
        ),
      ),
    );
  }
}
