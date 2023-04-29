import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pharmacy_end/widgets/notification_tile.dart';
import 'package:web_socket_channel/io.dart';

class FruitPage extends StatefulWidget {
  @override
  _FruitPageState createState() => _FruitPageState();
}

class _FruitPageState extends State<FruitPage> {
  List<String> _fruitNames = [];

  @override
  void initState() {
    super.initState();
  }

String name = '';
String phoneNumber = '';
List<String> items = [];
String totalPrice = '';


  getorder() async{
  String auth = "chatappauthkey231r4";
   IOWebSocketChannel channel;
    try {
      // Create connection.
      channel = IOWebSocketChannel.connect('ws://localhost:3000/getorder');
    } catch (e) {
      print("Error on connecting to websocket: $e"
      );
      return;
    }
    // Data that will be sent to Node.js
String cmd = "getorder";
String healthData = '{"auth":"$auth", "cmd":"$cmd"}';

    // Send data to Node.js
    channel.sink.add(healthData);
  channel.stream.listen(
    cancelOnError: true,
    (event) async {
      event = event.replaceAll(RegExp("'"), '"');
      var healthTipData = json.decode(event);
      print(healthTipData);
      setState(() {
        name = healthTipData['body']['name'];
        phoneNumber = healthTipData['body']['phoneNumber'];
        items = List<String>.from(healthTipData['body']['items']);
        totalPrice = healthTipData['body']['totalPrice'].toString();

      });
    });
             }

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: getorder, 
          icon: Icon(Icons.replay_outlined))
        ],
        title: const Text('Fruit List'),
      ),
     body:  Scaffold(
        backgroundColor: Colors.lightBlue.shade50,
        body: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  NotificationTile(h: h, text: name, products: items, price: totalPrice, phoneNumber: phoneNumber,),
                ],
              ),
            )
          ],
        ),
      )
    );
  }
}


