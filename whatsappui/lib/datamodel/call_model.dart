class CallModel {
  final String name;
  String? avatar;
  final String time;
  final String date;
  bool? audiocall;

  CallModel(this.name, this.avatar, this.time, this.date, this.audiocall);
}

List<CallModel> callData = [
  CallModel("muskan", "assets/images/muskan.jpg", "5:10", "Today", true),
  CallModel("Muskan2", "assets/images/muskan2.jpg", "12:24", "Yesterday", false)
];
