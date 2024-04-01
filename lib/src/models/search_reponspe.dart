// To parse this JSON data, do
//
//     final searchApiResponse = searchApiResponseFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';

part 'search_reponspe.g.dart';

const deserailize = JsonSerializable(
    createToJson: false, checked: true, fieldRename: FieldRename.snake);

@deserailize
class SearchApiResponse {
  SearchApiResponseData data;

  Pagination pagination;

  Meta meta;

  SearchApiResponse({
    required this.data,
    required this.pagination,
    required this.meta,
  });

  factory SearchApiResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchApiResponseFromJson(json);
}

@deserailize
class SearchApiResponseData {
  String type;

  String id;

  String url;

  String slug;

  String bitlyGifUrl;

  String bitlyUrl;

  String embedUrl;

  String username;

  String source;

  String title;

  String rating;

  String contentUrl;

  String sourceTld;

  String sourcePostUrl;

  int isSticker;

  DateTime importDatetime;

  DateTime trendingDatetime;

  Images images;

  String analyticsResponsePayload;

  Analytics analytics;

  String altText;

  SearchApiResponseData({
    required this.type,
    required this.id,
    required this.url,
    required this.slug,
    required this.bitlyGifUrl,
    required this.bitlyUrl,
    required this.embedUrl,
    required this.username,
    required this.source,
    required this.title,
    required this.rating,
    required this.contentUrl,
    required this.sourceTld,
    required this.sourcePostUrl,
    required this.isSticker,
    required this.importDatetime,
    required this.trendingDatetime,
    required this.images,
    required this.analyticsResponsePayload,
    required this.analytics,
    required this.altText,
  });

  factory SearchApiResponseData.fromJson(Map<String, dynamic> json) =>
      _$SearchApiResponseDataFromJson(json);

  static List<SearchApiResponseData> listFromJson(List<dynamic> list) {
    return list.map((data) => SearchApiResponseData.fromJson(data)).toList();
  }
}

@deserailize
class Analytics {
  Onclick onload;

  Onclick onclick;

  Onclick onsent;

  Analytics({
    required this.onload,
    required this.onclick,
    required this.onsent,
  });

  factory Analytics.fromJson(Map<String, dynamic> json) =>
      _$AnalyticsFromJson(json);
}

@deserailize
class Onclick {
  String url;

  Onclick({
    required this.url,
  });

  factory Onclick.fromJson(Map<String, dynamic> json) =>
      _$OnclickFromJson(json);
}

@deserailize
class Images {
  FixedWidth original;

  FixedWidth fixedWidth;

  Images({
    required this.original,
    required this.fixedWidth,
  });

  factory Images.fromJson(Map<String, dynamic> json) => _$ImagesFromJson(json);
}

@deserailize
class FixedWidth {
  String height;

  String width;

  String size;

  String url;

  String mp4Size;

  String mp4;

  String webpSize;

  String webp;

  String? frames;

  String? hash;

  FixedWidth({
    required this.height,
    required this.width,
    required this.size,
    required this.url,
    required this.mp4Size,
    required this.mp4,
    required this.webpSize,
    required this.webp,
    this.frames,
    this.hash,
  });

  factory FixedWidth.fromJson(Map<String, dynamic> json) =>
      _$FixedWidthFromJson(json);
}

@deserailize
class Meta {
  int status;

  String msg;

  String responseId;

  Meta({
    required this.status,
    required this.msg,
    required this.responseId,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}

@deserailize
class Pagination {
  int totalCount;

  int count;

  int offset;

  Pagination({
    required this.totalCount,
    required this.count,
    required this.offset,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) =>
      _$PaginationFromJson(json);
}
