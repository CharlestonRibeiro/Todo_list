import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_list/src/modules/tasks/task_create_state.dart';

class TaskCreateController extends Cubit<TaskCreateState> {
  
  TaskCreateController(): super(TaskCreateInitialState());

}
