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
}
