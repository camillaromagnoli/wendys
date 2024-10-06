import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';

part 'cache_response.g.dart';

@HiveType(typeId: 1)
class CacheResponse extends Equatable {
  const CacheResponse({
    required this.response,
    required this.etag,
  });

  @HiveField(0)
  final Map<String, dynamic>? response;
  @HiveField(1)
  final String? etag;

  @override
  List<Object?> get props => [
        response,
        etag,
      ];
}
