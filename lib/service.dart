import 'dart:developer';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:sample/model.dart';
import 'package:sample/queries.dart';

class Service {
  GraphQLClient? client;
  Queries queries = Queries();
  String? accessToken;
  Future<bool> login() async {
    client = GraphQLClient(
        link: HttpLink("https://api.vangeli.planetmedia.dev/graphql"),
        cache: GraphQLCache());

    final response = await client!
        .mutate(MutationOptions(document: gql(queries.loginQuery), variables: {
      "input": {
        "params": {
          "email": "aswini@planetmedia.in",
          "password": "pm#@VANGELI%1",
          "rememberMe": 1
        }
      }
    }));

    if (response.exception != null) {
      log("exception : ${response.exception?.graphqlErrors.first.extensions ?? "NULLL"}");
      return false;
    } else {
      log(response.data.toString());
      final user = LoginResponse.fromJson(response.data ?? {});
      if (user.login != null) {
        accessToken = user.login!.refreshToken;
        return true;
      } else {
        log("Login data is null");
        return false;
      }
    }
  }

  fetchAllJobs() async {
    final response = await client!.query(QueryOptions(
        document: gql(queries.fetchAllJobs),
        fetchPolicy: FetchPolicy.networkOnly));
    if (response.exception != null) {
      log("exception : ${response.exception?.graphqlErrors.first.extensions ?? "NULLL"}");
    } else {
      log(response.data.toString());
    }
  }
}
