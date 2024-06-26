part of '../home_screen.dart';

class _HomeAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _HomeAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          Expanded(child: Container()),
          GestureDetector(
            onTap: () {
              context.router.push(const SearchRoute());
            },
            child: Container(
              width: 50,
              height: 50,
              color: Colors.transparent,
              child: Hero(
                tag: HeroTags.searchBar,
                child: Container(
                  width: 50,
                  height: 50,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Theme.of(context).cardColor.withOpacity(0.5),
                  ),
                  child: Icon(Icons.search_rounded,
                      color: Theme.of(context).indicatorColor),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ScreenUtil.defaultSize.height * 0.15);
}
