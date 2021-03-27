import 'package:mobx/mobx.dart';

part 'tarefa.g.dart';

class Tarefa = _Tarefa with _$Tarefa;

abstract class _Tarefa with Store {
  @observable
  List tarefas = [];

  @observable
  bool passwordVisibility = true;

  @action
  void changeVisibility() => passwordVisibility = !passwordVisibility;

  @action
  void addTask(String task) {
    tarefas.add(task);
  }
}
