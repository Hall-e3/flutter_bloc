// import 'package:flutter/material.dart';

// import '../../data/models/task.dart';
// import 'task_list.dart';

// class TasksList extends StatelessWidget {
//   final List<Task> tasksList;
//   const TasksList({
//     super.key,
//     required this.tasksList,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Expanded(
//       child: SingleChildScrollView(
//         child: ExpansionPanelList.radio(
//           children: tasksList
//               .map((task) => ExpansionPanelRadio(
//                   value: task.id,
//                   headerBuilder: (context, isOpen) => TaskTile(task: task),
//                   body: ListTile(
//                     title: SelectableText.rich(TextSpan(children: [
//                       const TextSpan(
//                           text: "Text:\n",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextSpan(text: task.title),
//                       const TextSpan(
//                           text: "\n\nText:\n",
//                           style: TextStyle(fontWeight: FontWeight.bold)),
//                       TextSpan(text: task.description),
//                     ])),
//                   )))
//               .toList(),
//         ),
//       ),
//     );
//   }
// }
