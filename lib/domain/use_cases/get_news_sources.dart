import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../entities/news_source.dart';
import '../repositories/news_source_repository.dart';

class GetNewsSources extends UseCase<dynamic, List<NewsSource>, NoParams> {
  GetNewsSources(this.repository);

  final NewsSourceRepository repository;

  @override
  FutureOr<Either<Failure, List<NewsSource>>> call(NoParams params) {
    return repository.getNewsSource();
  }
}
