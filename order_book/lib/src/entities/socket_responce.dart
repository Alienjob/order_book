class SocketResponse {
  final bool isStart;
  final Map<String, dynamic>? data;
  final DateTime? time;
  final int? timestamp;

  SocketResponse({this.isStart = false, this.data, this.time, this.timestamp});
}