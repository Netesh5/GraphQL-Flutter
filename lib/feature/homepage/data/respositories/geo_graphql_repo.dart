import 'dart:js';
import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GeoGraphQlRepo {
  late final GraphQLClient _client;
  fetchData() {
    HttpLink httpLink = HttpLink("https://countries.trevorblades.com/");
    _client = GraphQLClient(link: httpLink, cache: GraphQLCache());
  }

  Query query() {
    return Query(
        options: QueryOptions(document: r'''
query getGeoData{
  continents{
    name,
    countries{
      name
    }
  }
}
    '''),
        builder: (result, {fetchMore, refetch}) {
          if (result.data == null) {
            return const Center(
              child: Text("No data found"),
            );
          } else {
            return ListView.separated(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(result.data!["continents"][index]["name"]),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: result.data!["continents"]);
          }
        });
  }
}
