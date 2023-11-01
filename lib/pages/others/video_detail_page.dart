import 'package:avocado/utils/styles.dart';
import 'package:avocado/widgets/global/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoDetailPage extends StatefulWidget {
  String ytUrl;
  VideoDetailPage({super.key, required this.ytUrl});

  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  YoutubePlayerController? _ytController;

  String? videoId;
  late YoutubeMetaData _videoMetaData;

  @override
  void initState() {
    super.initState();
    videoId = YoutubePlayer.convertUrlToId(widget.ytUrl);
    _ytController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        showLiveFullscreenButton: true,
        hideControls: false,
        disableDragSeek: false,
      ),
    )..addListener(listener);
    _videoMetaData = const YoutubeMetaData();
  }

  void listener() {
    setState(() {
      _videoMetaData = _ytController!.metadata;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackButton(),
        title: const Text('Post'),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.favorite_outline)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.share_outlined))
        ],
      ),
      body: Column(
        children: [
          YoutubePlayer(
            controller: _ytController!,
            onReady: () {
              _ytController?.addListener(listener);
            },
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                    width: 80,
                    height: 20,
                    child: pilllogo('assets/images/youtube_logo.svg', 'YouTube',
                        '#E21F27')),
                timestamp('1 hour ago')
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: Text(
                _videoMetaData.title,
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Text(
                'Video By: ${_videoMetaData.author}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold, color: Colors.black),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
                'This is only Static Descrition. \n Smart Krishi, as the name indicates is a revolutionizing smartphone application, (first of its kind in Nepal) caters to every aspect of farming activities and large pool of relevant information for empowerment of professional Nepali agriculture. Today, when information is a mere fingertip away, why not use it?'),
          )
        ],
      ),
    );
  }
}
