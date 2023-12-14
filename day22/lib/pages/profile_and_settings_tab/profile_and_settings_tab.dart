import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProfileAndSettingsTab extends StatefulWidget {
  const ProfileAndSettingsTab({super.key});

  @override
  State<ProfileAndSettingsTab> createState() => _ProfileAndSettingsTabState();
}

class _ProfileAndSettingsTabState extends State<ProfileAndSettingsTab>
    with SingleTickerProviderStateMixin {
  late final _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            flexibleSpace: _profileAndSettings(),
            expandedHeight: 300,
            pinned: true,
            floating: true,
            snap: true,
            bottom: TabBar(
              controller: _tabController,
              tabs: [
                Tab(
                  text: 'Threads',
                ),
                Tab(
                  text: 'Replies',
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return ListTile(
                    title: Text('Item #$index',
                        style: TextStyle(fontSize: 24, color: Colors.white)));
              },
              childCount: 100, // Number of items in the list
            ),
          )
        ],
      ),
    );
  }

  Widget _profileAndSettings() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(children: [
        _settingRow(),
        _profileDashBoard(),
        _editAndShareProfile(),
      ]),
    );
  }

  Widget _settingRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.language),
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.instagram),
            ),
            IconButton(
              onPressed: () {},
              icon: const FaIcon(FontAwesomeIcons.bars),
            ),
          ],
        ),
      ],
    );
  }

  Widget _profileDashBoard() {
    return Row(children: [_detailProfile(), _avatarProfile()]);
  }

  Widget _detailProfile() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'John Doe',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '@johndoe',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          'This is my bio',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _avatarProfile() {
    return CircleAvatar(
      radius: 40,
      backgroundImage: AssetImage('assets/images/profile_image_1.jpg'),
    );
  }

  Widget _editAndShareProfile() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          onPressed: () {},
          child: Text('Edit Profile'),
        ),
        ElevatedButton(
          onPressed: () {},
          child: Text('Share Profile'),
        ),
      ],
    );
  }
}
