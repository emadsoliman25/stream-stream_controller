//block or presenter (names)
import 'dart:async';

class TickerController {
  int _ticker;

  final StreamController<int> _tickerController = StreamController<int>(); // الصنبور
  Stream<int> get tickerStream => _tickerController.stream; //take data
  StreamSink<int> get tickerSink => _tickerController.sink; // add data

  final StreamController<int> _incrementController = StreamController<int>();

  StreamSink<int> get increment => _incrementController.sink;

  final StreamController<int> _decrementController = StreamController<int>();

  StreamSink<int> get decrement => _decrementController.sink;

  TickerController() {
    _ticker = 0;
    _tickerController.add(_ticker);
    _incrementController.stream.listen(_incrementTicker);
    _decrementController.stream.listen(_decrementTicker);
  }

  void _incrementTicker(int ticker) {
    ticker++;
    tickerSink.add(ticker);
  }

  void _decrementTicker(int ticker) {
    ticker--;
    tickerSink.add(ticker);
  }

  void dispose() {
    _incrementController.close();
    _decrementController.close();
    _tickerController.close();
  }
}
