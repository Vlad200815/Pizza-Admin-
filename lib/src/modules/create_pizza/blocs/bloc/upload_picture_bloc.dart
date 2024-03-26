import 'dart:html' as html;
import 'dart:typed_data';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:pizza_repository/pizza_repository.dart';

part 'upload_picture_event.dart';
part 'upload_picture_state.dart';

class UploadPictureBloc extends Bloc<UploadPictureEvent, UploadPictureState> {
  PizzaRepo pizzaRepo;

  UploadPictureBloc(this.pizzaRepo) : super(UploadPictureInitial()) {
    on<UploadPicture>((event, emit) async {
      emit(UploadPictureLoading());
      try {
        String url = await pizzaRepo.sendImage(event.file);
        emit(UploadPictureSuccess(url));
      } catch (e) {
        emit(UploadPictureFailure());
      }
    });
  }
}
