part of '../search_screen.dart';

class _SearchAppbar extends StatelessWidget implements PreferredSizeWidget {
  const _SearchAppbar();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: TextField(
        decoration: InputDecoration(
          labelText: 'Search',
          suffixIcon: GestureDetector(onTap: () {
            context.router.maybePop();
          }, child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Hero(
                  tag: HeroTags.searchBar,
                  child: Container(
                    width: constraints.minHeight / 2,
                    height: constraints.minHeight / 2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Theme.of(context).cardColor.withOpacity(0.5),
                    ),
                    child: Icon(Icons.close,
                        color: Theme.of(context).indicatorColor),
                  ),
                ),
              );
            },
          )),
        ),
        onChanged: (query) {
          context.read<SearchBloc>().add(PerformSearch(query));
        },
      ),
    );
  }

  @override
  Size get preferredSize =>
      Size.fromHeight(ScreenUtil.defaultSize.height * 0.12);
}
