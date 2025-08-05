import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blocs_app/presentation/blocs/blocs.dart';
import 'package:blocs_app/config/config.dart';

void main() {
  runApp(
    const BlocsProviders(),
  );
}

class BlocsProviders extends StatelessWidget {
  const BlocsProviders({super.key});

//? En todo widget que se desprenda del blocProviderm tendra acceso a los cubits y blocs que se hayan proporcionado.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => UsernameCubit(),
          lazy: false, //? Crea el cubit inmediatamente al iniciar la app
        ),
        BlocProvider(create: (context) => RouterSimpleCubit()),
        BlocProvider(create: (context) => CounterCubit()),
        BlocProvider(create: (context) => ThemeCubit()),
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = context.watch<RouterSimpleCubit>().state;
    final theme = context.watch<ThemeCubit>().state;

    return MaterialApp.router(
      title: 'Flutter BLoC',
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme(isDarkmode: theme.isDarkMode).getTheme(),
    );
  }
}
