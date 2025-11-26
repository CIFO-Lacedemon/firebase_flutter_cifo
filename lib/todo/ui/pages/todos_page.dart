import 'package:firebase_flutter_cifo/core/locator/locator.dart';
import 'package:firebase_flutter_cifo/start/cubits/start_app/start_app_cubit.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_cubit.dart';
import 'package:firebase_flutter_cifo/todo/cubits/todo_list/todo_list_state.dart';
import 'package:firebase_flutter_cifo/todo/data/models/todo_dto.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/create_todo_widget.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/list_todos_widget.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/search_filter_todo_widget.dart';
import 'package:firebase_flutter_cifo/todo/ui/widgets/todo_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class TodosPage extends StatelessWidget {
  const TodosPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            context.pop();
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text("App de TODOS"),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          locator<StartAppCubit>().logOutSesion();
        },
      ),
      body: BlocBuilder<TodoListCubit, TodoListState>(
        bloc: locator<TodoListCubit>()..getTodos(),
        builder: (context, state) {
          return Column(
            children: [
              TodoHeaderWidget(count: state.activeTodoCount),
              SizedBox(height: 20),
              SearchFilterTodoWidget(),
              Expanded(
                child: ListView(
                  shrinkWrap: true,
                  children: [
                    BlocBuilder<TodoListCubit, TodoListState>(
                      bloc: locator<TodoListCubit>(),
                      builder: (context, state) {
                        if (state.todosFiltered.isEmpty &&
                            state.selectedFilter == Filter.active) {
                          return ListTodosWidget(todos: []);
                        }
                        if (state.todosFiltered.isEmpty &&
                            state.selectedFilter != Filter.completed) {
                          return ListTodosWidget(todos: state.todos);
                        } else {
                          return ListTodosWidget(todos: state.todosFiltered);
                        }
                      },
                    ),
                  ],
                ),
              ),
              CreateTodoWidget(),
            ],
          );
        },
      ),
    );
  }
}
