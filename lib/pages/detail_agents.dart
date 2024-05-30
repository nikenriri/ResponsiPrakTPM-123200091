import 'package:flutter/material.dart';
import 'package:responsi/model/model_data_agent.dart';

class DetailAgentScreen extends StatelessWidget {
  final Data data;

  const DetailAgentScreen({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(data.displayName ?? 'Agent Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (data.displayIcon != null)
              Center(
                child: Image.network(data.displayIcon!),
              ),
            SizedBox(height: 16),
            Text(
              'Name: ${data.displayName}',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8),
            Text(
              'Description: ${data.description}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Role: ${data.role?.displayName}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Playable Character: ${data.isPlayableCharacter == true ? 'Yes' : 'No'}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            if (data.recruitmentData != null)
              Text(
                'Recruitment Start Date: ${data.recruitmentData!.startDate}',
                style: TextStyle(fontSize: 16),
              ),
            SizedBox(height: 8),
            if (data.abilities != null && data.abilities!.isNotEmpty)
              Text(
                'Abilities:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            if (data.abilities != null)
              ...data.abilities!.map((ability) => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Text(
                    '  - ${ability.displayName}',
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              )),
          ],
        ),
      ),
    );
  }
}
