part of 'search_query_bloc.dart';

abstract class SearchQueryEvent {
  const SearchQueryEvent();
}

class SearchQuery extends SearchQueryEvent {
  final int? offset;
  final String searchQuery;
  const SearchQuery({this.offset, required this.searchQuery});
}
