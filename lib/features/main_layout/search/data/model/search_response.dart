import 'package:json_annotation/json_annotation.dart';
import 'package:movies/features/main_layout/home/data/model/movie_response.dart';

import '../../domain/entity/search_movie_entity.dart';

part 'search_response.g.dart';

@JsonSerializable()
class SearchResponse {
  @JsonKey(name: "error")
  final String? error;
  @JsonKey(name: "status")
  final String? status;
  @JsonKey(name: "status_message")
  final String? statusMessage;
  @JsonKey(name: "data")
  final Data? data;
  @JsonKey(name: "@meta")
  final Meta? meta;

  SearchResponse ({
    this.error,
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return _$SearchResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SearchResponseToJson(this);
  }

  SearchMovieEntity toEntity() => SearchMovieEntity(data?.movies ??[]);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "limit")
  final int? limit;
  @JsonKey(name: "page_number")
  final int? pageNumber;
  @JsonKey(name: "movies")
  final List<Movie>? movies;

  Data ({
    this.movieCount,
    this.limit,
    this.pageNumber,
    this.movies,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return _$DataFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$DataToJson(this);
  }
}


@JsonSerializable()
class Torrents {
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "hash")
  final String? hash;
  @JsonKey(name: "quality")
  final String? quality;
  @JsonKey(name: "type")
  final String? type;
  @JsonKey(name: "is_repack")
  final String? isRepack;
  @JsonKey(name: "video_codec")
  final String? videoCodec;
  @JsonKey(name: "bit_depth")
  final String? bitDepth;
  @JsonKey(name: "audio_channels")
  final String? audioChannels;
  @JsonKey(name: "seeds")
  final int? seeds;
  @JsonKey(name: "peers")
  final int? peers;
  @JsonKey(name: "size")
  final String? size;
  @JsonKey(name: "size_bytes")
  final int? sizeBytes;
  @JsonKey(name: "date_uploaded")
  final String? dateUploaded;
  @JsonKey(name: "date_uploaded_unix")
  final int? dateUploadedUnix;

  Torrents ({
    this.url,
    this.hash,
    this.quality,
    this.type,
    this.isRepack,
    this.videoCodec,
    this.bitDepth,
    this.audioChannels,
    this.seeds,
    this.peers,
    this.size,
    this.sizeBytes,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Torrents.fromJson(Map<String, dynamic> json) {
    return _$TorrentsFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$TorrentsToJson(this);
  }
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "api_version")
  final int? apiVersion;
  @JsonKey(name: "execution_time")
  final String? executionTime;

  Meta ({
    this.apiVersion,
    this.executionTime,
  });

  factory Meta.fromJson(Map<String, dynamic> json) {
    return _$MetaFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MetaToJson(this);
  }
}


