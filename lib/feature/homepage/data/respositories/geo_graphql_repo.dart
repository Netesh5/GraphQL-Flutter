import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GeoGraphQlRepo {
  String documentNode = """
 query getGeoData{
      continents{
        name,
        countries{
          name
        }
      }
  }
    """;

  static HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");

  ValueNotifier<GraphQLClient> client =
      ValueNotifier(GraphQLClient(link: httpLink, cache: GraphQLCache()));

  Widget query() {
    return Column(
      children: [
        Query(
            options: QueryOptions(document: gql(documentNode)),
            builder: (result, {fetchMore, refetch}) {
              if (result.data == null) {
                return const Center(
                  child: Text("No data found"),
                );
              } else {
                return Expanded(
                  child: ListView.separated(
                      shrinkWrap: false,
                      itemBuilder: (context, index) {
                        return ExpansionTile(
                          title:
                              Text(result.data!["continents"][index]["name"]),
                          children: [
                            SizedBox(
                              height: 400,
                              child: CountryName(
                                result: result,
                                index: index,
                              ),
                            ),
                          ],
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const Divider();
                      },
                      itemCount: result.data!["continents"].length),
                );
              }
            }),
      ],
    );
  }
}

class CountryName extends StatelessWidget {
  const CountryName({
    required this.result,
    required this.index,
    super.key,
  });
  final QueryResult result;
  final int index;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: result.data!["continents"][index]["countries"].length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
              result.data!["continents"][index]["countries"][index]["name"]),
        );
      },
    );
  }
}
