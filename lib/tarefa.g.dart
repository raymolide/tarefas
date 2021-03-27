// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tarefa.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$Tarefa on _Tarefa, Store {
  final _$tarefasAtom = Atom(name: '_Tarefa.tarefas');

  @override
  List<dynamic> get tarefas {
    _$tarefasAtom.reportRead();
    return super.tarefas;
  }

  @override
  set tarefas(List<dynamic> value) {
    _$tarefasAtom.reportWrite(value, super.tarefas, () {
      super.tarefas = value;
    });
  }

  final _$_TarefaActionController = ActionController(name: '_Tarefa');

  @override
  void addTask(String task) {
    final _$actionInfo =
        _$_TarefaActionController.startAction(name: '_Tarefa.addTask');
    try {
      return super.addTask(task);
    } finally {
      _$_TarefaActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
tarefas: ${tarefas}
    ''';
  }
}
