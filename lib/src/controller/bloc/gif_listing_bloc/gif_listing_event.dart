part of 'gif_listing_bloc.dart';

abstract class GifListingEvent {
  const GifListingEvent();
}

class GetTrendingGifData extends GifListingEvent {
  final int? offset;
  const GetTrendingGifData({this.offset});
}

class SetTrendingGifData extends GifListingEvent {
  final List<SearchApiResponseData> data;
  const SetTrendingGifData({required this.data});
}
