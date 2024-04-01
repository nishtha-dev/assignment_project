import 'dart:async';

import 'package:assignment_project/src/controller/repository/gif_repository.dart';
import 'package:assignment_project/src/core/constants/enums.dart';
import 'package:assignment_project/src/models/search_reponspe.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'gif_listing_event.dart';
part 'gif_listing_state.dart';

class GifListingBloc extends Bloc<GifListingEvent, GifListingState> {
  GifListingBloc({required this.gifRepository})
      : super(const GifListingState()) {
    on<GetTrendingGifData>(_getTrendingGifData);
    on<SetTrendingGifData>(_setTrendingGifData);
  }

  final GifRepository gifRepository;

  FutureOr<void> _getTrendingGifData(
      GetTrendingGifData event, Emitter<GifListingState> emit) async {
    emit(state.copyWith(gifListingDataStatus: ApiStatus.loading));
    try {
      final response =
          await gifRepository.getTrendingGifData(offset: event.offset);

      final List<SearchApiResponseData> dataList =
          state.gifListingData + response;

      emit(state.copyWith(
          gifListingDataStatus: ApiStatus.success,
          gifListingData: dataList,
          offset: event.offset));
    } catch (e) {
      emit(state.copyWith(gifListingDataStatus: ApiStatus.failure));
    }
  }

  FutureOr<void> _setTrendingGifData(
      SetTrendingGifData event, Emitter<GifListingState> emit) async {
    emit(state.copyWith(gifListingData: event.data));
  }
}
