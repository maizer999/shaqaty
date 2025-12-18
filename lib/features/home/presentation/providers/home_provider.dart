import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/repositories/home_repository.dart';

final homeRepositoryProvider = Provider<HomeRepository>((ref) {
  return HomeRepository();
});

final homeProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final repo = ref.read(homeRepositoryProvider);
  return repo.fetchHomeData();
});
