import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ozare/common/widgets/widgets.dart';
import 'package:ozare/features/chat/bloc/chat_bloc.dart';
import 'package:ozare/features/chat/models/chat.dart';
import '../../event/widgets/widgets.dart';

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
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        log('Chat Status: ${state.status}');
      },
      builder: (context, state) {
        final status = state.status;

        if (status == ChatStatus.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (status == ChatStatus.success) {
          final List<Chat> chats = state.chats;
          chats.sort((a, b) => b.timestamp.compareTo(a.timestamp));

          log('Chat Length: ${chats.length}');
          return SizedBox(
            height: size.height * 0.55,
            child: Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    reverse: true,
                    padding: const EdgeInsets.only(bottom: 32),
                    itemCount: chats.length,
                    itemBuilder: (context, index) {
                      return ChatBubble(
                        chat: chats[index],
                      );
                    },
                  ),
                ),
                const ChatInput(),
              ],
            ),
          );
        }
        return const Loader(message: 'Loading...');
      },
    );
  }
}
