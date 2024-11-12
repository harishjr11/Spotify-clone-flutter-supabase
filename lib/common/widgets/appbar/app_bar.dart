import 'package:flutter/material.dart';
import 'package:demo/common/helpers/is_dark_mode.dart';

class BasicAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? title;
  final bool hideBack;
  const BasicAppBar({
    super.key, 
    this.title,
    this.hideBack = false,
    });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: hideBack ? null : IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.03), shape: BoxShape.circle),
          child: Icon(Icons.arrow_back_ios_new,
          size: 15,
          color: context.isDarkMode ? Colors.white : Colors.black,),
        ),
      ),
      centerTitle: true,
      title: title ?? const Text(''),
      actions: const [],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
