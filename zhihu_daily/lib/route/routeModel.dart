class RouteModel {
  final String uri;
  String _path;
  Map<String, String> _params;

  String get path => _path;
  Map<String, String> get params => _params;

  RouteModel(this.uri) {
    _resolveURI(uri);
  }

  void _resolveURI(String uri) {
    List<String> resoled = uri.split('?');
    _path = resoled[0];
    if (resoled.length > 1) {
      _params = Map();
      resoled[1].split('&').forEach((paramStr) {
        List<String> item = paramStr.split('=');
        _params.putIfAbsent(
            Uri.decodeComponent(item[0]), () => Uri.decodeComponent(item[1]));
      });
    }
  }
}