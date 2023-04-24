// function that converts int to string format mm:ss
String convertSecondsToMinutesAndSecondsString(int timeInSeconds) {
  int minutes = (timeInSeconds / 60).floor();
  int seconds = timeInSeconds % 60;
  String formattedMinutes = minutes < 10 ? "0$minutes" : "$minutes";
  String formattedSeconds = seconds < 10 ? "0$seconds" : "$seconds";
  return "$formattedMinutes:$formattedSeconds";
}
