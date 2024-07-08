import 'package:flutter/material.dart';
import 'package:mindlee_demo/src/app/constants.dart';
import 'package:mindlee_demo/src/app/pages/utilities/datetime_parser.dart';
import 'package:mindlee_demo/src/domain/entities/message.dart';
import 'package:mindlee_demo/src/app/pages/home/home_controller.dart';
// import 'package:share_plus/share_plus.dart';

class ScrollableCards extends StatelessWidget {
  final List<Message> messages;
  final HomeController controller;

  const ScrollableCards({
    Key? key,
    required this.messages,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double maxHeigth = MediaQuery.of(context).size.height * 0.8;
    return Expanded(
      child: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          return Center(
              child: _buildMessageCard(messages[index], controller, maxHeigth));
        },
      ),
    );
  }

  Widget _buildMessageCard(
      Message message, HomeController controller, double maxHeigth) {
    final now = DateTime.now();
    final formattedDate = StringUtils.convertDateToString(now);

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: maxHeigth,
      ),
      child: Card(
        margin: const EdgeInsets.all(16.0),
        color: cardBackgroundColor,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Sevgili Faik',
                      style: nameTextStyle,
                    ),
                    Text(
                      formattedDate,
                      style: dateTimeFontStyle,
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  message.content,
                  style: messageContentFontStyle,
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: 22,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 20,
                        child: IconButton(
                          icon: Icon(
                            message.liked
                                ? Icons.favorite
                                : Icons.favorite_border,
                            color: message.liked ? Colors.red : Colors.white,
                            size: 20,
                          ),
                          onPressed: () => controller.likeMessage(
                              message.id, !message.liked),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: IconButton(
                        icon: const Icon(Icons.ios_share_rounded,
                            color: Colors.white, size: 20),
                        onPressed: () async {
                          print("Shared");
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
