// import 'package:bloc_demo/presentation/screens/drawer.dart';
// import 'package:flutter/material.dart';

// import '../../logic/blocs/bloc_exports.dart';
// import '../widgets/tasks_list.dart';

// class RecycleBin extends StatelessWidget {
//   const RecycleBin({super.key});
//   static const id = "recycle_bin";
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<TasksBloc, TasksState>(
//       builder: (context, state) {
//         return Scaffold(
//           appBar: AppBar(
//             title: const Text("Recycle Bin"),
//             actions: [
//               IconButton(onPressed: () {}, icon: const Icon(Icons.add))
//             ],
//           ),
//           drawer: const CustomDrawer(),
//           body: Column(
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: [
//               Center(
//                 child: Chip(
//                   label: Text("Tasks: ${state.removedTasks.length}"),
//                 ),
//               ),
//               TasksList(tasksList: state.removedTasks)
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
