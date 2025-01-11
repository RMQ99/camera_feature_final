import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final Widget header;
  final List<Widget> items;
  final Widget footer;
  const CustomDrawer(
      {required this.header,
      required this.footer,
      required this.items,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15),
        child: Column(
          children: [
            header,
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: items,
                ),
              ),
            ),
            // const Expanded(child: SizedBox()),
            footer,
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
