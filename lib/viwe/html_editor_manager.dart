import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:html_editor_enhanced/html_editor.dart';
import 'package:tec_blog/components/my_component.dart';

import '../controller/manage_article_controller.dart';

class HtmlEditorManager extends StatelessWidget {
  HtmlEditorManager({super.key});

  final HtmlEditorController controller = HtmlEditorController();
  var manageArticleController = Get.put(ManageArticleController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => controller.clearFocus(),
      child: Scaffold(
        appBar: myAppBar("نوشتن/ویرایش مقاله"),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              HtmlEditor(
                controller: controller,
                htmlEditorOptions: HtmlEditorOptions(
                  hint: "میتونی مقالتو اینجا بنویسی",
                  shouldEnsureVisible: true,
                  initialText:
                      manageArticleController.articleSingleModle.value.content!,
                ),
                callbacks: Callbacks(
                  onChangeContent: (p0) {
                    manageArticleController.articleSingleModle.value.content =
                        p0;
                    log(manageArticleController.articleSingleModle.value.content
                        .toString());
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
