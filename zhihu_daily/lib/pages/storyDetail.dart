import 'dart:convert';
import 'package:http/http.dart';
import 'package:flutter/material.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:zhihu_daily/constants/urls.dart';
import 'package:zhihu_daily/constants/pages.dart';

class PageStoryDetail extends StatefulWidget {
  final int storyID;

  PageStoryDetail(this.storyID);

  PageStoryDetail.fromParams(Map<String, String> params)
      : this(int.parse(params['storyID']));

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageStoryDetail> {
  int commentCount;
  int longComments;
  int shortComments;
  int starCount;
  String storyUrl;
  int storyID;

  @override
  void initState() {
    super.initState();
    commentCount = 0;
    starCount = 0;
    storyID = widget.storyID;
    storyUrl = Urls.NEWS_DETAIL_WEB + storyID.toString();

    _loadData();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: storyUrl,
      appBar: _buildAppBar(),
      withZoom: true,
      withLocalStorage: true,
    );
  }

  Widget _buildAppBar() {
    return AppBar(
      actions: <Widget>[
        _buildActionItem(Icons.share, _onPressShare),
        _buildActionItem(
            Icons.comment, _onPressComment, text: commentCount.toString()),
        _buildActionItem(
            Icons.thumb_up, _onPressThumb, text: starCount.toString()),
      ],
    );
  }

  Widget _buildActionItem(IconData icon, VoidCallback onPressed,
      {String text}) {
    if (text == null) {
      return IconButton(icon: Icon(icon), onPressed: onPressed);
    } else {
      return GestureDetector(
        onTap: onPressed,
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Row(children: <Widget>[
            Icon(icon),
            Padding(padding: EdgeInsets.only(left: 4.0), child: Text(text))
          ]),),
      );
    }
  }

  _onPressShare() {

  }

  _onPressComment() {
    StringBuffer sb = StringBuffer(Pages.COMMENT);
    sb.write('?storyID=');
    sb.write(storyID);
    sb.write('&longComments=');
    sb.write(longComments);
    sb.write('&shortComments=');
    sb.write(shortComments);
    Navigator.of(context).pushNamed(sb.toString());
  }

  _onPressThumb() {

  }

  _loadData() async {
    String url = Urls.NEWS_EXTRA_INFO + storyID.toString();
    Response response = await get(url);
    if (response.statusCode == 200) {
      Map<String, dynamic> result = json.decode(response.body);
      setState(() {
        commentCount = result['comments'];
        longComments = result['long_comments'];
        shortComments = result['long_comments'];
        starCount = result['popularity'];
      });
    }
  }
}