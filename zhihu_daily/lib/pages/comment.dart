import 'package:flutter/material.dart';

class PageStoryComment extends StatefulWidget {
  final int storyID;
  final int longComments;
  final int shortComments;

  PageStoryComment(this.storyID, this.longComments, this.shortComments);

  PageStoryComment.fromParams(Map<String, String> params)
      : storyID = int.parse(params['storyID']),
        longComments = int.parse(params['longComments']),
        shortComments = int.parse(params['shortComments']);

  @override
  State<StatefulWidget> createState() {
    return _PageState();
  }
}

class _PageState extends State<PageStoryComment> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Text('该页面被 WebView 遮挡，无法正常展示',
          style: TextStyle(fontSize: 24.0),)
    );
  }
}