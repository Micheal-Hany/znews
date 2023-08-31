import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:znews/core/utils/api-service.dart';
import 'package:znews/features/Search%20Page/Persention/widgets/custom%20search%20view%20body.dart';
import 'package:znews/features/home%20page/data/repos/home-repo-implemention.dart';

class CustomSearchBar extends StatefulWidget {
  const CustomSearchBar({Key? key}) : super(key: key);

  @override
  State<CustomSearchBar> createState() => _CustomSearchBarState();
}

class _CustomSearchBarState extends State<CustomSearchBar> {
  final TextEditingController _searchController = TextEditingController();

  void _performSearch() {
    final searchText = _searchController.text;
    print('Search: $searchText');
    setState(() {}); // Trigger rebuild of CustomSerchViewBody
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextField(
                onSubmitted: (value) => _performSearch(),
                cursorColor: Colors.white,
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search News...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.grey),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    vertical: 12,
                    horizontal: 20,
                  ),
                ),
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.27),
                borderRadius: const BorderRadius.all(Radius.circular(100)),
              ),
              child: IconButton(
                icon: const Icon(FontAwesomeIcons.magnifyingGlass),
                iconSize: 23,
                onPressed: _performSearch,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 15,
        ),
        CustomSerchViewBody(
          searchFuture: HomeRepoImpl(apiService: ApiService(Dio()))
              .fatchSearchNews(search: _searchController.text),
          key: UniqueKey(),
          searchname: _searchController.text,
        )
      ],
    );
  }
}
