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
}
