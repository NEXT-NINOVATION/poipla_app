import 'package:flutter/material.dart';
import 'package:poipla_app/screens/adventure/game/models/settings.dart';
import 'package:provider/provider.dart';

// This class represents the settings menu.
class SettingsMenuScrreen extends StatelessWidget {
  const SettingsMenuScrreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Game title.
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 50.0),
              child: Text(
                'せってい',
                style: TextStyle(
                  fontSize: 50.0,
                  color: Colors.black,
                  shadows: [
                    Shadow(
                      blurRadius: 20.0,
                      color: Colors.white,
                      offset: Offset(0, 0),
                    )
                  ],
                ),
              ),
            ),

            // Switch for sound effects.
            Selector<Settings, bool>(
              selector: (context, settings) => settings.soundEffects,
              builder: (context, value, child) {
                return SwitchListTile(
                  title: const Text('こうかおん'),
                  value: value,
                  onChanged: (newValue) {
                    Provider.of<Settings>(context, listen: false).soundEffects =
                        newValue;
                  },
                );
              },
            ),

            // Switch for background music.
            Selector<Settings, bool>(
              selector: (context, settings) => settings.backgroundMusic,
              builder: (context, value, child) {
                return SwitchListTile(
                  title: const Text('びーじーえむ'),
                  value: value,
                  onChanged: (newValue) {
                    Provider.of<Settings>(context, listen: false)
                        .backgroundMusic = newValue;
                  },
                );
              },
            ),

            // Back button.
            SizedBox(
              width: MediaQuery.of(context).size.width / 4,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Icon(Icons.arrow_back),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
