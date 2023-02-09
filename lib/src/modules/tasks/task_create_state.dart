abstract class TaskCreateState {}

class TaskCreateInitialState extends TaskCreateState {}

class TaskCreateLoadingState extends TaskCreateState {}

class TaskCreateSuccessState extends TaskCreateState {}

class TaskCreateErrorState extends TaskCreateState {
  final String message;
  TaskCreateErrorState(this.message);
}