part of '../home_screen.dart';

class _HomeSeriesCard extends StatelessWidget {
  final Series serie;

  const _HomeSeriesCard({super.key, required this.serie});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      clipBehavior: Clip.antiAlias,
      child: LayoutBuilder(builder: (context, constraints) {
        double blurHeight = constraints.maxHeight / 3.2;

        return Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: serie.image?.medium ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Lottie.asset(
                'tv_placeholder_animation'.jsonLottie,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: ClipPath(
                child: SizedBox(
                  height: blurHeight,
                  child: BackdropFilter(
                    filter: ui.ImageFilter.blur(
                      sigmaX: 100,
                      sigmaY: 100,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context).cardColor.withOpacity(0.7),
                            Theme.of(context).cardColor,
                          ],
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: blurHeight / 4,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              serie.name,
                              style: Theme.of(context).textTheme.headlineSmall,
                              textAlign: TextAlign.left,
                              overflow: TextOverflow.ellipsis,
                            ),
                            if (serie.genres.isNotEmpty)
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Flexible(
                                    flex: 5,
                                    child: Text(
                                      serie.genres.join(' \u2022 '),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  if (serie.rating != null)
                                    Flexible(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 5,
                                            height: blurHeight / 5,
                                            color: Theme.of(context)
                                                .hintColor
                                                .withOpacity(0.9),
                                          ),
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8, vertical: 2),
                                            color: Theme.of(context)
                                                .canvasColor
                                                .withOpacity(0.9),
                                            child: Text(
                                              '${serie.rating?.average ?? 0.0}',
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                ],
                              )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      }),
    );
  }
}
