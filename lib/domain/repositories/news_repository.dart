import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../entities/news.dart';

abstract class NewsRepository {
  Future<Either<Failure, List<News>>> fetchNewsList();
}
