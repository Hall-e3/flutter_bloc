import 'package:flutter/material.dart';

import '../../data/models/task.dart';

class PopUpMenu extends StatelessWidget {
  final Task task;
  final VoidCallback cancelOrDeleteCallback;
  final VoidCallback restore;
  const PopUpMenu({
    super.key,
    required this.cancelOrDeleteCallback,
    required this.restore,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        itemBuilder: task.isDeleted == false
            ? (context) => [
                  PopupMenuItem(
                      onTap: () {},
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.bookmark),
                          label: const Text('Add to Bookmarks'))),
                  PopupMenuItem(
                      onTap: () {},
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.edit),
                          label: const Text('Edit'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete),
                          label: const Text('Delete')))
                ]
            : (context) => [
                  PopupMenuItem(
                      onTap: restore,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.restore_from_trash),
                          label: const Text('Restore'))),
                  PopupMenuItem(
                      onTap: cancelOrDeleteCallback,
                      child: TextButton.icon(
                          onPressed: null,
                          icon: const Icon(Icons.delete_forever),
                          label: const Text('Delete Permanently')))
                ]);
  }
}
