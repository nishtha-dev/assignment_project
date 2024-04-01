part of 'gif_listing_bloc.dart';

class GifListingState extends Equatable {
  final List<SearchApiResponseData> gifListingData;
  final ApiStatus gifListingDataStatus;

  final int offset;

  const GifListingState(
      {this.gifListingData = const [],
      this.gifListingDataStatus = ApiStatus.initial,
      this.offset = 0});

  GifListingState copyWith(
      {List<SearchApiResponseData>? gifListingData,
      ApiStatus? gifListingDataStatus,
      int? offset}) {
    return GifListingState(
        gifListingData: gifListingData ?? this.gifListingData,
        gifListingDataStatus: gifListingDataStatus ?? this.gifListingDataStatus,
        offset: offset ?? this.offset);
  }

  @override
  List<Object> get props => [gifListingData, gifListingDataStatus, offset];
}
