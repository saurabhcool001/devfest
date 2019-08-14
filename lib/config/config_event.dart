import 'package:devfest/config/config_state.dart';
import 'package:devfest/config/index.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]) : super(props);

  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {

  final bool darkOn;

  DarkModeEvent(this.darkOn);
  
  @override
  String toString() => 'DarkModeEvent';
  
  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async{
    // TODO: implement applyAsync

    try {
      bloc.darkMode = darkOn;
      Devfest.preferences.setBool(Devfest.darkModePref, darkOn);
      return InConfigState();
    } catch (_, stackTrace){
      print("$_ $stackTrace");
      return ErrorConfigState(_?.toString());
    }
  }
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc}) async {

    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace){
      print("$_ $stackTrace");
      return ErrorConfigState(_?.toString());
    }
  }
}