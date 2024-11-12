import 'package:flutter/material.dart';
import 'package:demo/views/home.dart';
import 'package:demo/widgets/album_card.dart';
import 'package:demo/widgets/song_card.dart';

class allTab extends StatelessWidget {
  const allTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
              alignment: Alignment.topLeft,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * .6,
                  decoration: const BoxDecoration(
                    color: Colors.black,
                  ),
                ),
                SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0),
                          Colors.black.withOpacity(.9),
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(1),
                          Colors.black.withOpacity(1),
                        ],
                      ),
                    ),
                    child: SafeArea(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(height: 40),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Recently Played",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const Row(
                                  children: [
                                    Icon(Icons.history),
                                    SizedBox(width: 16),
                                    Icon(Icons.settings),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            physics: BouncingScrollPhysics(),
                            padding: EdgeInsets.all(16),
                            child: Row(
                              children: [
                                AlbumCard(
                                  label: "Best Mode",
                                  image: AssetImage("assets/album7.jpg"),
                                ),
                                SizedBox(width: 16),
                                AlbumCard(
                                  label: "Motivation Mix",
                                  image: AssetImage("assets/album2.jpg"),
                                ),
                                SizedBox(width: 16),
                                AlbumCard(
                                  label: "Top 50-Global",
                                  image: AssetImage("assets/top50.jpg"),
                                ),
                                SizedBox(width: 16),
                                AlbumCard(
                                  label: "Power Gaming",
                                  image: AssetImage("assets/album1.jpg"),
                                ),
                                SizedBox(width: 16),
                                AlbumCard(
                                  label: "Top songs - Global",
                                  image: AssetImage("assets/album9.jpg"),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 32),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  "Good evening",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Top 50 - Global",
                                      image: const AssetImage("assets/top50.jpg"),
                                    ),
                                    const SizedBox(width: 16),
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Best Mode",
                                      image: const AssetImage("assets/album1.jpg"),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Tamil Songs",
                                      image: const AssetImage("assets/album2.jpg"),
                                    ),
                                    const SizedBox(width: 16),
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Eminem",
                                      image: const AssetImage("assets/album5.jpg"),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 16),
                                Row(
                                  children: [
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Top 50 - India",
                                      image: const AssetImage("assets/album9.jpg"),
                                    ),
                                    const SizedBox(width: 16),
                                    RowAlbumCard(
                                      onTap: (){},
                                      label: "Pop Remix",
                                      image: const AssetImage("assets/album10.jpg"),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Based on your recent listening",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    SongCard(
                                      image: AssetImage("assets/album2.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album6.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album9.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album4.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album5.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album1.jpg"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: Text(
                                  "Recommended radio",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              const SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                physics: BouncingScrollPhysics(),
                                padding: EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  children: [
                                    SongCard(
                                      image: AssetImage("assets/album8.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album5.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album6.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album1.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album3.jpg"),
                                    ),
                                    SizedBox(width: 16),
                                    SongCard(
                                      image: AssetImage("assets/album10.jpg"),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 16),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            );
  }
}