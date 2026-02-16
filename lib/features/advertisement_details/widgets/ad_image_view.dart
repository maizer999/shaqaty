import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../../home/data/item_model.dart';

class AdImageViewer extends StatelessWidget {
  final List<String?> images;
  final ItemModel model;

  const AdImageViewer({super.key, required this.images, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          final url = images[index] ?? "";
          if (url.contains("youtube.com") || url.contains("youtu.be")) {
            return _buildYoutubePreview(url);
          }
          return Image.network(url, fit: BoxFit.cover);
        },
      ),
    );
  }

  Widget _buildYoutubePreview(String url) {
    String? videoId = YoutubePlayer.convertUrlToId(url);
    String thumb = YoutubePlayer.getThumbnail(videoId: videoId!);
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(thumb, fit: BoxFit.cover, width: double.infinity),
        const Icon(Icons.play_circle_fill, size: 60, color: Colors.white),
      ],
    );
  }
}