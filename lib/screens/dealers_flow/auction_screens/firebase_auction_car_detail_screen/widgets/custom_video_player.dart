import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomVideoPlayerPage extends StatefulWidget {
  const CustomVideoPlayerPage({Key? key}) : super(key: key);

  @override
  State<CustomVideoPlayerPage> createState() => _CustomVideoPlayerPageState();
}

class _CustomVideoPlayerPageState extends State<CustomVideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController = VideoPlayerController.network(videoUrl)
      ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text("dedsdsd"),
      ),
      child: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            if (videoPlayerController.value.isInitialized)
              CustomVideoPlayer(
                customVideoPlayerController: _customVideoPlayerController,
              ),
            if (!videoPlayerController.value.isInitialized)
              CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
