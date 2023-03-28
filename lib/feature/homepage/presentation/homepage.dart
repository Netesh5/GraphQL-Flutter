import 'package:flutter/material.dart';
import 'package:graphqldemo/feature/homepage/data/respositories/geo_graphql_repo.dart';
import 'package:graphqldemo/feature/homepage/presentation/widgets/querybuilder.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GeoGraphQlRepo graphQlRepo = GeoGraphQlRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL"),
      ),
      body: QueryBuilder(),
    );
  }
}
