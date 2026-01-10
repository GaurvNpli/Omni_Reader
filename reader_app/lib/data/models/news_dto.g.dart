// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewsApiResponseImpl _$$NewsApiResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$NewsApiResponseImpl(
      status: json['status'] as String,
      totalResults: (json['totalResults'] as num).toInt(),
      articles: (json['articles'] as List<dynamic>)
          .map((e) => ArticleDto.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NewsApiResponseImplToJson(
        _$NewsApiResponseImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'totalResults': instance.totalResults,
      'articles': instance.articles,
    };

_$SourceDtoImpl _$$SourceDtoImplFromJson(Map<String, dynamic> json) =>
    _$SourceDtoImpl(
      id: json['id'] as String?,
      name: json['name'] as String,
    );

Map<String, dynamic> _$$SourceDtoImplToJson(_$SourceDtoImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };

_$ArticleDtoImpl _$$ArticleDtoImplFromJson(Map<String, dynamic> json) =>
    _$ArticleDtoImpl(
      source: SourceDto.fromJson(json['source'] as Map<String, dynamic>),
      author: json['author'] as String?,
      title: json['title'] as String,
      description: json['description'] as String?,
      url: json['url'] as String,
      urlToImage: json['urlToImage'] as String?,
      publishedAt: json['publishedAt'] as String?,
      content: json['content'] as String?,
    );

Map<String, dynamic> _$$ArticleDtoImplToJson(_$ArticleDtoImpl instance) =>
    <String, dynamic>{
      'source': instance.source,
      'author': instance.author,
      'title': instance.title,
      'description': instance.description,
      'url': instance.url,
      'urlToImage': instance.urlToImage,
      'publishedAt': instance.publishedAt,
      'content': instance.content,
    };
