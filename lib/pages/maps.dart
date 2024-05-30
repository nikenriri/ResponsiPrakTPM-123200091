import 'package:flutter/material.dart';
import 'package:responsi/api_data_source.dart';
import 'package:responsi/model/model_data_map.dart';
import 'package:responsi/pages/detail_maps.dart';

class ListMapScreen extends StatefulWidget {
  const ListMapScreen({super.key});

  @override
  State<ListMapScreen> createState() => _ListMapScreenState();
}

class _ListMapScreenState extends State<ListMapScreen> {
  late Future<MapData> _futureMap;
  @override
  void initState() {
    super.initState();
    _futureMap = ApiDataSource.instance.loadMaps().then((data) => MapData.fromJson(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: const Text("Maps"),
      ),
      body: _buildListMapBody(),
    );
  }

  Widget _buildListMapBody() {
    return FutureBuilder<MapData>(
      future: _futureMap,
      builder: (BuildContext context, AsyncSnapshot<MapData> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return _buildLoadingSection();
        } else if (snapshot.hasError) {
          return _buildErrorSection();
        } else if (snapshot.hasData) {
          return _buildSuccessSection(snapshot.data!.data!);
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

  Widget _buildSuccessSection(List<Data> data) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10.0,
        mainAxisSpacing: 10.0,
        childAspectRatio: 0.6,
      ),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final map = data[index];
        return _buildListItem(map);
      },
    );
  }

  Widget _buildListItem(Data data) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailMapScreen(mapData: data),
          ),
        );
      },
      child: Card(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Image.network(data.listViewIcon ?? ''),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Center(
                child: Text(
                  data.coordinates ?? '',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
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
