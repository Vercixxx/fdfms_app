import 'package:flutter/material.dart';
import 'package:slide_to_act/slide_to_act.dart';

class DeliveryDetailsPage extends StatefulWidget {
  final Map<String, dynamic> delivery;

  DeliveryDetailsPage({required this.delivery});

  @override
  _DeliveryDetailsPageState createState() => _DeliveryDetailsPageState();
}

class _DeliveryDetailsPageState extends State<DeliveryDetailsPage> {
  String? _paymentMethod;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Delivery Details ${widget.delivery['id']}'),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Order details',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                Text('ID: ${widget.delivery['id']}'),
                Text('Name: ${widget.delivery['name']}'),
                Text('Price: ${widget.delivery['price']}'),
                Text('Country: ${widget.delivery['country']}'),
                Text('Address: ${widget.delivery['address']}'),
                Text('Phone: ${widget.delivery['phone']}'),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Text('Payment method',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                  RadioListTile<String>(
                    title: const Text('Cash'),
                    value: 'cash',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Card'),
                    value: 'card',
                    groupValue: _paymentMethod,
                    onChanged: (String? value) {
                      setState(() {
                        _paymentMethod = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SlideAction(
              onSubmit: _paymentMethod != null
                  ? () async {
                      _onDismissed(context);
                    }
                  : null,
              text: 'Deliver order',
              textStyle: const TextStyle(
                color: Colors.black,
                fontSize: 22,
                fontWeight: FontWeight.bold,
                shadows: [
                  Shadow(
                    blurRadius: 10.0,
                    color: Colors.black,
                    offset: Offset(1.0, 1.0),
                  ),
                ],
              ),
              innerColor: Colors.grey.shade200,
              outerColor: _paymentMethod != null ? Colors.green : Colors.grey,
              sliderButtonIcon: const Icon(
                Icons.delivery_dining,
                color: Colors.black,
              ),
              sliderRotate: false,
            ),
          )
        ],
      ),
    );
  }
}

void _onDismissed(BuildContext context) {
  Navigator.pop(context);
}
