import 'package:flutter/material.dart';
import 'package:mindlee_demo/src/app/constants.dart';

class FooterButtons extends StatelessWidget {
  const FooterButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: footerPadding,
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: footerButtonBackgroundColor,
                foregroundColor: footerButtonForegroundColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(footerButtonBorderRadius),
                ),
              ),
              onPressed: () {
                // Handle button press
              },
              child: const Text(footerButtonText),
            ),
          ),
          const SizedBox(width: footerButtonSpacing),
          CircleAvatar(
            backgroundColor: footerButtonBackgroundColor,
            child: IconButton(
              icon: const Icon(Icons.mode_edit_outline_outlined,
                  color: footerEditIconColor),
              onPressed: () {
                // Handle edit button press
              },
            ),
          ),
        ],
      ),
    );
  }
}
