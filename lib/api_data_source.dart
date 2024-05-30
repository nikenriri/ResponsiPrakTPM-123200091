import 'base_network.dart';

class ApiDataSource {
  static ApiDataSource instance = ApiDataSource();

  Future<Map<String, dynamic>> loadAgents() {
    return BaseNetwork.get("agents");
  }

  Future<Map<String, dynamic>> loadAgentsDetail(String agentsId) {
    return BaseNetwork.get("agents/$agentsId");
  }

  Future<Map<String, dynamic>> loadMaps() {
    return BaseNetwork.get("maps");
  }

  Future<Map<String, dynamic>> loadMapsDetail(String mapsId) {
    return BaseNetwork.get("maps/$mapsId");
  }

}