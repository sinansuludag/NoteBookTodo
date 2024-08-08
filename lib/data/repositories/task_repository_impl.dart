import 'package:notbook_todo/data/data.dart';

class TaskRepositoryImpl implements TaskRepository {
  final TaskDataSource _dataSource;

  TaskRepositoryImpl(this._dataSource);

  @override
  Future<void> createTask(Task task) async {
    try {
      await _dataSource.createTask(task);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> deleteTask(Task task) async {
    try {
      await _dataSource.deleteTask(task);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      return _dataSource.getAllTask();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<void> updateTask(Task task) async {
    try {
      await _dataSource.updateTask(task);
    } catch (e) {
      throw e.toString();
    }
  }
}
