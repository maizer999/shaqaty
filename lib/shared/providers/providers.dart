import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/constants/app_strings.dart';
import '../../core/utils/system_preferences_helper.dart';
import '../enums/status_model.dart';

final searchQueryProvider = StateProvider.autoDispose<String>((ref) => "");
final isSearchEnabled = StateProvider.autoDispose<bool>((ref) => false);
final searchQueryCountProvider = StateProvider.autoDispose<int>((ref) => 0);

final selectedStatusFilterChipProvider = StateProvider.autoDispose<StatusModel>(
  (ref) {
    return StatusModel(statusId: '', statusName: AppStrings.statusAll);
  },
  name: "selectedStatusFilterChipProvider",
);
final lastSubmittedStatusProvider = StateProvider<String?>((ref) => "");
//common status filter controllers
final commonStatusIdsProvider =
    Provider.autoDispose.family<List<int>, List<StatusModel>>(
  (ref, availableStatuses) {
    final selectedFilter = ref.watch(
      selectedStatusFilterChipProvider.select(
        (value) => value.statusName,
      ),
    );

    if (selectedFilter == AppStrings.statusAll) {
      return availableStatuses
          .map((e) => int.tryParse(e.statusId))
          .where((id) => id != null)
          .map((id) => id!)
          .toList();
    } else {
      return availableStatuses
          .where((status) => selectedFilter == status.statusName)
          .map((e) => int.tryParse(e.statusId))
          .where((id) => id != null)
          .map((id) => id!)
          .toList();
    }
  },
  name: "commonStatusIdsProvider ",
);

final localizationDataProvider =
    FutureProvider<Map<String, dynamic>>((ref) async {
  final data = await SystemPreferencesHelper.getLocalizationData();
  return data ?? {};
});
