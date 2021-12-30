import 'package:coffee_shop/widgets/drawer.dart';
import 'package:flutter/material.dart';

class DemoBottomAppBar extends StatefulWidget {
  const DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
      <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.centerDocked,
    FloatingActionButtonLocation.centerFloat,
  ];

  @override
  _DemoBottomAppBarState createState() => _DemoBottomAppBarState();
}

class _DemoBottomAppBarState extends State<DemoBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: widget.shape,
      color: Colors.teal,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            IconButton(
              tooltip: 'Open navigation menu',
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            IconButton(
              tooltip: 'cart',
              icon: const Icon(Icons.shopping_bag),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
