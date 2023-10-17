import 'dart:async';

class RefreshBloc {
  final refreshController = StreamController<List<bool>>.broadcast();

  Stream<List<bool>> get refreshStream => refreshController.stream;

  refreshData() {
    refreshController.sink.add([true]);
  }

  dispose() {
    refreshController.close();
  }
}

RefreshBloc refreshBloc = RefreshBloc();
