import 'package:flutter/material.dart';
import 'package:mindlee_demo/src/app/constants.dart';

class HeaderButtons extends StatelessWidget {
  const HeaderButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: headerPadding,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            backgroundColor: Colors.white,
            child: IconButton(
              icon:
                  const Icon(Icons.arrow_back_ios_new, color: headerIconColor),
              onPressed: () {
                print("Back button pressed");
                // Handle back button press
              },
            ),
          ),
          const Text('Günlük Mesaj', style: headerTitleStyle),
          CircleAvatar(
            backgroundColor: Colors.white,
            child: PopupMenuButton<String>(
              icon: const Icon(Icons.more_vert, color: headerIconColor),
              onSelected: (String result) {
                print('Selected: $result');
              },
              itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                const PopupMenuItem<String>(
                  value: 'Option 1',
                  child: Text('Option 1'),
                ),
                const PopupMenuItem<String>(
                  value: 'Option 2',
                  child: Text('Option 2'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
