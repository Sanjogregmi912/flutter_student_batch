import 'package:batch_student_starter/data_source/local_data_source/batch_data_source.dart';
import 'package:batch_student_starter/model/batch.dart';

abstract class BatchRepository {
  Future<List<Batch>> getBatch();
  Future<int> addBatch(Batch batch);
}

class BatchRepositoryImp extends BatchRepository {
  @override
  Future<int> addBatch(Batch batch) {
    return BatchDataSource().addBatch(batch);
  }

  @override
  Future<List<Batch>> getBatch() {
    return BatchDataSource().getBatch();
  }
}
