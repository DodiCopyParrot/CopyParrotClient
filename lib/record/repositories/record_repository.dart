import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:copyparrot/models/bookmark_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'record_repository.g.dart';

@riverpod
BookmarkRepository bookmarkRepository(Ref ref) {
  return BookmarkRepository();
}

class BookmarkRepository {
  final _dio = Dio();

  // 모든 PersonModel 리스트 가져오기
  // Future<List<BookmarkModel>> getAllBookmarks() async {
  Future<List<BookmarkModel>> tbd_getAllBookmarks() async {
    final uri = Uri.http(
      "semtle.catholic.ac.kr:8087",
      '/bookmarks',
    );
    final response = await _dio.getUri(uri); // 실제 API 엔드포인트 사용
    final List<dynamic> data = jsonDecode(response.data);
    return data.map((json) => BookmarkModel.fromJson(json)).toList();
  }
  // Future<List<BookmarkModel>> tmp_getAllBookmarks() async {
  Future<List<BookmarkModel>> getAllBookmarks() async {
    const String dummyJson = '''
    [
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트 받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "일론"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "트럼프"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      },
      {
        "chatId": "",
        "koText": "받은 한국어 텍스트",
        "enText": "번역한 영어 텍스트",
        "voice": "음성파일",
        "timestamp": "2024-08-20 10:20",
        "image": "인플루언서 이미지",
        "name": "오바마"
      }
    ]
    ''';
    // JSON 파싱
    final List<dynamic> data = jsonDecode(dummyJson);

    // BookmarkModel 리스트로 변환하여 반환
    return data.map((json) => BookmarkModel.fromJson(json)).toList();
  }

  // 이름 리스트 가져오기 (중복 제거)
  Future<List<String>> getUniqueNames() async {
    final persons = await getAllBookmarks();
    return persons.map((person) => person.name).toSet().toList(); // 중복 제거
  }
}
