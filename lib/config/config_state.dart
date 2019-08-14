import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]) : super(props);

  ConfigState getStateCopy();
}

//Un Initialize Config State
class UnConfigState extends ConfigState {
  @override
  String toString() => 'UnConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return null;
  }
}

//Initialize Config State
class InConfigState extends ConfigState {
  @override
  String toString() => 'InConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return null;
  }
}

//Error Config State
class ErrorConfigState extends ConfigState {
  final String errorMessage;

  ErrorConfigState(this.errorMessage);

  @override
  String toString() => 'ErrorConfigState';
  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return ErrorConfigState(errorMessage);
  }
}