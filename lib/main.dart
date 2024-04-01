import 'package:assignment_project/src/controller/bloc/gif_listing_bloc/gif_listing_bloc.dart';
import 'package:assignment_project/src/controller/bloc/search_query_bloc/search_query_bloc.dart';
import 'package:assignment_project/src/controller/repository/gif_repository.dart';
import 'package:assignment_project/src/core/constants/endpoints.dart';
import 'package:assignment_project/src/core/dio/dio_client.dart';
import 'package:assignment_project/src/core/theme/app_theme.dart';
import 'package:assignment_project/src/view/screens/gif_listing_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: (context, child) {
        ScreenUtil.init(context, designSize: const Size(360, 801));
        return RepositoryProvider<GifRepository>(
          create: (context) =>
              GifRepositoryImpl(client: DioClient.create(Endpoints.baseUrl)),
          child: MultiBlocProvider(
            providers: [
              BlocProvider(
                  create: (context) => GifListingBloc(
                      gifRepository: context.read<GifRepository>())),
              BlocProvider(
                  create: (context) => SearchQueryBloc(
                      gifRepository: context.read<GifRepository>()))
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              title: 'Flutter Demo',
              theme: AppTheme.lightThemeData,
              darkTheme: AppTheme.darkThemeData,
              themeMode: ThemeMode.system,
              home: const GifListingPage(),
            ),
          ),
        );
      },
    );
  }
}
