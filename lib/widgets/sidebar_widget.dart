import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Container(
        color: Colors.grey.shade800,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ListTile(
              title: Text('Orders'),
              onTap: () => QR.to('/dashboard/orders'),
            ),
            ListTile(
              title: Text('Users'),
              onTap: () => QR.to('/dashboard/users'),
            ),
            ListTile(
              title: Text('Stores'),
              onTap: () => QR.to('/dashboard/stores'),
            )
          ],
        ),
      );
}
