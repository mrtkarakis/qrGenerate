import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:qr_generate/service/image_services.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key, this.title, this.backButton = true})
      : super(key: key);
  final Widget? title;
  final bool backButton;
  static const Key keyAppBar = Key("appBarIcon");
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: backButton
          ? IconButton(
              onPressed: () => context.router.pop(),
              splashRadius: 28,
              icon: Image.asset(
                key: keyAppBar,
                AssetsIcons.leftArrow.fullPath,
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
