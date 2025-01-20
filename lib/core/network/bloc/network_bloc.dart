// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

import '../network_info.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkInfo networkInfo;

  NetworkBloc(this.networkInfo) : super(NetworkInitial()) {
    on<NetworkObserve>(_observe);
    on<NetworkNotify>(_notifyStatus);
  }

  void _observe(event, emit) {
    networkInfo.observeNetwork(
      () => add(NetworkNotify(isConnected: true)),
      () => add(NetworkNotify()),
    );
  }

  void _notifyStatus(NetworkNotify event, emit) {
    event.isConnected
        ? emit(NetworkSuccessState())
        : emit(NetworkFailureState());
  }
}
