import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../entities/news_source.dart';

abstract class NewsSourceRepository {
  Either<Failure, List<NewsSource>> getNewsSource();
}
