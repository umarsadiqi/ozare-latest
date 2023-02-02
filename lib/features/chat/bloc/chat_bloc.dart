import 'dart:async';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:ozare/features/chat/models/chat.dart';
import 'package:ozare/features/chat/repository/chat_repository.dart';

part 'chat_event.dart';
part 'chat_state.dart';

class ChatBloc extends Bloc<ChatEvent, ChatState> {
  ChatBloc({
    required ChatRepository chatRepository,
    required this.eventId,
  })  : _chatRepository = chatRepository,
        super(const ChatState()) {
    on<ChatSend>(_onChatSend);
    on<ChatChanged>(_onChatChanged);
    on<ChatSubscriptionRequested>(_onSubscriptionRequested);
  }

  final ChatRepository _chatRepository;
  final String eventId;

  /// EVENT HANDLERS
  /// [ChatChanged] event handler
  void _onChatChanged(
    ChatChanged event,
    Emitter<ChatState> emit,
  ) {
    emit(state.copyWith(chats: event.chat, status: ChatStatus.success));
  }

  /// Chat Stream
  Future<void> _onSubscriptionRequested(
    ChatSubscriptionRequested event,
    Emitter<ChatState> emit,
  ) async {
    await emit.forEach(_chatRepository.chatStream(eventId),
        onData: (chats) => state.copyWith(
              chats: chats,
              status: ChatStatus.success,
            ),
        onError: (erro, __) {
          log('ChatBloc: onError: ${erro.toString()}');
          return state.copyWith(
            status: ChatStatus.failure,
          );
        });
  }

  /// [ChatSend] event handler
  void _onChatSend(
    ChatSend event,
    Emitter<ChatState> emit,
  ) async {
    await _chatRepository.sendChat(eventId, event.chat);
    emit(state.copyWith(status: ChatStatus.success));
  }
}
