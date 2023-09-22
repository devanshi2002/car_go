import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:spotify_clone/navigations/tabbar.dart';

class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topLeft, children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.black.withOpacity(0),
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
                Colors.black.withOpacity(1),
              ])),
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 70,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Recently Played",
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              Row(
                                children: [
                                  Icon(Icons.settings),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Icon(Icons.history),
                                ],
                              )
                            ]),
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(25.0),
                        child: Row(
                          children: [
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                            AlbumCard(),
                            SizedBox(
                              width: 15,
                            ),
                          ],
                        ),
                      )
                    ]),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}

class AlbumCard extends StatelessWidget {
  const AlbumCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(
          "assets/album1.jpg",
          width: 120,
          height: 120,
          
        ),
        SizedBox(
          height: 10,
        ),
        Text("xyz"),
      ],
    );
  }
}
