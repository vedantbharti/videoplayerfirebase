import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../my_vide_fire_bloc/video_fire_model.dart';
import 'mvf_player.dart';
import 'utils.dart';

class VideoFireItem extends StatelessWidget {
  final VFModel video;
  final double dim;

  const VideoFireItem({Key? key, required this.video, required this.dim})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MVFPlayer(
              key: UniqueKey(),
              controller: VideoPlayerController.network(video.url),
              videoSize: Size(
                MediaQuery.of(context).size.width * (0.5),
                MediaQuery.of(context).size.height * (0.5),
              ),
            ),
          ),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            width: dim,
            height: dim,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: const BorderRadius.all(Radius.circular(16.0)),
              gradient: LinearGradient(
                begin: Alignment.centerLeft,
                end: Alignment.bottomRight,
                colors: <Color>[
                  Colors.blue.withOpacity(0.5),
                  Colors.white,
                ],
                tileMode: TileMode.mirror,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.video_collection,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Text(
                        video.name,
                        style: UIUtils.cardStyle(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.calendar_today,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Text(
                        UIUtils.getDateOfUpload(video.uploadTime),
                        style: UIUtils.cardStyle(),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8.0),
                        child: Icon(
                          Icons.access_time,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),
                      Text(
                        UIUtils.getTimeOfUpload(video.uploadTime),
                        style: UIUtils.cardStyle(),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
