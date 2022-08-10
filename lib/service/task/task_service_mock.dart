import 'dart:math';

import 'package:web_app/common/utils/uuid.dart';
import 'package:web_app/models/task.dart';
import 'package:web_app/service/project/project_service_mock.dart';
import 'package:web_app/service/task/task_service.dart';

class TaskServiceMock implements TaskService {
  @override
  Future<List<Task>> list() async {
    return _list;
  }

  @override
  Future<Task?> byId(String id) async {
    try {
      return _list.firstWhere((e) => e.id == id);
    } catch (e) {
      return null;
    }
  }

  @override
  Future<Task> create(Task doc) async {
    final task = _genTask(Random().nextInt(10000));
    _list = [..._list, task];
    return task;
  }

  @override
  Future<Task> update(Task doc) async {
    _list = _list.map((e) => e.id == doc.id ? doc : e).toList();
    return doc;
  }

  @override
  Future<bool> delete(String id) async {
    _list = _list.where((e) => e.id != id).toList();
    return true;
  }

  // Mock data
  List<Task> _list =
      Iterable<int>.generate(10).map((i) => _genTask(i)).toList();

  static Task _genTask(int num) {
    return Task(
      id: mockUuid(),
      projectId: mockProjectId,
      title: 'Task $num',
      description: 'Task $num',
      status: TaskStatus.todo,
    );
  }
}
