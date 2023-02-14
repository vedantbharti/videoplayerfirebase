import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';

import 'video_fire_model.dart';

class MVFBloc {
  ValueNotifier<List<VFModel>> videoNotifier = ValueNotifier([]);
  final Reference storageRef = FirebaseStorage.instance.ref();

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

      VFModel? video = await _uploadToFirebase(file);

      if (video == null) {
        return;
      }

      //
      //
      // updateVideos(newVideo);


    }  catch (e) {
      print(e);
    }
  }

  Future<VFModel?> _uploadToFirebase(PlatformFile file) async {
    try {
      int uploadTime = DateTime.now().millisecondsSinceEpoch;
      await storageRef.putFile(File(file.path!), SettableMetadata(
        contentType: "image/jpeg",
        customMetadata: {
          "uploadTime" : uploadTime.toString(),
          "name" : file.name,
        }
      ),);

    } catch (e) {
      print(e);
    }
  }
}
