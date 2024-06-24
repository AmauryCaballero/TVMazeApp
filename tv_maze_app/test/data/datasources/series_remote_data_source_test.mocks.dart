// Mocks generated by Mockito 5.4.4 from annotations
// in tv_maze_app/test/data/datasources/series_remote_data_source_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:tv_maze_app/data/api/models/episode_model.dart' as _i3;
import 'package:tv_maze_app/data/api/models/search_result_model.dart' as _i6;
import 'package:tv_maze_app/data/api/models/series_model.dart' as _i2;
import 'package:tv_maze_app/data/api/tvmaze_api_service.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeSeriesModel_0 extends _i1.SmartFake implements _i2.SeriesModel {
  _FakeSeriesModel_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeEpisodeModel_1 extends _i1.SmartFake implements _i3.EpisodeModel {
  _FakeEpisodeModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [TvMazeApiService].
///
/// See the documentation for Mockito's code generation for more information.
class MockTvMazeApiService extends _i1.Mock implements _i4.TvMazeApiService {
  MockTvMazeApiService() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<List<_i2.SeriesModel>> getAllSeries(int? page) =>
      (super.noSuchMethod(
        Invocation.method(
          #getAllSeries,
          [page],
        ),
        returnValue:
            _i5.Future<List<_i2.SeriesModel>>.value(<_i2.SeriesModel>[]),
      ) as _i5.Future<List<_i2.SeriesModel>>);

  @override
  _i5.Future<List<_i6.SearchResultModel>> searchSeries(String? query) =>
      (super.noSuchMethod(
        Invocation.method(
          #searchSeries,
          [query],
        ),
        returnValue: _i5.Future<List<_i6.SearchResultModel>>.value(
            <_i6.SearchResultModel>[]),
      ) as _i5.Future<List<_i6.SearchResultModel>>);

  @override
  _i5.Future<_i2.SeriesModel> getSeriesDetails(int? id) => (super.noSuchMethod(
        Invocation.method(
          #getSeriesDetails,
          [id],
        ),
        returnValue: _i5.Future<_i2.SeriesModel>.value(_FakeSeriesModel_0(
          this,
          Invocation.method(
            #getSeriesDetails,
            [id],
          ),
        )),
      ) as _i5.Future<_i2.SeriesModel>);

  @override
  _i5.Future<List<_i3.EpisodeModel>> getEpisodesBySeries(int? seriesId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEpisodesBySeries,
          [seriesId],
        ),
        returnValue:
            _i5.Future<List<_i3.EpisodeModel>>.value(<_i3.EpisodeModel>[]),
      ) as _i5.Future<List<_i3.EpisodeModel>>);

  @override
  _i5.Future<_i3.EpisodeModel> getEpisodeDetails(int? episodeId) =>
      (super.noSuchMethod(
        Invocation.method(
          #getEpisodeDetails,
          [episodeId],
        ),
        returnValue: _i5.Future<_i3.EpisodeModel>.value(_FakeEpisodeModel_1(
          this,
          Invocation.method(
            #getEpisodeDetails,
            [episodeId],
          ),
        )),
      ) as _i5.Future<_i3.EpisodeModel>);
}