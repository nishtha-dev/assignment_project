import 'package:assignment_project/src/controller/bloc/gif_listing_bloc/gif_listing_bloc.dart';
import 'package:assignment_project/src/controller/bloc/search_query_bloc/search_query_bloc.dart';
import 'package:assignment_project/src/core/constants/constants.dart';
import 'package:assignment_project/src/core/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBarWidget extends StatefulWidget {
  const SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  late TextEditingController _controller;
  late Debounce _debounce;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
    _debounce = Debounce(milliseconds: 3000);
  }

  @override
  void dispose() {
    _controller.dispose();
    _debounce.cancel();
    super.dispose();
  }

  void search({required String query}) {
    if (query.isEmpty || query.length < 3) {
      return;
    }
    //implement search here
    context.read<SearchQueryBloc>().add(SearchQuery(searchQuery: query));
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SearchQueryBloc, SearchQueryState>(
      listener: (context, state) {
        if (state.searchResultDataStatus.isSuccess) {
          context
              .read<GifListingBloc>()
              .add(SetTrendingGifData(data: state.searchResultData));
        }
      },
      child: TextFormField(
        controller: _controller,
        onChanged: (value) {
          _debounce.run(call: () {
            search(query: value);
          });
        },
        decoration: const InputDecoration(
          hintText: 'Type your query here',
          contentPadding: EdgeInsets.all(13),
          border:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
          errorBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
          disabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
        ),
      ),
    );
  }
}
