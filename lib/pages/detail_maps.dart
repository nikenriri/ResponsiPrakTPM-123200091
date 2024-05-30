import 'package:flutter/material.dart';
import 'package:responsi/model/model_data_map.dart';

class DetailMapScreen extends StatelessWidget {
  final Data mapData;

  const DetailMapScreen({Key? key, required this.mapData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mapData.displayName ?? 'Map Detail'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(mapData.displayIcon ?? ''),
            ),
          ],
        ),
      ),
    );
  }
}
