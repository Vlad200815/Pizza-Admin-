part of 'upload_picture_bloc.dart';

sealed class UploadPictureEvent extends Equatable {
  const UploadPictureEvent();

  @override
  List<Object?> get props => [];
}

class UploadPicture extends UploadPictureEvent {
  final Uint8List file;

  const UploadPicture(this.file);

  @override
  List<Object?> get props => [file];
}
