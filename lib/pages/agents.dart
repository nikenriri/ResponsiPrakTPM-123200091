import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/model_data_agent.dart';
import 'package:responsi/pages/detail_agents.dart';

class ListAgentsScreen extends StatefulWidget {
  const ListAgentsScreen({Key? key}) : super(key: key);

  @override
  State<ListAgentsScreen> createState() => _ListAgentsScreenState();
}

class _ListAgentsScreenState extends State<ListAgentsScreen> {
  late Future<List<Data>> _futureAgents;

  @override
  void initState() {
    super.initState();
    _futureAgents = _loadAgents();
  }

  Future<List<Data>> _loadAgents() async {
    try {
      final response = await ApiDataSource.instance.loadAgents();
      final agent = Agent.fromJson(response);
      return agent.data ?? [];
    } catch (e) {
      print("Error loading agents: $e");
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Agents"),
      ),
      body: _buildListAgentBody(),
    );
  }

  Widget _buildListAgentBody() {
    return FutureBuilder<List<Data>>(
      future: _futureAgents,
      builder: (BuildContext context, AsyncSnapshot<List<Data>> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingSection();
        } else if (snapshot.hasError) {
          return _buildErrorSection();
        } else if (snapshot.hasData) {
          return _buildSuccessSection(snapshot.data!);
        }
        return _buildErrorSection();
      },
    );
  }

  Widget _buildErrorSection() {
    return Center(
      child: Text(
        "Error occurred while loading data.",
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildLoadingSection() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildSuccessSection(List<Data> agents) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
      ),
      itemCount: agents.length,
      itemBuilder: (context, index) {
        final data = agents[index];
        return _buildListItem(data);
      },
    );
  }

  Widget _buildListItem(Data data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailAgentScreen(data: data),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(data.displayIconSmall ?? ''),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                child: Text(
                  data.displayName ?? '',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
