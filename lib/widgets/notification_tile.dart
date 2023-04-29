import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({
    Key? key,
    required this.h, required this.text, required this.products, required this.price, required this.phoneNumber,
  }) : super(key: key);

  final double h;
  final text;
  final products;
  final price;
  final phoneNumber;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              ListTile(
                leading: Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Icon(Icons.notification_important_outlined),
                ),
                title: Text("$text  $phoneNumber "),
                subtitle: Text(products.toString()),
                trailing: Text("GHC $price"),
              ),
              const Divider(thickness: 1,)
            ],
          ),
        )
      ],
    );
  }
}