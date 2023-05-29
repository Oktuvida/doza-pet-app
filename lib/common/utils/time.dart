int timeToMinutes(String time) {
  final splittedTime = time.split(":");

  final hours = int.parse(splittedTime[0]);
  final minutes = int.parse(splittedTime[1]);

  return hours * 60 + minutes;
}

String minutesToTime(int minutes) {
  final hours = (minutes / 60).floor().toString().padLeft(2, "0");
  final newMinutes =
      (minutes - int.parse(hours) * 60).toString().padLeft(2, "0");

  return "$hours:$newMinutes";
}
