part of 'network_bloc.dart';

abstract class NetworkState {}

class NetworkInitial extends NetworkState {}

class NetworkSuccessState extends NetworkState {}

class NetworkFailureState extends NetworkState {}
