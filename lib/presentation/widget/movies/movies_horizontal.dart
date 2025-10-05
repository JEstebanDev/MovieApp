import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/config/constants/environment.dart';
import 'package:movies_app/config/helpers/number_formatter.dart';
import 'package:movies_app/domain/entities/movie.dart';

class MoviesHorizontal extends StatefulWidget {
  final List<Movie> movie;
  final String? title;
  final String? subTitle;
  final VoidCallback? loadNextPage;

  const MoviesHorizontal({
    super.key,
    required this.movie,
    this.title,
    this.subTitle,
    this.loadNextPage,
  });

  @override
  State<MoviesHorizontal> createState() => _MoviesHorizontalState();
}

class _MoviesHorizontalState extends State<MoviesHorizontal> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (widget.loadNextPage == null) {
        return;
      }

      if (scrollController.position.pixels + 200 >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage!();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 360,
      child: Column(
        children: [
          if (widget.title != null || widget.subTitle != null)
            _Title(title: widget.title, subTitle: widget.subTitle),
          Expanded(
            child: ListView.builder(
              controller: scrollController,
              itemCount: widget.movie.length,
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return _Slide(movie: widget.movie[index]);
              },
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Movie movie;
  const _Slide({required this.movie});
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _ImageContent(movie: movie),
          const SizedBox(height: 8),
          SizedBox(
            width: 150,
            height: 36, // Height fijo para uniformidad
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                movie.title,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: textStyle.labelLarge,
              ),
            ),
          ),
          const SizedBox(height: 4),
          // Mejor diseño para voteAverage y popularity
          SizedBox(
            width: 150,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Rating con badge style
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 6,
                    vertical: 2,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.amber.withValues(alpha: 0.15),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(Icons.star, color: Colors.amber, size: 14),
                      const SizedBox(width: 3),
                      Text(
                        movie.voteAverage.toStringAsFixed(1),
                        style: textStyle.bodySmall?.copyWith(
                          color: Colors.amber.shade900,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                // Popularity con icono
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.trending_up,
                      color: Colors.grey.shade600,
                      size: 14,
                    ),
                    const SizedBox(width: 3),
                    Text(
                      NumberFormatter.number(movie.popularity),
                      style: textStyle.bodySmall?.copyWith(
                        color: Colors.grey.shade700,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;
  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
          const Spacer(),
          if (subTitle != null)
            FilledButton.tonal(
              style: const ButtonStyle(visualDensity: VisualDensity.compact),
              onPressed: () {},
              child: Text(subTitle!),
            ),
        ],
      ),
    );
  }
}

class _ImageContent extends StatelessWidget {
  const _ImageContent({required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 150,
      child: ClipRRect(
        borderRadius: BorderRadiusGeometry.circular(20),
        child: Image.network(
          movie.posterPath,
          width: 150,
          fit: BoxFit.cover,
          loadingBuilder: (context, child, loadingProgress) {
            if (loadingProgress != null) {
              return Container(
                width: 150,
                height: 225, // Aspect ratio típico de póster (2:3)
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.grey[300]!,
                      Colors.grey[100]!,
                      Colors.grey[300]!,
                    ],
                    stops: const [0.0, 0.5, 1.0],
                  ),
                ),
                child: Center(
                  child: Pulse(
                    infinite: true,
                    child: Icon(
                      Icons.movie_outlined,
                      size: 50,
                      color: Colors.grey[600],
                    ),
                  ),
                ),
              );
            }
            return GestureDetector(
              onTap: () =>
                  context.push('${Environment.movieRouting}${movie.id}'),
              child: FadeIn(child: child),
            );
          },
        ),
      ),
    );
  }
}
