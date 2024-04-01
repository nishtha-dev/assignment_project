part of 'search_query_bloc.dart';

class SearchQueryState extends Equatable {
  final List<SearchApiResponseData> searchResultData;
  final ApiStatus searchResultDataStatus;

  final int offset;

  const SearchQueryState(
      {this.searchResultData = const [],
      this.searchResultDataStatus = ApiStatus.initial,
      this.offset = 0});

  SearchQueryState copyWith(
      {List<SearchApiResponseData>? searchResultData,
      ApiStatus? searchResultDataStatus,
      String? searchQuery,
      int? offset}) {
    return SearchQueryState(
        searchResultData: searchResultData ?? this.searchResultData,
        searchResultDataStatus:
            searchResultDataStatus ?? this.searchResultDataStatus,
        offset: offset ?? this.offset);
  }

  @override
  List<Object> get props => [
        searchResultData,
        searchResultDataStatus,
        offset,
      ];
}
