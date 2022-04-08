import 'package:flutter/material.dart';

import '../../constants/text_types.dart';
import '../scrolls/horizontal_scroll_items.dart';

class HomeScreen extends StatefulWidget {
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with AutomaticKeepAliveClientMixin{

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xfff6f6f6),
      appBar: AppBar(
          toolbarHeight: 80,
          title: Container(
            margin: const EdgeInsets.symmetric(vertical: 15),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30.0)),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(18.0, 4, 0, 4),
              child: TextField(
                decoration: InputDecoration(
                    icon: const Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0))),
              ),
            ),
          )),
      body: ListView(addAutomaticKeepAlives: true, children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Find Your Desired Item',
                style: heading,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Recommended Items For you',
                      style: subheading,
                    ),
                    const Chip(
                        label: Text('See More'),
                        avatar: Icon(Icons.arrow_forward))
                  ],
                ),
              ),
            ],
          ),
        ),
        const HorizontalScrollItems(),
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 18.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Trending deals',
                    style: subheading,
                  ),
                  const Chip(
                      label: Text('See More'),
                      avatar: Icon(Icons.arrow_forward))
                ],
              ),
            ),
          ],
        ),
        const HorizontalScrollItems()
      ]),
    );
  }
}
