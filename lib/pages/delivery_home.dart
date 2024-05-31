import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:url_launcher/url_launcher.dart';

import './deliver_order.dart';

class DeliveryHome extends StatelessWidget {
  const DeliveryHome({Key? key}) : super(key: key);

  final delivers = const [
    {
      'id': '1',
      'name': 'John Doe',
      'price': '\$100',
      'country': 'USA',
      'address': '123 Fake Street, Faketown',
      'phone': '1234567890'
    },
    {
      'id': '2',
      'name': 'Jane Smith',
      'price': '\$200',
      'country': 'Canada',
      'address': '456 Fake Avenue, Faketown',
      'phone': '1234567890'
    },
    {
      'id': '3',
      'name': 'Bob Johnson',
      'price': '\$300',
      'country': 'UK',
      'address': '789 Fake Boulevard, Faketown',
      'phone': '1234567890'
    },
    {
      'id': '4',
      'name': 'Alice Williams',
      'price': '\$400',
      'country': 'Australia',
      'address': '101 Fake Lane, Faketown',
      'phone': '1234567890'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.delivery_dining,
                          color: Colors.blue.withOpacity(0.2),
                          size: 200.0,
                        ),
                        const Text(
                          'Your orders will appear here',
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    )
                  ],
                )
              ],
            ),
          ),
          ListView.builder(
            itemCount: delivers.length,
            itemBuilder: (context, index) {
              return Container(
                margin: const EdgeInsets.only(bottom: 8.0),
                color: const Color.fromRGBO(20, 150, 20, 0.6),
                child: Slidable(
                  key: ValueKey(index),
                  startActionPane: ActionPane(
                    motion: const ScrollMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) async {
                          String? phoneNumber = delivers[index]['phone'];
                          if (phoneNumber != null) {
                            Uri url = Uri.parse('tel:$phoneNumber');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          } else {
                            print('Phone number is null');
                          }
                        },
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        icon: Icons.call,
                        label: 'Call',
                      ),
                      SlidableAction(
                        onPressed: (context) async {
                          String? address = delivers[index]['address'];
                          String? country = delivers[index]['country'];
                          if (address != null && country != null) {
                            String query =
                                Uri.encodeComponent('$address, $country');
                            Uri url = Uri.parse(
                                'https://www.google.com/maps/search/?api=1&query=$query');

                            if (await canLaunchUrl(url)) {
                              await launchUrl(url);
                            } else {
                              throw 'Could not launch $url';
                            }
                          } else {
                            print('Address or country is null');
                          }
                        },
                        backgroundColor: Colors.green,
                        foregroundColor: Colors.white,
                        icon: Icons.navigation,
                        label: 'Navigate',
                      ),
                    ],
                  ),
                  endActionPane: ActionPane(
                    motion: const DrawerMotion(),
                    children: [
                      SlidableAction(
                        onPressed: (context) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DeliveryDetailsPage(
                                  delivery: delivers[index]),
                            ),
                          );
                        },
                        backgroundColor: Colors.indigo,
                        foregroundColor: Colors.white,
                        icon: Icons.delivery_dining,
                        label: 'Deliver',
                      ),
                    ],
                  ),
                  child: Row(
                    children: [
                      const Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.call, color: Colors.blue),
                              Icon(Icons.navigation, color: Colors.green),
                            ],
                          ),
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Container(
                              alignment: Alignment.centerLeft,
                              padding: const EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(delivers[index]['name'] ?? 'No name',
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold)),
                                  Text(delivers[index]['address'] ??
                                      'No address'),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                Text(delivers[index]['price'] ?? 'No price', style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Row(
                        children: <Widget>[
                          Column(
                            children: <Widget>[
                              Icon(Icons.delivery_dining, color: Colors.indigo),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
