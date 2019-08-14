import 'package:bloc/bloc.dart';
import 'index.dart';


class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {

  //* Create Singleton for dark mode in full application
  static final ConfigBloc _configBlocSingleton = ConfigBloc._internal();

  factory ConfigBloc(){
    return _configBlocSingleton;
  }

  ConfigBloc._internal();

  bool darkMode = false;

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(
    ConfigEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}