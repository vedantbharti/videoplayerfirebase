import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';

import 'video_fire_model.dart';

class MVFBloc {
  ValueNotifier<List<VFModel>> videoNotifier = ValueNotifier([]);

  updateVideos(VFModel vfModel) {
    List<VFModel> _vids = [];
    _vids.addAll(videoNotifier.value);
    _vids.add(vfModel);
    videoNotifier.value = _vids;
  }

  void pickFile() async {
    try {

      FilePickerResult? filePickerResult = (await FilePicker.platform.pickFiles(
        type: FileType.video,
        allowMultiple: false,
        onFileLoading: (FilePickerStatus status) => print(status),));
      if (filePickerResult == null && filePickerResult!.files.isNotEmpty) return;

      PlatformFile file = filePickerResult.files.first;

      bool isUploadSuccessful = await _uploadToFirebase(file);

      if (!isUploadSuccessful) {
        return;
      }

      VFModel newVideo = VFModel(
        name: file.name,
        uploadTime: DateTime.now().millisecondsSinceEpoch,
        url: file.path!,
      );

      updateVideos(newVideo);


    }  catch (e) {
      print(e);
    }
  }

  Future<bool> _uploadToFirebase(PlatformFile file) async {



    return false;
  }
}
