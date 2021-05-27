import 'package:get/get.dart';
import 'package:wan_android_flutter/api/repository.dart';
import 'package:wan_android_flutter/models/project_tree.dart';

class ProjectState {
  late final Repository _repository;
  var projectTree = Rxn<List<ProjectTree>>();

  ProjectState() {
    _repository = Get.find();
    getTabs();
  }

  getTabs() async {
    projectTree.value = await _repository.getProjectTree();
    projectTree.refresh();
  }
}
