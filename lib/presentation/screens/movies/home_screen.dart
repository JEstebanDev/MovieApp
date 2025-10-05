import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies_app/presentation/providers/providers.dart';
import 'package:movies_app/presentation/widget/widgets.dart';

class HomeScreen extends StatelessWidget {
  static const name = 'home-screen';

  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomNavigationBar(),
      body: _HomeView(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(getUpComingMoviesProvider.notifier).loadNextPage();
    ref.read(getTopRatedMoviesProvider.notifier).loadNextPage();
    ref.read(getPopularMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);

    if (initialLoading) {
      return const FullScreenLoader();
    }

    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final topRatedMovies = ref.watch(getTopRatedMoviesProvider);
    final upComingMovies = ref.watch(getUpComingMoviesProvider);
    final popularMovies = ref.watch(getPopularMoviesProvider);
    final slideshowMovies = ref.watch(moviesSlideshowProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            titlePadding: EdgeInsets.all(0),
            title: CustomAppBar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return Column(
              children: [
                MoviesSlideshow(movies: slideshowMovies),
                MoviesHorizontal(
                  title: "Now Playing",
                  subTitle: 'Monday 20th',
                  movie: nowPlayingMovies,
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontal(
                  title: "Up Coming",
                  subTitle: 'This month',
                  movie: upComingMovies,
                  loadNextPage: () => ref
                      .read(getUpComingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontal(
                  title: "Top Movies",
                  subTitle: 'All times',
                  movie: topRatedMovies,
                  loadNextPage: () => ref
                      .read(getTopRatedMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                MoviesHorizontal(
                  title: "Popular Movies",
                  movie: popularMovies,
                  loadNextPage: () => ref
                      .read(getPopularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
