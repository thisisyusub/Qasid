import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SourceSelectionPage extends StatelessWidget {
  const SourceSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              'Select sources of news\nyou want to get',
              style: Theme.of(context).textTheme.headline6,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemBuilder: (_, i) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          'Technote',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Transform.scale(
                          scale: 0.8,
                          child: CupertinoSwitch(
                            value: true,
                            activeColor: Colors.black,
                            onChanged: (_) {},
                          ),
                        ),
                      ],
                    ),
                  );
                },
                itemCount: 10,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {},
                child: Text('Continue'),
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.black,
                  ),
                  fixedSize: MaterialStateProperty.all(
                    const Size(200.0, 50.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
