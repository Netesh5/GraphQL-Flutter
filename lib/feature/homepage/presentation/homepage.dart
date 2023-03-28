import 'package:flutter/material.dart';
import 'package:graphqldemo/feature/homepage/data/respositories/geo_graphql_repo.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final GeoGraphQlRepo graphQlRepo = GeoGraphQlRepo();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GraphQL"),
      ),
      body: graphQlRepo.query(),
    );
  }
}
