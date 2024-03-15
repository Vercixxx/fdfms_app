import 'package:flutter/material.dart';

// Scripts
import '../scripts/get_posts.dart';

class FdfmsHome extends StatefulWidget {
  const FdfmsHome({Key? key}) : super(key: key);

  @override
  _FdfmsHomeState createState() => _FdfmsHomeState();
}

class _FdfmsHomeState extends State<FdfmsHome> {
  late Future<List<dynamic>> postsFuture = fetchPosts();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: FutureBuilder<List<dynamic>>(
        future: postsFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  'Recent Posts',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data?.length,
                    itemBuilder: (context, index) {
                      var post = snapshot.data?[index];
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            splashColor: Color.fromARGB(134, 12, 136, 95),
                            onTap: () {},
                            child: ListTile(
                              title: Text(
                                post['title'],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              subtitle: Text(post['content']),
                              trailing: Text(
                                  'By ${post['author_username']} on ${post['posted_date']}'),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
