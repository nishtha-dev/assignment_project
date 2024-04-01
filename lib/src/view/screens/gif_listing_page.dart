import 'package:assignment_project/src/controller/bloc/gif_listing_bloc/gif_listing_bloc.dart';
import 'package:assignment_project/src/controller/bloc/search_query_bloc/search_query_bloc.dart';
import 'package:assignment_project/src/core/constants/enums.dart';
import 'package:assignment_project/src/view/widgets/gip_listing_widget.dart';
import 'package:assignment_project/src/view/widgets/search_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class GifListingPage extends StatefulWidget {
  const GifListingPage({super.key});

  @override
  State<GifListingPage> createState() => _GifListingPageState();
}

class _GifListingPageState extends State<GifListingPage> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleTheme(ThemeMode themeMode) {
    setState(() {
      _themeMode = themeMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gif Listing Page'),
      ),
      body: BlocListener<SearchQueryBloc, SearchQueryState>(
        listener: (context, state) {
          if (state.searchResultDataStatus.isSuccess) {
            context
                .read<GifListingBloc>()
                .add(SetTrendingGifData(data: state.searchResultData));
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Switch(
            //   value: isDarkMode,
            //   onChanged: (isOn) {
            //     print("isOn:- $isOn");
            //     print("isDarkMode:- $isDarkMode");
            //     isOn
            //         ? _toggleTheme(ThemeMode.dark)
            //         : _toggleTheme(ThemeMode.light);
            //   },
            // ),
            // Gap(
            //   20.h,
            // ),
            const SearchBarWidget(),
            Gap(20.h),
            const Expanded(child: GifListingWidget())
          ],
        ),
      ),
    );
  }
}
