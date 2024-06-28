import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:tv_maze_app/core/utils/assets_extension.dart';

import '../../../domain/entities/series.dart';
import '../../blocs/search/bloc/search_bloc.dart';
import '../../../core/configuration/di/injectable_config.dart';
import '../../../core/utils/hero_tags.dart';
import '../../widgets/frosty_background.dart';

part 'widgets/search_appbar.dart';
part 'widgets/search_results.dart';

@RoutePage()
class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => getIt<SearchBloc>(),
      child: Scaffold(
        appBar: const _SearchAppbar(),
        backgroundColor: Colors.transparent,
        body: BlocBuilder<SearchBloc, SearchState>(
          builder: (context, state) => FrostyBackground(
            child: _buildBody(context, state),
          ),
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, SearchState state) {
    if (state is SearchLoading) {
      return const Center(child: CircularProgressIndicator());
    } else if (state is SearchLoaded) {
      return _SearchResults(seriesList: state.seriesList);
    } else if (state is SearchError) {
      return Center(child: Text(state.message));
    } else {
      return const Center(child: Text('Start typing to search'));
    }
  }
}
