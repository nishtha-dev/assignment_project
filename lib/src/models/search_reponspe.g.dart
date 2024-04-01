// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_reponspe.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchApiResponse _$SearchApiResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchApiResponse',
      json,
      ($checkedConvert) {
        final val = SearchApiResponse(
          data: $checkedConvert('data',
              (v) => SearchApiResponseData.fromJson(v as Map<String, dynamic>)),
          pagination: $checkedConvert('pagination',
              (v) => Pagination.fromJson(v as Map<String, dynamic>)),
          meta: $checkedConvert(
              'meta', (v) => Meta.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

SearchApiResponseData _$SearchApiResponseDataFromJson(
        Map<String, dynamic> json) =>
    $checkedCreate(
      'SearchApiResponseData',
      json,
      ($checkedConvert) {
        final val = SearchApiResponseData(
          type: $checkedConvert('type', (v) => v as String),
          id: $checkedConvert('id', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
          slug: $checkedConvert('slug', (v) => v as String),
          bitlyGifUrl: $checkedConvert('bitly_gif_url', (v) => v as String),
          bitlyUrl: $checkedConvert('bitly_url', (v) => v as String),
          embedUrl: $checkedConvert('embed_url', (v) => v as String),
          username: $checkedConvert('username', (v) => v as String),
          source: $checkedConvert('source', (v) => v as String),
          title: $checkedConvert('title', (v) => v as String),
          rating: $checkedConvert('rating', (v) => v as String),
          contentUrl: $checkedConvert('content_url', (v) => v as String),
          sourceTld: $checkedConvert('source_tld', (v) => v as String),
          sourcePostUrl: $checkedConvert('source_post_url', (v) => v as String),
          isSticker: $checkedConvert('is_sticker', (v) => v as int),
          importDatetime: $checkedConvert(
              'import_datetime', (v) => DateTime.parse(v as String)),
          trendingDatetime: $checkedConvert(
              'trending_datetime', (v) => DateTime.parse(v as String)),
          images: $checkedConvert(
              'images', (v) => Images.fromJson(v as Map<String, dynamic>)),
          analyticsResponsePayload:
              $checkedConvert('analytics_response_payload', (v) => v as String),
          analytics: $checkedConvert('analytics',
              (v) => Analytics.fromJson(v as Map<String, dynamic>)),
          altText: $checkedConvert('alt_text', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {
        'bitlyGifUrl': 'bitly_gif_url',
        'bitlyUrl': 'bitly_url',
        'embedUrl': 'embed_url',
        'contentUrl': 'content_url',
        'sourceTld': 'source_tld',
        'sourcePostUrl': 'source_post_url',
        'isSticker': 'is_sticker',
        'importDatetime': 'import_datetime',
        'trendingDatetime': 'trending_datetime',
        'analyticsResponsePayload': 'analytics_response_payload',
        'altText': 'alt_text'
      },
    );

Analytics _$AnalyticsFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Analytics',
      json,
      ($checkedConvert) {
        final val = Analytics(
          onload: $checkedConvert(
              'onload', (v) => Onclick.fromJson(v as Map<String, dynamic>)),
          onclick: $checkedConvert(
              'onclick', (v) => Onclick.fromJson(v as Map<String, dynamic>)),
          onsent: $checkedConvert(
              'onsent', (v) => Onclick.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
    );

Onclick _$OnclickFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Onclick',
      json,
      ($checkedConvert) {
        final val = Onclick(
          url: $checkedConvert('url', (v) => v as String),
        );
        return val;
      },
    );

Images _$ImagesFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Images',
      json,
      ($checkedConvert) {
        final val = Images(
          original: $checkedConvert('original',
              (v) => FixedWidth.fromJson(v as Map<String, dynamic>)),
          fixedWidth: $checkedConvert('fixed_width',
              (v) => FixedWidth.fromJson(v as Map<String, dynamic>)),
        );
        return val;
      },
      fieldKeyMap: const {'fixedWidth': 'fixed_width'},
    );

FixedWidth _$FixedWidthFromJson(Map<String, dynamic> json) => $checkedCreate(
      'FixedWidth',
      json,
      ($checkedConvert) {
        final val = FixedWidth(
          height: $checkedConvert('height', (v) => v as String),
          width: $checkedConvert('width', (v) => v as String),
          size: $checkedConvert('size', (v) => v as String),
          url: $checkedConvert('url', (v) => v as String),
          mp4Size: $checkedConvert('mp4_size', (v) => v as String),
          mp4: $checkedConvert('mp4', (v) => v as String),
          webpSize: $checkedConvert('webp_size', (v) => v as String),
          webp: $checkedConvert('webp', (v) => v as String),
          frames: $checkedConvert('frames', (v) => v as String?),
          hash: $checkedConvert('hash', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'mp4Size': 'mp4_size', 'webpSize': 'webp_size'},
    );

Meta _$MetaFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Meta',
      json,
      ($checkedConvert) {
        final val = Meta(
          status: $checkedConvert('status', (v) => v as int),
          msg: $checkedConvert('msg', (v) => v as String),
          responseId: $checkedConvert('response_id', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'responseId': 'response_id'},
    );

Pagination _$PaginationFromJson(Map<String, dynamic> json) => $checkedCreate(
      'Pagination',
      json,
      ($checkedConvert) {
        final val = Pagination(
          totalCount: $checkedConvert('total_count', (v) => v as int),
          count: $checkedConvert('count', (v) => v as int),
          offset: $checkedConvert('offset', (v) => v as int),
        );
        return val;
      },
      fieldKeyMap: const {'totalCount': 'total_count'},
    );
