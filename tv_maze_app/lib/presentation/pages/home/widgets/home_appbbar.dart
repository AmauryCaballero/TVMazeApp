part of '../home_screen.dart';

class _HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'TV Maze',
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Text(
                DateFormat.yMMMMd().format(DateTime.now()),
                style: Theme.of(context).textTheme.titleMedium,
                textAlign: TextAlign.left,
              ).opacity(0.5),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ScreenUtil.defaultSize.height * 0.15);
}
