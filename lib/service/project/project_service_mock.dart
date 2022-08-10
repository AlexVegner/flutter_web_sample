import 'dart:math';

import 'package:web_app/common/utils/uuid.dart';
import 'package:web_app/models/project.dart';
import 'package:web_app/service/project/project_service.dart';

class ProjectServiceMock implements ProjectService {
  @override
  Future<List<Project>> list() async {
    return _list;
  }

  @override
  Future<Project?> byId(String id) async {
    try {
      return _list.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Project> create(Project doc) async {
    final project = _genProject(Random().nextInt(10000));
    _list = [..._list, project];
    return project;
  }

  @override
  Future<Project> update(Project doc) async {
    _list = _list.map((e) => e.id == doc.id ? doc : e).toList();
    return doc;
  }

  @override
  Future<bool> delete(String id) async {
    _list = _list.where((e) => e.id != id).toList();
    return true;
  }

  // Mock data
  List<Project> _list =
      Iterable<int>.generate(20).map((i) => _genProject(i)).toList();

  static Project _genProject(int num, {String? id}) {
    return Project(
      id: id ?? mockUuid(),
      title: 'Project $num',
      description: 'Project $num',
    );
  }
}

const String mockProjectId = 'a473ff7b-b3cd-4899-a04d-ea0fbd30a72e';
