import 'dart:async';

import 'package:assignment_project/src/controller/repository/gif_repository.dart';
import 'package:assignment_project/src/core/constants/constants.dart';
import 'package:assignment_project/src/models/search_reponspe.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'search_query_event.dart';
part 'search_query_state.dart';

class SearchQueryBloc extends Bloc<SearchQueryEvent, SearchQueryState> {
  SearchQueryBloc({required this.gifRepository})
      : super(const SearchQueryState()) {
    on<SearchQuery>(_searchQuery);
  }
  final GifRepository gifRepository;

  FutureOr<void> _searchQuery(
      SearchQuery event, Emitter<SearchQueryState> emit) async {
    emit(state.copyWith(
      searchResultDataStatus: ApiStatus.loading,
    ));
    try {
      final response = await gifRepository.searchQuery(
          searchQuery: event.searchQuery, offset: event.offset);
      emit(state.copyWith(
        searchResultDataStatus: ApiStatus.success,
        searchResultData: state.searchResultData + response,
        offset: event.offset,
      ));
    } catch (e) {
      emit(state.copyWith(searchResultDataStatus: ApiStatus.failure));
    }
  }
}
