import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/core/extension/string_extension.dart';
import 'package:qr_generate/core/router/app_router.dart';
import 'package:qr_generate/global.dart';
import 'package:qr_generate/page/qrEdit/qr_edit_view.dart';
import 'package:qr_generate/service/image/image_service.dart';
import 'package:qr_generate/core/theme/color_palatte.dart';

class QrDesign extends StatefulWidget {
  const QrDesign({Key? key, required this.qrDesignType}) : super(key: key);

  final QrDesignType qrDesignType;
  @override
  State<QrDesign> createState() => _QrDesignState();
}

class _QrDesignState extends State<QrDesign> {
  static const double switchButtonWidth = 126;
  @override
  Widget build(BuildContext context) {
    if (widget.qrDesignType == QrDesignType.eye ||
        widget.qrDesignType == QrDesignType.dots) {
      return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
              width: switchButtonWidth,
              child: QrDesignSwitch(qrDesignType: widget.qrDesignType)),
          const SizedBox(width: 20),
          setColor(),
        ],
      );
    } else {
      return SizedBox(
        height: 96,
        width: deviceStore.size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title(widget.qrDesignType),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(8),
              height: 61,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: deviceStore.size.width - 120,
                    child: ListView.builder(
                      itemCount: ColorPalatte.values.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            changeColorBox(
                                qrDesignType: widget.qrDesignType,
                                index: index),
                          ],
                        );
                      },
                    ),
                  ),
                  changeColorPageButton(context)
                ],
              ),
            ),
          ],
        ),
      );
    }
  }

  ElevatedButton changeColorPageButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        context.router.push(
          ChangeColorRoute(qrDesignType: widget.qrDesignType),
        );
      },
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: const CircleBorder(),
          fixedSize: (const Size(54.5, 54.5))),
      child: Image.asset(
        AssetsIcons.rightArrow.fullPath,
      ),
    );
  }

  Column setColor() {
    return Column(
      children: [
        const SizedBox(height: 18),
        Container(
          alignment: Alignment.bottomCenter,
          padding: const EdgeInsets.all(8),
          width: deviceStore.size.width - switchButtonWidth - 60,
          height: 61,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade300,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Row(
            children: [
              Expanded(
                child: PageView.builder(
                  itemCount: ColorPalatte.values.length ~/ 2,
                  controller: PageController(viewportFraction: 1),
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        changeColorBox(
                            qrDesignType: widget.qrDesignType,
                            index: index,
                            serie: 0),
                        changeColorBox(
                            qrDesignType: widget.qrDesignType,
                            index: index,
                            serie: 1),
                      ],
                    );
                  },
                ),
              ),
              changeColorPageButton(context)
            ],
          ),
        ),
      ],
    );
  }

  InkWell changeColorBox(
      {required QrDesignType qrDesignType, required int index, int serie = 0}) {
    final int colorIndex =
        qrDesignType == QrDesignType.background ? index : index * 2 + serie;
    final Color color = ColorPalatte.values[colorIndex].color;
    return InkWell(
      onTap: () {
        qrDesignService.changeColor(qrDesignType, color);
      },
      child: Container(
        width: 54.5,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class QrDesignSwitch extends StatefulWidget {
  const QrDesignSwitch({Key? key, required this.qrDesignType})
      : super(key: key);

  final QrDesignType qrDesignType;

  @override
  State<QrDesignSwitch> createState() => _QrDesignSwitchState();
}

class _QrDesignSwitchState extends State<QrDesignSwitch> {
  bool alignmetLeft = true;

  void setFunction() {
    if (widget.qrDesignType == QrDesignType.dots) {
      qrStore.setDataModuleStyle(
        qrDataModuleShape:
            alignmetLeft ? QrDataModuleShape.square : QrDataModuleShape.circle,
      );
    }
    if (widget.qrDesignType == QrDesignType.eye) {
      qrStore.setEyeStyle(
        eyeShape: alignmetLeft ? QrEyeShape.square : QrEyeShape.circle,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 78,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          _title(widget.qrDesignType),
          const SizedBox(height: 8),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(99),
              color: Colors.grey.shade300,
            ),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(99)),
                  padding: EdgeInsets.zero,
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent),
              onPressed: () {
                setState(() => alignmetLeft = !alignmetLeft);
                setFunction();
              },
              child: Stack(
                children: [
                  AnimatedAlign(
                    duration: const Duration(milliseconds: 333),
                    alignment: alignmetLeft
                        ? Alignment.centerLeft
                        : Alignment.centerRight,
                    child: Container(
                      height: 53,
                      width: 66,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(99)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 18,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        selectType(index: 0),
                        const SizedBox(width: 30),
                        selectType(index: 1),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox selectType({required int index}) {
    late BoxShape shape;
    if (widget.qrDesignType == QrDesignType.dots) {
      shape = index == 0 ? BoxShape.rectangle : BoxShape.circle;
    }
    if (widget.qrDesignType == QrDesignType.eye) {
      shape = index == 0 ? BoxShape.rectangle : BoxShape.circle;
    }

    final double opacity =
        (alignmetLeft && index == 0) || (!alignmetLeft && index == 1) ? 1 : .6;
    const double size = 30;
    final double elementPadding = qrStore.gapless ? 0 : 1;

    return SizedBox(
      height: size,
      width: size,
      child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: elementPadding,
            crossAxisSpacing: elementPadding,
            crossAxisCount: 3,
          ),
          itemCount: 9,
          itemBuilder: (BuildContext context, int index) {
            return Observer(builder: (_) {
              Color color = widget.qrDesignType == QrDesignType.dots
                  ? qrStore.dataModuleStyle.color!.withOpacity(opacity)
                  : qrStore.eyeStyle.color!.withOpacity(opacity);

              return Container(
                decoration: BoxDecoration(
                  color: (index == 1 || index == 8 || index == 7 || index == 3)
                      ? Colors.transparent
                      : color,
                  shape: shape,
                ),
              );
            });
          }),
    );
  }
}

Text _title(QrDesignType qrDesignType) => Text(qrDesignType.title.capitalize);
