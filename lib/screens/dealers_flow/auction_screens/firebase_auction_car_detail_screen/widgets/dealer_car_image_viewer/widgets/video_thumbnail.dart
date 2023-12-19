import 'package:flikcar/common_widgets/loading_widget.dart';
import 'package:flikcar/models/image_model.dart';
import 'package:flikcar/screens/dealers_flow/auction_screens/firebase_auction_car_detail_screen/widgets/custom_video_player.dart';
import 'package:flikcar/utils/colors.dart';
import 'package:flutter/material.dart';

class VideoThumbnail extends StatelessWidget {
  final List<FirebaseVideoModel> videos;
  const VideoThumbnail({super.key, required this.videos});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: videos.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CustomVideoPlayerPage(
                      video: videos[index],
                    ),
                  ));
            },
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 3.8,
                width: MediaQuery.of(context).size.width,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    '${videos[index].thumbnailUrl}',
                    fit: BoxFit.fill,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: const Icon(Icons.error));
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      } else {
                        return Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: AppColors.grey)),
                          child: const LoadingWidget(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          );
        });
  }
}
