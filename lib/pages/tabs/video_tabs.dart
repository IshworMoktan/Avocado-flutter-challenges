import 'package:flutter/material.dart';
import 'video_tab_pages/video_trending_page.dart';
import 'video_tab_pages/new_video_page.dart';
import 'video_tab_pages/video_favourite_page.dart';

class VideoTabbedPage extends StatelessWidget {
  const VideoTabbedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          bottom: const TabBar(
            isScrollable: false,
            tabs: [
              Tab(text: 'Latest'),
              Tab(text: 'Trending'),
              Tab(text: 'Favourite'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [NewVideoPage(), VideoTrendingPage(), VideoFavouritePage()],
        ),
      ),
    );
  }
}
