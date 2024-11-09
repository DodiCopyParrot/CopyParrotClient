import 'package:copyparrot/models/bookmark_model.dart';
import 'package:copyparrot/record/repositories/record_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_viewmodel.g.dart';

@riverpod
class BookmarkViewModel extends _$BookmarkViewModel {
  @override
  Future<List<BookmarkModel>> build() async {
    return fetchAllBookmarks();
  }

  // 모든 PersonModel 리스트 가져오기
  Future<List<BookmarkModel>> fetchAllBookmarks() async {
    final repository = ref.read(bookmarkRepositoryProvider);
    return await repository.getAllBookmarks();
  }

  // 중복 없는 이름 리스트 가져오기
  Future<List<String>> fetchUniqueNames() async {
    final repository = ref.read(bookmarkRepositoryProvider);
    return await repository.getUniqueNames();
  }

  Future<void> setBookmark({required int markId}) async {
    final _dio = Dio();
    final uri = Uri.https(
      "parrot.dopaminedefense.team",
      '/shadowing/record',
    );
    final response = await _dio.postUri(
      uri,
      data: {"markId": markId},
      // options: Options(
      //   headers: {
      //     'Content-Length': "500",
      //     'Content-Type': 'application/json', // Content-Type도 설정
      //   },
      // ),
    );
  }
}
