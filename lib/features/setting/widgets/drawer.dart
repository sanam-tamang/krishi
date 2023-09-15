import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/brightness_changer_bloc/brightness_changer_bloc.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [_buildThemeMode()],
      ),
    );
  }

  BlocBuilder<BrightnessChangerBloc, BrightnessChangerState> _buildThemeMode() {
    return BlocBuilder<BrightnessChangerBloc, BrightnessChangerState>(
      builder: (context, state) {
        return ListTile(
            title: const Text("Theme mode"),
            trailing: IconButton(
              onPressed: () {
                context.read<BrightnessChangerBloc>().add(ChangeBrightness());
              },
              icon: Animate().toggle(
                duration: 2.seconds,
                builder: (_, value, __) => Icon(
                    state.brightness == ThemeMode.light
                        ? Icons.light_mode
                        : Icons.dark_mode),
              ),
            ));
      },
    );
  }
}
