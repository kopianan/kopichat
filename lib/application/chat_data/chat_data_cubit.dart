import 'package:bloc/bloc.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'chat_data_state.dart';
part 'chat_data_cubit.freezed.dart';

@injectable
class ChatDataCubit extends Cubit<ChatDataState> {
  ChatDataCubit() : super(ChatDataState.initial());

  void setCurrentRoom(Room room) {
    emit(state.copyWith(currentRoom: room));
  }
  void setLastMessage(Message message){
    emit(state.copyWith(lastMessage: message)); 
  }
}
