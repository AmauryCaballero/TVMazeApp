part of '../home_screen.dart';

class _HomeBackgroundImage extends StatelessWidget {
  final String? imageUrl;

  const _HomeBackgroundImage({required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return imageUrl != null
        ? Positioned.fill(
            child: Transform.scale(
              scale: 1.5,
              child: Stack(
                children: [
                  Positioned.fill(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 200),
                      switchInCurve: Curves.easeIn,
                      switchOutCurve: Curves.easeOut,
                      transitionBuilder:
                          (Widget child, Animation<double> animation) {
                        return FadeTransition(opacity: animation, child: child);
                      },
                      child: CachedNetworkImage(
                        key: ValueKey<String>(imageUrl!),
                        imageUrl: imageUrl!,
                        fit: BoxFit.fill,
                        placeholder: (context, url) => Lottie.asset(
                          'tv_placeholder_animation'.jsonLottie,
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: BackdropFilter(
                      filter: ui.ImageFilter.blur(
                        sigmaX: 10,
                        sigmaY: 10,
                      ),
                      child: Container(
                        color: Theme.of(context).canvasColor.withOpacity(0.5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }
}
