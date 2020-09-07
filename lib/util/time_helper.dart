class TimeHelper {
  static String getTimeOfTheDay(DateTime time) {
    if (time.hour >= 0 && time.hour < 6) return "Night";
    if (time.hour >= 6 && time.hour < 12) return "Morning";
    if (time.hour >= 12 && time.hour < 18) return "Afternoon";
    return "Evening";
  }
}
