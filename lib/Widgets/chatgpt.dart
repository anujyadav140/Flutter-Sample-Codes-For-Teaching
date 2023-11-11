import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FlutterAi extends StatefulWidget {
  const FlutterAi({Key? key}) : super(key: key);

  @override
  State<FlutterAi> createState() => _FlutterAiState();
}

class _FlutterAiState extends State<FlutterAi> {
  late CollectionReference chatCollection;
  final openAI = OpenAI.instance.build(
    token: '',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    enableLog: true,
  );

  TextEditingController messageController = TextEditingController();
  List<String> chatMessages = [];

  @override
  void initState() {
    super.initState();
    chatCollection = FirebaseFirestore.instance.collection('chatMessages');

    chatCollection
        .orderBy('timestamp',
            descending: false) // Order by timestamp in ascending order
        .snapshots()
        .listen((snapshot) {
      setState(() {
        chatMessages =
            snapshot.docs.map((doc) => doc['message'].toString()).toList();
      });
    });
  }

  void _sendMessage() {
    String userMessage = messageController.text;
    setState(() {
      chatMessages.add(userMessage);
    });
    _addToFirestore(userMessage);
    completeText(userMessage);
    messageController.clear();
  }

  void _addToFirestore(String message) async {
    await chatCollection.add({
      'message': message,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  void completeText(String inputText) {
    final request = CompleteText(
      prompt: inputText,
      maxTokens: 200,
      model: TextDavinci3Model(),
    );

    openAI.onCompletion(request: request).then((response) {
      String aiResponse = response!.choices.last.text.trim();

      // Add AI response to Firestore
      _addToFirestore(aiResponse);

      setState(() {
        chatMessages.add(aiResponse);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat with AI"),
        backgroundColor: Colors.greenAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: chatMessages.length,
              itemBuilder: (context, index) {
                bool isUserMessage = index % 2 == 0;
                return ChatBubble(
                  message: chatMessages[index],
                  isUser: isUserMessage,
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: const InputDecoration(
                      hintText: "Type your message...",
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(
                    Icons.send,
                    color: Colors.green,
                  ),
                  onPressed: _sendMessage,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final String message;
  final bool isUser;

  const ChatBubble({Key? key, required this.message, required this.isUser})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment:
            isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: isUser ? Colors.blue : Colors.red,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Text(
              message,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}
