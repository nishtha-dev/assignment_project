import 'package:assignment_project/src/controller/bloc/gif_listing_bloc/gif_listing_bloc.dart';
import 'package:assignment_project/src/core/common_widgets/error_dialog.dart';
import 'package:assignment_project/src/core/common_widgets/full_screen_loader.dart';
import 'package:assignment_project/src/core/constants/enums.dart';
import 'package:assignment_project/src/view/widgets/gif_item_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GifListingWidget extends StatefulWidget {
  const GifListingWidget({super.key});

  @override
  State<GifListingWidget> createState() => _GifListingWidgetState();
}

class _GifListingWidgetState extends State<GifListingWidget> {
  late ScrollController _controller;
  final int _maxItemsShown = 10;

  @override
  void initState() {
    super.initState();
    _controller = ScrollController();
    context.read<GifListingBloc>().add(const GetTrendingGifData(offset: 0));
    _controller.addListener(() {
      double nextTriggerPoint = 0.8 * _controller.position.maxScrollExtent;
      if (_controller.offset > nextTriggerPoint) {
        final state = context.read<GifListingBloc>().state;
        context
            .read<GifListingBloc>()
            .add(GetTrendingGifData(offset: state.offset + 10));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GifListingBloc, GifListingState>(
      builder: (context, state) {
        if (state.gifListingData.isEmpty) {
          if (state.gifListingDataStatus.isLoading) {
            return const FullScreenLoader();
          } else if (state.gifListingDataStatus.isFailure) {
            return const ErrorDialogWidget(size: 20);
          }
        }

        return GridView.builder(
            controller: _controller,
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(8.0),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.0,
              crossAxisSpacing: 8.0,
            ),
            itemCount: state.gifListingData.length,
            itemBuilder: (context, index) {
              if (state.gifListingData.length == index) {
                if (state.gifListingDataStatus.isFailure) {
                  return const ErrorDialogWidget(size: 20);
                } else if (state.gifListingDataStatus.isLoading) {
                  return const FullScreenLoader();
                }
              }
              return GifItemContainer(
                imageUrl: state.gifListingData[index].images.fixedWidth.url,
              );
            });
      },
    );
  }
}
