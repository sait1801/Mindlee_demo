import 'package:flutter_clean_architecture/flutter_clean_architecture.dart';
import 'package:mindlee_demo/src/domain/entities/message.dart';
import 'package:mindlee_demo/src/data/repositories/data_message_repository.dart';

class HomeController extends Controller {
  final DataMessageRepository _messageRepository;
  List<Message> messages = [];
  bool isLoading = false; //for circular loading UI

  HomeController() : _messageRepository = DataMessageRepository();

  @override
  void onInitState() {
    super.onInitState();
    loadMessages();
  }

  @override
  void initListeners() {}

  Future<void> loadMessages() async {
    isLoading = true;
    refreshUI(); //open the circular progress bar

    try {
      messages = await _messageRepository.getMessages();
    } catch (e) {
      // Pirnt the error
      print('Error loading messages: $e');
    } finally {
      isLoading = false;
      refreshUI();
    }
  }

  Future<void> likeMessage(String id, bool liked) async {
    try {
      await _messageRepository.likeMessage(id, liked); //for firebase writing
      // Update the local list of messages
      await _messageRepository.getMessages();
      refreshUI();
    } catch (e) {
      // Handle error
      print('Error liking message: $e');
    }
  }
}
