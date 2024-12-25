import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:path_finding/routes/app_router.dart';

import 'generated/l10n.dart';
import 'pages/home_page/blocs/home_bloc/home_bloc.dart';
import 'repos/data_repo/data_repository.dart';
import 'themes/app_themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
          routerConfig: router,
          theme: AppThemes.lightTheme,
          supportedLocales: S.delegate.supportedLocales,
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
        ),
      ),
    );
  }
}
