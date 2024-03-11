class SocketResponse {
  final bool isStart;
  final Map<String, dynamic>? data;
  final int? timestamp;

  SocketResponse({this.isStart = false, this.data, this.timestamp});
}