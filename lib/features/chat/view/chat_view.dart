import 'package:flutter/material.dart';
import 'package:ozare/features/chat/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/features/home/home.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  bool showChatBox = false;

  final List<String> messages = [
    'Ipsum random text jdkf aoiein dljaife',
    'Ipsum random text jdkf aoiein dljaife',
    'Ipsum random text jdkf aoiein dljaife asdf fawef awef',
    'Ipsum random ',
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height * 0.55,
      child: Column(
        children: [
          // const SizedBox(height: 12),
          // ConversationHeader(onTap: () {
          //   context.read<HomeCubit>().disableHide();
          //   setState(() {
          //     showChatBox = false;
          //   });
          // }),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(bottom: 32),
              itemCount: messages.length,
              itemBuilder: (context, index) {
                return ChatBubble(
                  message: messages[index],
                  isMe: index % 2 == 0,
                );
              },
            ),
          ),
          const ChatInput(),
        ],
      ),
    );
  }
}
