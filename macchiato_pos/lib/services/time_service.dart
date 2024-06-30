class TimeService {
  String getCurrentTime() {
    return DateTime.now().toLocal().toString().split(' ')[1].split('.')[0];
  }
}
