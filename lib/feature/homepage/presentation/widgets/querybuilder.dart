import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/feature/homepage/data/respositories/geo_graphql_repo.dart';

class QueryBuilder extends StatelessWidget {
  QueryBuilder({super.key});
  final GeoGraphQlRepo geoGraphQlRepo = GeoGraphQlRepo();
  @override
  Widget build(BuildContext context) {
    return Query(
        options: QueryOptions(document: gql(geoGraphQlRepo.documentNode)),
        builder: (result, {fetchMore, refetch}) {
          if (result.data == null) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ExpansionTile(
                    title: Text(result.data!["continents"][index]["name"]),
                    children: [
                      CountryName(
                        result: result,
                        indexs: index,
                      ),
                    ],
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: result.data!["continents"].length);
          }
        });
  }
}

class CountryName extends StatelessWidget {
  const CountryName({
    required this.result,
    required this.indexs,
    super.key,
  });
  final QueryResult result;
  final int indexs;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: result.data!["continents"][indexs]["countries"].length,
      itemBuilder: (BuildContext context, int index) {
        return ListTile(
          title: Text(
              result.data!["continents"][indexs]["countries"][index]["name"]),
        );
      },
    );
  }
}
