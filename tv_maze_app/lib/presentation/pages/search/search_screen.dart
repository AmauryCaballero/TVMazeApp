import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../blocs/search/bloc/search_bloc.dart';
import '../../../core/configuration/di/injectable_config.dart';
import '../../../core/utils/hero_tags.dart';
import '../../widgets/frosty_background.dart';

part 'widgets/search_appbar.dart';

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
          builder: (context, state) => FrostyBackground(child: Container()),
        ),
      ),
    );
  }
}
