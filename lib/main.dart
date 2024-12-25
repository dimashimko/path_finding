import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finding/routes/app_router.dart';

import 'pages/home_page/blocs/home_bloc/home_bloc.dart';
import 'repos/data_repo/data_repository.dart';

void main() {
  runApp(
    const QssInspectorApp(),
  );
}

class QssInspectorApp extends StatelessWidget {
  const QssInspectorApp({super.key});

  static final GoRouter router = getRouter();

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DataRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(
              dataRepository: context.read<DataRepository>(),
            ),
          ),
        ],
        child: MaterialApp.router(
          title: 'QSS inspectors',
          // theme: AppThemes.light(),
          routerConfig: router,
          // builder: BotToastInit(),
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
