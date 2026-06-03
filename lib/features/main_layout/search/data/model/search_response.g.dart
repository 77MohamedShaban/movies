// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchResponse _$SearchResponseFromJson(Map<String, dynamic> json) =>
    SearchResponse(
      error: json['error'] as String?,
      status: json['status'] as String?,
      statusMessage: json['status_message'] as String?,
      data: json['data'] == null
          ? null
          : Data.fromJson(json['data'] as Map<String, dynamic>),
      meta: json['@meta'] == null
          ? null
          : Meta.fromJson(json['@meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchResponseToJson(SearchResponse instance) =>
    <String, dynamic>{
      'error': instance.error,
      'status': instance.status,
      'status_message': instance.statusMessage,
      'data': instance.data,
      '@meta': instance.meta,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
  movieCount: (json['movie_count'] as num?)?.toInt(),
  limit: (json['limit'] as num?)?.toInt(),
  pageNumber: (json['page_number'] as num?)?.toInt(),
  movies: (json['movies'] as List<dynamic>?)
      ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
  'movie_count': instance.movieCount,
  'limit': instance.limit,
  'page_number': instance.pageNumber,
  'movies': instance.movies,
};

Torrents _$TorrentsFromJson(Map<String, dynamic> json) => Torrents(
  url: json['url'] as String?,
  hash: json['hash'] as String?,
  quality: json['quality'] as String?,
  type: json['type'] as String?,
  isRepack: json['is_repack'] as String?,
  videoCodec: json['video_codec'] as String?,
  bitDepth: json['bit_depth'] as String?,
  audioChannels: json['audio_channels'] as String?,
  seeds: (json['seeds'] as num?)?.toInt(),
  peers: (json['peers'] as num?)?.toInt(),
  size: json['size'] as String?,
  sizeBytes: (json['size_bytes'] as num?)?.toInt(),
  dateUploaded: json['date_uploaded'] as String?,
  dateUploadedUnix: (json['date_uploaded_unix'] as num?)?.toInt(),
);

Map<String, dynamic> _$TorrentsToJson(Torrents instance) => <String, dynamic>{
  'url': instance.url,
  'hash': instance.hash,
  'quality': instance.quality,
  'type': instance.type,
  'is_repack': instance.isRepack,
  'video_codec': instance.videoCodec,
  'bit_depth': instance.bitDepth,
  'audio_channels': instance.audioChannels,
  'seeds': instance.seeds,
  'peers': instance.peers,
  'size': instance.size,
  'size_bytes': instance.sizeBytes,
  'date_uploaded': instance.dateUploaded,
  'date_uploaded_unix': instance.dateUploadedUnix,
};

Meta _$MetaFromJson(Map<String, dynamic> json) => Meta(
  apiVersion: (json['api_version'] as num?)?.toInt(),
  executionTime: json['execution_time'] as String?,
);

Map<String, dynamic> _$MetaToJson(Meta instance) => <String, dynamic>{
  'api_version': instance.apiVersion,
  'execution_time': instance.executionTime,
};
