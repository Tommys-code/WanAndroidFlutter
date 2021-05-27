import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wan_android_flutter/models/wx_chapter.dart';

class PublicChapterSheet extends StatelessWidget {
  final List<WxChapter> chapters;
  final int? checkId;

  const PublicChapterSheet({
    Key? key,
    required this.chapters,
    this.checkId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10,
      children: _buildWidgets(),
    ).paddingAll(10);
  }

  List<Widget> _buildWidgets() {
    return chapters
        .map((e) => ActionChip(
              label: Text(
                e.name,
                style: TextStyle(
                  fontSize: 14,
                  color: e.id == checkId ? Colors.white : Color(0xff666666),
                ),
              ),
              backgroundColor: e.id == checkId ? Colors.blue : Colors.grey[200],
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              onPressed: () => Get.back(result: e),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(50),
              ),
            ))
        .toList();
  }
}
