import 'package:flutter/material.dart';
import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';

class FlutterAi extends StatefulWidget {
  const FlutterAi({Key? key}) : super(key: key);

  @override
  State<FlutterAi> createState() => _FlutterAiState();
}

class _FlutterAiState extends State<FlutterAi> {
  final openAI = OpenAI.instance.build(
    token: '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',
    baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
    enableLog: true,
  );

  TextEditingController messageController = TextEditingController();
  List<String> chatMessages = [];

  void _sendMessage() {
    String userMessage = messageController.text;
    setState(() {
      chatMessages.add(userMessage);
    });
    completeText(userMessage);
    messageController.clear();
  }

  void completeText(String inputText) {
    final request = CompleteText(
      prompt: inputText,
      maxTokens: 200,
      model: TextDavinci3Model(),
    );

    openAI.onCompletion(request: request).then((response) {
      setState(() {
        chatMessages.add(response!.choices.last.text.toString().trim());
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
              // return Text(chatMessages[index]);
            },
          )),
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

  const ChatBubble({super.key, required this.message, required this.isUser});

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
