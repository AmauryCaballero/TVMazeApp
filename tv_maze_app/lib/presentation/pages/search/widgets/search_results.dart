part of '../search_screen.dart';

class _SearchResults extends StatelessWidget {
  final List<Series> seriesList;

  const _SearchResults({required this.seriesList});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return ListView.separated(
          itemCount: seriesList.length,
          itemBuilder: (context, index) {
            final series = seriesList[index];
            return SizedBox(
              height: (constraints.maxWidth / 3) - 10,
              width: constraints.maxWidth - 10,
              child: Card(
                  color: Theme.of(context).canvasColor.withOpacity(0.5),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Card(
                            color: Theme.of(context).cardColor.withOpacity(0.5),
                            clipBehavior: Clip.antiAlias,
                            child: CachedNetworkImage(
                              width: constraints.maxWidth / 5,
                              fit: BoxFit.cover,
                              imageUrl: series.image.original,
                              placeholder: (context, url) => Lottie.asset(
                                  'tv_placeholder_animation'.jsonLottie),
                              errorWidget: (context, url, error) =>
                                  Lottie.asset(
                                      'tv_placeholder_animation'.jsonLottie),
                            ),
                          ),
                          Container(
                              width: constraints.maxWidth / 1.4,
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Flexible(
                                        flex: 6,
                                        child: Text(
                                          series.name,
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      if (series.premiered.isNotEmpty)
                                        Flexible(
                                          flex: 4,
                                          child: Text(
                                            " (${series.premiered.split("-")[0]})",
                                            style: Theme.of(context)
                                                .textTheme
                                                .labelSmall,
                                          ),
                                        )
                                    ],
                                  ),
                                  if (series.rating?.average != null)
                                    RatingBarIndicator(
                                      rating: series.rating!.average! / 2,
                                      itemBuilder: (context, index) => Icon(
                                        Icons.star,
                                        color: Theme.of(context).hintColor,
                                      ),
                                      itemCount: 5,
                                      itemSize: 20.0,
                                      direction: Axis.horizontal,
                                    ),
                                  Text(
                                    series.genres.join(' \u2022 '),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                    textAlign: TextAlign.left,
                                  )
                                ],
                              ))
                        ],
                      ),
                    ],
                  )),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(height: 10),
        );
      },
    );
  }
}
