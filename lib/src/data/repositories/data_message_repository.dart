import 'package:mindlee_demo/src/domain/entities/message.dart';
import 'package:mindlee_demo/src/domain/repositories/message_repository.dart';

class DataMessageRepository implements MessageRepository {
  List<Message> messages = [
    Message(id: '1', content: "Lorem Ipsum", liked: false),
    Message(
        id: '2',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus magna, lacinia non velit ut, efficitur efficitur nibh.',
        liked: true),
    Message(
        id: '3',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus magna, lacinia non velit ut, efficitur efficitur nibh. Vivamus volutpat, lacus eu ultricies ultricies, nisi mi aliquet orci, nec efficitur felis lacus et turpis',
        liked: false),
    Message(
        id: '4',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus magna, lacinia non velit ut, efficitur efficitur nibh. Vivamus volutpat, lacus eu ultricies ultricies, nisi mi aliquet orci, nec efficitur felis lacus et turpis. Curabitur faucibus, magna vel cursus egestas, libero est fermentum neque, sit amet auctor erat elit eu nisi.',
        liked: true),
    Message(
        id: '5',
        content:
            'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus purus magna, lacinia non velit ut, efficitur efficitur nibh. Vivamus volutpat, lacus eu ultricies ultricies, nisi mi aliquet orci, nec efficitur felis lacus et turpis. Curabitur faucibus, magna vel cursus egestas, libero est fermentum neque, sit amet auctor erat elit eu nisi. Nunc egestas eget mauris ut vulputate. Maecenas tincidunt id lectus sed porttitor. Phasellus lacus nisl, finibus id mi sed, laoreet mattis dui. Quisque id elit risus.',
        liked: false),
  ];

  @override
  Future<List<Message>> getMessages() async {
    List<Message> messageToReturn = [];
    if (messages.isEmpty == true) {
      messageToReturn = messages; //this must be a firestore read call
    } else {
      messageToReturn = messages;
    }

    return messageToReturn;
  }

  @override
  Future<void> likeMessage(String id, bool liked) async {
    // Find the message with the given id
    int index = messages.indexWhere((message) => message.id == id);

    if (index != -1) {
      // Create a new Message object with the updated 'liked' status
      Message updatedMessage = Message(
        id: messages[index].id,
        content: messages[index].content,
        liked: liked,
      );

      // Replace the old message with the updated one
      messages[index] = updatedMessage;

      // TODO: Update the message in Firestore
      // When implementing Firestore, you would update the document here

      print('Message $id liked status changed to: $liked');
    } else {
      print('Message with id $id not found');
      print(messages);
    }
  }
}
