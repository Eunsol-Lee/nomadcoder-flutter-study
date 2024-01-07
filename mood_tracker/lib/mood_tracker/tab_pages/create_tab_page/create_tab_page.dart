import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mood_tracker/mood_tracker/index.dart';
import 'package:mood_tracker/shared/index.dart';

import 'create_tab_page_view_model.dart';
import 'widgets/index.dart';

class CreateTabPage extends HookConsumerWidget {
  static const routeName = 'createTab';
  static const routePath = '/create';

  const CreateTabPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final textController = useTextEditingController();
    final selectedEmoji = useState<Mood?>(null);

    final attemptedPostResult = ref.watch(createTabPageViewModelProvider);

    if (attemptedPostResult.status == Status.success) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Post Success'),
            content: const Text('Successfully posted!'),
            actions: <Widget>[
              TextButton(
                  child: const Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    ref.read(createTabPageViewModelProvider.notifier).resetState();
                    context.goNamed(HomeTabPage.routeName);
                  }),
            ],
          ),
        );
      });
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Gaps.v16,
          Text('How do you feel?', style: Theme.of(context).textTheme.titleLarge),
          Gaps.v8,
          Container(
            height: Sizes.size96 + Sizes.size96,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                Sizes.size8,
              ),
              border: const Border(
                top: BorderSide(width: Sizes.size3, color: Colors.black),
                left: BorderSide(width: Sizes.size4, color: Colors.black),
                bottom: BorderSide(width: Sizes.size5, color: Colors.black),
                right: BorderSide(width: Sizes.size3, color: Colors.black),
              ),
            ),
            child: TextField(
              controller: textController,
              maxLines: 7,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(
                  Sizes.size12,
                ),
                fillColor: Colors.transparent,
                border: InputBorder.none,
                enabledBorder: InputBorder.none,
                focusedBorder: InputBorder.none,
                hintText: 'Write it down here!',
              ),
            ),
          ),
          Gaps.v16,
          Text("What's your mood?", style: Theme.of(context).textTheme.titleLarge),
          Gaps.v8,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.grin,
                onPressed: () => selectedEmoji.value = Mood.grin,
                child: const Emoji(
                  mood: Mood.grin,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.love,
                onPressed: () => selectedEmoji.value = Mood.love,
                child: const Emoji(
                  mood: Mood.love,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.blush,
                onPressed: () => selectedEmoji.value = Mood.blush,
                child: const Emoji(
                  mood: Mood.blush,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.pokerFace,
                onPressed: () => selectedEmoji.value = Mood.pokerFace,
                child: const Emoji(
                  mood: Mood.pokerFace,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.sob,
                onPressed: () => selectedEmoji.value = Mood.sob,
                child: const Emoji(
                  mood: Mood.sob,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.angry,
                onPressed: () => selectedEmoji.value = Mood.angry,
                child: const Emoji(
                  mood: Mood.angry,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.tired,
                onPressed: () => selectedEmoji.value = Mood.tired,
                child: const Emoji(
                  mood: Mood.tired,
                ),
              ),
              ToggleButton(
                isSelected: selectedEmoji.value == Mood.vomiting,
                onPressed: () => selectedEmoji.value = Mood.vomiting,
                child: const Emoji(
                  mood: Mood.vomiting,
                ),
              ),
            ],
          ),
          Gaps.v48,
          MtButton(
            'Post',
            onPressed: () => _post(ref: ref, text: textController.text, emoji: selectedEmoji.value.toString()),
          ),
        ],
      ),
    );
  }

  void _post({required WidgetRef ref, required String text, required String emoji}) {
    ref.read(createTabPageViewModelProvider.notifier).post(text: text, emoji: emoji);
  }
}
