import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qr_generate/services/image_services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title, this.backButton = true})
      : super(key: key);
  final Widget? title;
  final bool backButton;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? IconButton(
              onPressed: () => Navigator.pop(context),
              splashRadius: 28,
              icon: Image.asset(
                key: Key("appBarIcon"),
                AssetsIcons.leftArrow.fullPath(),
                scale: .1,
              ),
            )
          : const SizedBox(),
      title: title,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
