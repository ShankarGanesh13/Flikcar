import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flikcar/common_widgets/custom_appbar.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flutter/material.dart';

class CustomVideoPlayerPage extends StatefulWidget {
  final FirebaseVideoModel video;
  const CustomVideoPlayerPage({Key? key, required this.video})
      : super(key: key);

  @override
  State<CustomVideoPlayerPage> createState() => _CustomVideoPlayerPageState();
}

class _CustomVideoPlayerPageState extends State<CustomVideoPlayerPage> {
  late VideoPlayerController videoPlayerController;
  late CustomVideoPlayerController _customVideoPlayerController;

  String videoUrl =
      "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4";

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.networkUrl(Uri.parse(widget.video.videoUrl))
          ..initialize().then((value) => setState(() {}));
    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: videoPlayerController,
    );
    videoPlayerController.play();
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar.appBarWithBack(context: context),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              if (videoPlayerController.value.isInitialized)
                CustomVideoPlayer(
                  customVideoPlayerController: _customVideoPlayerController,
                ),
              if (!videoPlayerController.value.isInitialized)
                const Center(child: CircularProgressIndicator()),
            ],
          ),
        ],
      ),
    );
  }
}
