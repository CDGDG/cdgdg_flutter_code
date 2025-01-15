// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      name: json['name'] as String,
      playcount: json['playcount'] as String,
      listeners: json['listeners'] as String,
      url: json['url'] as String,
      artist: Artist.fromJson(json['artist'] as Map<String, dynamic>),
      image: _extractLargeImage(json['image'] as List),
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'playcount': instance.playcount,
      'listeners': instance.listeners,
      'url': instance.url,
      'artist': instance.artist,
      'image': instance.image,
    };
