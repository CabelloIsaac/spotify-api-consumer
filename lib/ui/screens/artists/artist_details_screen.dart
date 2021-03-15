import 'package:flutter/material.dart';

class ArtistDetailsScreen extends StatelessWidget {
  static final String route = "/ArtistDetailsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 300.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.pin,
                centerTitle: true,
                title: Text("Pitbull",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    )),
                background: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 75,
                      backgroundImage: NetworkImage(
                        "https://i.scdn.co/image/1353990534aef10c946cf3a47865ac22471be5c4",
                      ),
                    ),
                    SizedBox(height: 30),
                    Text("2312312 fans"),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Center(
          child: Text("Sample Text"),
        ),
      ),
    );
  }
}
