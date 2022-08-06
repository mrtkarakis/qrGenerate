import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_generate/global.dart';

class QrDesignSwitch extends StatefulWidget {
  const QrDesignSwitch({Key? key, required this.qrDesignType})
      : super(key: key);
  final QrDesignType qrDesignType;

  @override
  State<QrDesignSwitch> createState() => _QrDesignSwitchState();
}

class _QrDesignSwitchState extends State<QrDesignSwitch> {
  void setFunction() {
    if (widget.qrDesignType == QrDesignType.dots) {
      qrStore.setDataModuleStyle(
          qrDataModuleShape: alignmetLeft
              ? QrDataModuleShape.square
              : QrDataModuleShape.circle);
    }
    if (widget.qrDesignType == QrDesignType.eye) {
      qrStore.setEyeStyle(
          eyeShape: alignmetLeft ? QrEyeShape.square : QrEyeShape.circle);
    }
  }

  bool alignmetLeft = true;
  static const double switchButtonWidth = 126;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: switchButtonWidth,
          height: 78,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(widget.qrDesignType.title),
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
                      primary: Colors.transparent,
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
        ),
        const SizedBox(width: 20),
        Column(
          children: [
            const SizedBox(height: 18),
            Container(
              padding: EdgeInsets.all(8),
              width: deviceStore.size.width - switchButtonWidth - 60,
              height: widget.qrDesignType == QrDesignType.dots ? 61 : 61,
              decoration: BoxDecoration(
                color: Colors.blueGrey.shade300,
                borderRadius: BorderRadius.circular(6),
              ),
              child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 3,
                      mainAxisSpacing: 13,
                      childAspectRatio: 1.3),
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      decoration: BoxDecoration(
                          color: Colors.red, shape: BoxShape.circle),
                    );
                  }),
            ),
          ],
        ),
      ],
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
            Color color = (index != 1 && index != 8 && index != 7 && index != 3)
                ? qrStore.dataModuleStyle.color!.withOpacity(opacity)
                : Colors.transparent;
            return Container(
              decoration: BoxDecoration(color: color, shape: shape),
            );
          }),
    );
  }
}

enum QrDesignType {
  dots("dots"),
  eye("eyes");

  final String title;
  const QrDesignType(this.title);
}
