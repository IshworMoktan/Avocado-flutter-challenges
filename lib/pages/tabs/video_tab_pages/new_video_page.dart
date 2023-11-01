import 'package:avocado/pages/others/video_detail_page.dart';
import 'package:avocado/services/models/video_data_model.dart';
import 'package:avocado/utils/styles.dart';
import 'package:avocado/widgets/global/globalWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';

class NewVideoPage extends StatelessWidget {
  const NewVideoPage({super.key});
  Future<List<VideoDataModel>> readJsonData() async {
    final jsonData = await rootBundle.loadString('assets/json/video_list.json');
    final list = json.decode(jsonData) as List<dynamic>;
    return list.map((e) => VideoDataModel.fromJson(e)).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: readJsonData(),
          builder: (context, data) {
            if (data.hasError) {
              return Center(
                child: Text('${data.error}'),
              );
            } else if (data.hasData) {
              var items = data.data as List<VideoDataModel>;
              return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.35,
                  ),
                  itemCount: items == null ? 0 : items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (builder) => VideoDetailPage(
                              ytUrl: items[index].videoUrl.toString(),
                            ),
                          ),
                        );
                      },
                      child: VideoCard(
                        title: items[index].title.toString(),
                        thumbnail: items[index].thumbnail.toString(),
                        videoUrl: items[index].videoUrl.toString(),
                      ),
                    );
                  });
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }
}

class VideoCard extends StatelessWidget {
  final String title;
  final String thumbnail;
  final String videoUrl;

  VideoCard(
      {required this.title, required this.thumbnail, required this.videoUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 50,
            width: 180,
            child: Text(
              title,
              maxLines: 3,
              style: const TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                  width: 80,
                  height: 20,
                  child: pilllogo(
                      'assets/images/youtube_logo.svg', 'YouTube', '#E21F27')),
              timestamp('1 hour ago')
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          SizedBox(
            height: 128,
            width: 166,
            child: Stack(
              children: [
                SizedBox(
                  height: 128,
                  width: 166,
                  child: Image.network(
                    thumbnail,
                    fit: BoxFit.cover,
                  ),
                ),
                const Center(
                    child: Icon(
                  Icons.circle,
                  color: Colors.white,
                  size: 50,
                )),
                const Center(
                    child: Icon(
                  Icons.play_arrow_rounded,
                  color: Colors.black,
                )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
