import 'dart:async';

import '../../core/either.dart';
import '../../core/error/failures.dart';
import '../../core/use_cases/use_case.dart';
import '../entities/news.dart';
import '../repositories/news_repository.dart';

class GetNewsList
    extends UseCase<Future<Either<Failure, List<News>>>, NoParams> {
  GetNewsList(this.repository);

  final NewsRepository repository;

  @override
  Future<Either<Failure, List<News>>> call(NoParams params) {
    return repository.fetchNewsList();
  }
}
