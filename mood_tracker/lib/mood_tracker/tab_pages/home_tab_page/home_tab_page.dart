import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/mood_tracker/tab_pages/home_tab_page/home_tab_page_view_model.dart';
import 'package:mood_tracker/shared/index.dart';
import 'package:mood_tracker/shared/widgets/sizes.dart';

class HomeTabPage extends ConsumerWidget {
  static const routeName = 'homeTab';
  static const routePath = '/home';
  const HomeTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final moodList = ref.watch(homeTabPageViewModelProvider);
    // print(moodList.runtimeType);
    if (moodList.runtimeType != List<MoodModel>) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    } else {
      final newMoodList = moodList as List<MoodModel>;
      final sortedMoodList = newMoodList..sort((a, b) => b.createdAt.compareTo(a.createdAt));
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView.separated(
            itemCount: sortedMoodList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onLongPress: () => _deleteMood(context: context, ref: ref, id: sortedMoodList[index].id),
                child: Container(
                    padding: const EdgeInsets.all(Sizes.size24),
                    decoration: BoxDecoration(
                      color: const Color(0xff60ad95),
                      borderRadius: BorderRadius.circular(
                        Sizes.size32,
                      ),
                      border: const Border(
                        top: BorderSide(width: Sizes.size3, color: Colors.black),
                        left: BorderSide(width: Sizes.size5, color: Colors.black),
                        bottom: BorderSide(width: Sizes.size5, color: Colors.black),
                        right: BorderSide(width: Sizes.size3, color: Colors.black),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              'Mood: ',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Emoji(mood: Mood.findByName(sortedMoodList[index].emoji)),
                          ],
                        ),
                        Text(
                          sortedMoodList[index].text,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    )),
              );
            },
            separatorBuilder: (context, index) {
              return Gaps.v16;
            }),
      );
    }
  }

  void _deleteMood({required BuildContext context, required WidgetRef ref, required String id}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Are you sure you want to do this?'),
        action: SnackBarAction(
          label: 'Delete?',
          onPressed: () {
            ref.read(homeTabPageViewModelProvider.notifier).deleteMood(id);
          },
        ),
      ),
    );
  }
}
