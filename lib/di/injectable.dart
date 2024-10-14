import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:sample/features/card/data/data_sources/remote/card_api_service.dart';
import 'package:sample/features/card/data/repository/card_repository_impl.dart';
import 'package:sample/features/card/domain/repositories/card_repository.dart';
import 'package:sample/features/card/domain/usecases/fecth_card_usecase.dart';
import 'package:sample/features/card/domain/usecases/search_card_usecase.dart';
import 'package:sample/features/card/presentation/bloc/remote/card/card_bloc.dart';
import 'package:sample/infrastructure/dio_interceptor.dart';

// GetIt instance for dependency injection
final GetIt sl = GetIt.instance;

// Function to initialize dependencies
Future<void> initializeDependencies() async {
  
  /*------------------------------ DIO --------------------------------*/
  sl.registerSingleton<Dio>(Dio()
    ..interceptors.add(DioInterceptor())
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 90,
    )));


/*------------------------------ CARD --------------------------------*/

// Card Api Service
  sl.registerSingleton<CardApiService>(CardApiService(sl()));
  // Card Repository
  sl.registerSingleton<FetchCardRepository>(
    FetchCardRepositoryImpl(sl()),
  );
  sl.registerSingleton<SearchCardRepository>(
    SearchCardRepositoryImpl(sl()),
  );

  // Use Case
  sl.registerSingleton<FetchCardUseCase>(
      FetchCardUseCase(sl()));
  sl.registerSingleton<SearchCardUseCase>(SearchCardUseCase(sl()));

  // Card Bloc
  sl.registerFactory<CardBloc>(() =>
      CardBloc(sl<FetchCardUseCase>(),sl<SearchCardUseCase>()));
}
