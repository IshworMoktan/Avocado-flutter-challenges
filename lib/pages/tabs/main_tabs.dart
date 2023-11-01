import 'package:avocado/pages/tabs/post_tabs.dart';
import 'package:avocado/pages/tabs/video_tabs.dart';
import 'package:flutter/material.dart';

class MainTabbedPage extends StatelessWidget {
  const MainTabbedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverAppBar(
                flexibleSpace: Container(
                  decoration: const BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xffb1fff8), Color(0xffffffff)],
                    stops: [0, 1],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  )),
                ),
                title: Row(
                  children: [
                    SizedBox(
                        height: 25,
                        width: 25,
                        child: Image.asset(
                          'assets/images/logo_avocado.png',
                          color: Colors.green,
                        )),
                    const Text(
                      'avocado',
                      style: TextStyle(
                          color: Color.fromARGB(255, 4, 125, 8),
                          fontSize: 20,
                          fontWeight: FontWeight.w100),
                    ),
                  ],
                ),
                actions: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.share_outlined))
                ],
                bottom: TabBar(
                  isScrollable: true,
                  labelColor: Colors.black,
                  dividerColor: Colors.transparent,
                  indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(50), // Creates border
                      color: Colors.greenAccent.withOpacity(0.2)),
                  tabs: const [
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.movie), Text('  Videos')],
                        ),
                      ),
                    ),
                    Tab(
                      child: Padding(
                        padding: EdgeInsets.only(
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [Icon(Icons.message), Text('  Posts')],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ];
          },
          body: const TabBarView(
            children: [VideoTabbedPage(), PostTabbedPage()],
          ),
        ),
      ),
    );
  }
}
