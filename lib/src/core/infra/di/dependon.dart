library dependon;

part 'dependon_impl.dart';

T get<T extends Object>() => Dependon._instance.get<T>();

abstract class Dependon {
  Dependon._();

  static final Dependon _instance = _DependonImpl();

  static Dependon get instance => _instance;

  T get<T extends Object>();

  void registerFactory<T extends Object>(T Function() builder);

  void registerSingleton<T extends Object>(T instance);

  void registerLazySingleton<T extends Object>(T Function() builder);
}
