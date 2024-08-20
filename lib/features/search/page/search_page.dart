import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:trading_app/core/constans/color/color_const.dart';
import 'package:trading_app/core/constans/icons/icon_const.dart';
import 'package:trading_app/core/model/tranding_model2.dart';
import 'package:trading_app/features/home/widgets/menu_side_bar.dart';
import 'package:trading_app/features/search/cubit/search_cubit.dart';
import 'package:trading_app/features/search/state/serch_state.dart';

class SearchPage extends StatefulWidget {
  final TrandingModelSearch searchData;

 SearchPage({required this.searchData});

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<SearchCubit>().loadSearchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConst.darkBody,
      appBar: AppBar(
         backgroundColor: ColorConst.darkPurple,
        leading: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Hero(
            tag: 'menu',
            child: IconButton(
              icon: SvgPicture.asset(IconConst.menu),
              onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => const MenuSideBar())),
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              final query = _searchController.text;
              if (query.isNotEmpty) {
                context.read<SearchCubit>().searchCompanies(query);
              }
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                labelText: 'Enter company name or symbol',
                border: OutlineInputBorder(),
              ),
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  context.read<SearchCubit>().searchCompanies(query);
                }
              },
            ),
          ),
          Expanded(
            child: BlocBuilder<SearchCubit, SearchState>(
              builder: (context, state) {
                if (state is SearchLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is SearchLoaded) {
                  final searchResults = state.searchResults;
                  if (searchResults.isEmpty) {
                    return const Center(child: Text('No companie'));
                  }
                  return ListView.builder(
                    itemCount: searchResults.length,
                    itemBuilder: (context, index) {
                      final company = searchResults[index];
                      return ListTile(
                        title: Text(company.name),
                        subtitle: Text(
                          "Price: \$${company.price.toStringAsFixed(2)} (${company.changePercent.toStringAsFixed(2)}%)",
                          style: TextStyle(
                            color: company.change >= 0 ? Colors.green : Colors.red,
                          ),
                        ),
                      );
                    },
                  );
                } else if (state is SearchEmpty) {
                  return const Center(child: Text('No companies found'));
                } else if (state is SearchError) {
                  return Center(child: Text('Error: ${state.message}'));
                } else {
                  return const Center(child: Text('Search for a company'));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
