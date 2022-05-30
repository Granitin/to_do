import 'package:flutter/material.dart';
import 'package:to_do/ui/widgets/group_form/group_form_widget.dart';
import 'package:to_do/ui/widgets/groups/groups_widget.dart';
import 'package:to_do/ui/widgets/tasks/tasks_widget.dart';
import 'package:to_do/ui/widgets/tasks_form/task_form_widget.dart';

abstract class MainNavigationRoutesNames {
  static const groups = 'groups';
  static const groupsForm = 'groups/form';
  static const tasks = 'groups/tasks';
  static const taskForm = 'groups/tasks/form';
}

class MainNavigation {
  final initialRoute = MainNavigationRoutesNames.groups;
  final routes = <String, Widget Function(BuildContext)>{
    MainNavigationRoutesNames.groups: (context) => const GroupsWidget(),
    MainNavigationRoutesNames.groupsForm: (context) => const GroupFormWidget(),
  };

  Route<Object> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case MainNavigationRoutesNames.tasks:
        final configuration = settings.arguments as TasksWidgetConfiguration;
        return MaterialPageRoute(
          builder: (context) => TasksWidget(
            configuration: configuration,
          ),
        );

      case MainNavigationRoutesNames.taskForm:
        final groupKey = settings.arguments as int;
        return MaterialPageRoute(
          builder: (context) => TaskFormWidget(groupKey: groupKey),
        );
      default:
        const widget = Text('Navigation Error!!!');
        return MaterialPageRoute(
          builder: (context) => widget,
        );
    }
  }
}
