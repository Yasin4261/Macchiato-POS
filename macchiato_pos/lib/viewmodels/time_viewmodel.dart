import 'dart:async';
import 'package:macchiato_pos/models/time_model.dart';

class TimeViewModel {
  final StreamController<TimeModel> _timeController = StreamController<TimeModel>();
  Timer? _timer;

  TimeViewModel() {
    _startTimer();
  }

  Stream<TimeModel> get timeStream => _timeController.stream;

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (!_timeController.isClosed) {
        _timeController.sink.add(TimeModel(currentTime: _getCurrentTime()));
      }
    });
  }

  String _getCurrentTime() {
    return DateTime.now().toLocal().toString().split(' ')[1].split('.')[0];
  }

  void dispose() {
    _timer?.cancel();
    _timeController.close();
  }
}
