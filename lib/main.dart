import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:graphqldemo/feature/homepage/data/respositories/geo_graphql_repo.dart';
import 'package:graphqldemo/feature/homepage/presentation/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final GeoGraphQlRepo geoGraphQlRepo = GeoGraphQlRepo();
  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: geoGraphQlRepo.client,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeScreen(),
      ),
    );
  }
}
