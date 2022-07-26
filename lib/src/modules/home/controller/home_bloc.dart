import '/src/core/infra/bloc.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeState> {
  HomeBloc() : super(HomeInitial());
}
