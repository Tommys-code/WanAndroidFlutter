import 'package:flutter/cupertino.dart';

typedef AnimateCallback = void Function(bool?);

class AnimationListItem extends StatefulWidget {
  final Widget child;

  AnimationListItem({Key? key, required this.child}):super(key: key);

  @override
  AnimationListItemState createState() => AnimationListItemState();
}

class AnimationListItemState extends State<AnimationListItem>
    with TickerProviderStateMixin {
  late AnimationController sizeController;
  late Animation<double> sizeAnimation;

  bool isChange = false;

  @override
  void initState() {
    super.initState();
    sizeController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 250));
    sizeAnimation = Tween(begin: 1.0, end: 0.0).animate(
        CurvedAnimation(parent: sizeController, curve: Curves.easeOut));
  }

  @override
  Widget build(BuildContext context) {
    return buildItemBox();
  }

  @override
  void dispose() {
    sizeController.dispose();
    super.dispose();
  }

  Widget buildItemBox() {
    return SizeTransition(
            axis: Axis.vertical,
            sizeFactor: sizeAnimation,
            child: widget.child,
          );
  }

  removeItem(AnimateCallback callback) async {
    sizeController.forward().then((value) => callback(true));
  }
}
