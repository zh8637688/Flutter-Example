import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:zhihu_daily/constants/pages.dart';
import 'package:zhihu_daily/model/story.dart';
import 'package:zhihu_daily/manager/collectionManager.dart';

class PageCollection extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageCollection> {
  String appBarTitle = '收藏';
  List<StoryModel> stories = [];

  @override
  void initState() {
    super.initState();
    loadCollections();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(appBarTitle)),
      body: ListView(
        children: buildCollectionList(context),
      ),
    );
  }

  List<Widget> buildCollectionList(BuildContext context) {
    List<Widget> list = [];
    stories.forEach((story) {
      list.add(buildItem(story));
    });
    return list;
  }

  Widget buildItem(StoryModel story) {
    return Container(
      padding: EdgeInsets.only(left: 5.0, right: 5.0, bottom: 3.0),
      child: GestureDetector(
        onTap: () {
          openStoryDetailPage(story);
        },
        child: Card(
          child: Container(
            padding: EdgeInsets.all(10.0),
            child: Row(children: <Widget>[
              Expanded(child: Text(story.title,
                  style: TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500))),
              Container(
                width: 80.0,
                height: 80.0,
                margin: EdgeInsets.only(left: 10.0),
                child: Image.network(story.image),
              )
            ]),
          ),
        ),
      ),
    );
  }

  loadCollections() async {
    List<StoryModel> stories = await CollectionManager().getAllCollections();
    setState(() {
      this.stories = stories;
      this.appBarTitle =
      stories.length > 0 ? stories.length.toString() + '条收藏' : '收藏';
    });
  }

  openStoryDetailPage(StoryModel story) {
    Navigator.of(context).pushNamed(Pages.STORY_DETAIL + '?story=' + Uri.encodeComponent(json.encode(story)));
  }
}