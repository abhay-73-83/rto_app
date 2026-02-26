import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool centerTitle;
  final List<Widget>? action;


  CustomAppbar({
    required this.title,
    required this.centerTitle,
    this.action,
    super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: centerTitle,
      title: Text(title),
      actions: action,
    );
  }
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

