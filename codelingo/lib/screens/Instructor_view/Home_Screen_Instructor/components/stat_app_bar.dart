import 'package:flutter/material.dart';

class NotificationMenu extends StatelessWidget {
  const NotificationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(15.0),
      height: 300, // Adjust height as needed
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Notifications',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView(
              children: const [
                ListTile(
                  leading: Icon(Icons.notification_important),
                  title: Text('Notification 1'),
                  subtitle: Text('This is the detail of notification 1.'),
                ),
                ListTile(
                  leading: Icon(Icons.notification_important),
                  title: Text('Notification 2'),
                  subtitle: Text('This is the detail of notification 2.'),
                ),
                ListTile(
                  leading: Icon(Icons.notification_important),
                  title: Text('Notification 3'),
                  subtitle: Text('This is the detail of notification 3.'),
                ),
                ListTile(
                  leading: Icon(Icons.notification_important),
                  title: Text('Notification 4'),
                  subtitle: Text('This is the detail of notification 4.'),
                ),
                ListTile(
                  leading: Icon(Icons.notification_important),
                  title: Text('Notification 5'),
                  subtitle: Text('This is the detail of notification 5.'),
                ),
                // Add more ListTiles as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StatAppBar extends StatelessWidget implements PreferredSizeWidget {
  const StatAppBar({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(65);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      toolbarHeight: 120,
      backgroundColor: Colors.white,
      elevation: 1.5,
      leading: flag(),
      title: Row(
        children: [
          const Padding(padding: EdgeInsets.all(16)),
          const Padding(padding: EdgeInsets.all(13)),
        ],
      ),
      actions: [
        notification(context),
        const Padding(
          padding: EdgeInsets.all(3),
        ),
      ],
    );
  }

  Widget notification(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () => {
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(16.0)),
                    ),
                    builder: (context) => const NotificationMenu(),
                  )
                },
            icon: Badge(
              isLabelVisible: true,
              label: const Text("2"),
              offset: const Offset(8, 8),
              backgroundColor: Colors.red,
              child: Image.asset(
                'assets/icons/notifybell.png',
                width: 36,
                height: 36,
              ),
            ))
      ],
    );
  }

  Widget flag() {
    return Container(
      margin: const EdgeInsets.only(left: 15, top: 18, bottom: 18),
      decoration: BoxDecoration(
        image: const DecorationImage(
          fit: BoxFit.scaleDown,
          image: AssetImage('assets/images/cplus.png'),
          // fit: BoxFit.cover,
        ),
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          width: 2.5,
          color: const Color(0xFFE5E5E5),
        ),
        color: Colors.grey.shade100,
      ),
      child: null /* add child content here */,
    );
  }
}
