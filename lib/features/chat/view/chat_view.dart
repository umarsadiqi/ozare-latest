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
          if (showChatBox) const SizedBox(height: 12),

          showChatBox
              ? ConversationHeader(onTap: () {
                  context.read<HomeCubit>().disableHide();
                  setState(() {
                    showChatBox = false;
                  });
                })
              : const Header(),

          if (!showChatBox) const Divider(),

          // Chat List
          showChatBox
              ? Expanded(
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
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                          onTap: () {
                            context.read<HomeCubit>().enableHide();
                            setState(() {
                              showChatBox = true;
                            });
                          },
                          child: const ChatTile());
                    },
                  ),
                ),

          // if (showChatBox) const ChatInput(),
        ],
      ),
    );
  }
}
