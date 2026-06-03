import 'package:json_annotation/json_annotation.dart';

import '../../domain/entity/similar_movies_entity.dart';

part 'similar_movies_response.g.dart';

@JsonSerializable()
class SimilarMoviesResponse {
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

  SimilarMoviesResponse ({
    this.error,
    this.status,
    this.statusMessage,
    this.data,
    this.meta,
  });

  factory SimilarMoviesResponse.fromJson(Map<String, dynamic> json) {
    return _$SimilarMoviesResponseFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$SimilarMoviesResponseToJson(this);
  }
  SimilarMoviesEntity toEntity() => SimilarMoviesEntity(data?.movies ?? []);
}

@JsonSerializable()
class Data {
  @JsonKey(name: "movie_count")
  final int? movieCount;
  @JsonKey(name: "movies")
  final List<Movie>? movies;

  Data ({
    this.movieCount,
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
class Movie {
  @JsonKey(name: "id")
  final int? id;
  @JsonKey(name: "url")
  final String? url;
  @JsonKey(name: "imdb_code")
  final String? imdbCode;
  @JsonKey(name: "title")
  final String? title;
  @JsonKey(name: "title_english")
  final String? titleEnglish;
  @JsonKey(name: "title_long")
  final String? titleLong;
  @JsonKey(name: "slug")
  final String? slug;
  @JsonKey(name: "year")
  final int? year;
  @JsonKey(name: "rating")
  final double? rating;
  @JsonKey(name: "runtime")
  final int? runtime;
  @JsonKey(name: "genres")
  final List<String>? genres;
  @JsonKey(name: "summary")
  final String? summary;
  @JsonKey(name: "description_full")
  final String? descriptionFull;
  @JsonKey(name: "synopsis")
  final String? synopsis;
  @JsonKey(name: "yt_trailer_code")
  final String? ytTrailerCode;
  @JsonKey(name: "language")
  final String? language;
  @JsonKey(name: "mpa_rating")
  final String? mpaRating;
  @JsonKey(name: "background_image")
  final String? backgroundImage;
  @JsonKey(name: "background_image_original")
  final String? backgroundImageOriginal;
  @JsonKey(name: "small_cover_image")
  final String? smallCoverImage;
  @JsonKey(name: "medium_cover_image")
  final String? mediumCoverImage;
  @JsonKey(name: "state")
  final String? state;
  @JsonKey(name: "torrents")
  final List<Torrents>? torrents;
  @JsonKey(name: "date_uploaded")
  final String? dateUploaded;
  @JsonKey(name: "date_uploaded_unix")
  final int? dateUploadedUnix;

  Movie ({
    this.id,
    this.url,
    this.imdbCode,
    this.title,
    this.titleEnglish,
    this.titleLong,
    this.slug,
    this.year,
    this.rating,
    this.runtime,
    this.genres,
    this.summary,
    this.descriptionFull,
    this.synopsis,
    this.ytTrailerCode,
    this.language,
    this.mpaRating,
    this.backgroundImage,
    this.backgroundImageOriginal,
    this.smallCoverImage,
    this.mediumCoverImage,
    this.state,
    this.torrents,
    this.dateUploaded,
    this.dateUploadedUnix,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return _$MovieFromJson(json);
  }

  Map<String, dynamic> toJson() {
    return _$MovieToJson(this);
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


