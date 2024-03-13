import 'package:ar_drawing_app/features/draw_using_template/bloc/draw_using_template_bloc.dart';
import 'package:ar_drawing_app/features/first_languages/bloc/languages_bloc.dart';
import 'package:ar_drawing_app/features/onboarding/bloc/onboarding_bloc.dart';
import 'package:ar_drawing_app/features/permission/bloc/permission_bloc.dart';
import 'package:ar_drawing_app/features/setting/bloc/languages_bloc.dart';
import 'package:ar_drawing_app/generated/l10n.dart';
import 'package:ar_drawing_app/features/splash/view/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<LanguagesBloc>(
          create: (context) => LanguagesBloc(),
        ),
        BlocProvider<SettingsBloc>(
          create: (context) => SettingsBloc(),
        ),
        BlocProvider<OnboardingBloc>(
          create: (context) => OnboardingBloc(),
        ),
        BlocProvider<DrawUsingTemplateBloc>(
          create: (context) => DrawUsingTemplateBloc(),
        ),
        BlocProvider<PermissionBloc>(
          create: (context) => PermissionBloc()..add(LoadSwitchEvent()),
        ),
      ],
      child: BlocBuilder<LanguagesBloc, LanguagesState>(
        builder: (context, state) {
          return MaterialApp(
            localizationsDelegates: const [
              S.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            debugShowCheckedModeBanner: false,
            supportedLocales: S.delegate.supportedLocales,
            locale: state.locale,
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
