import 'package:flutter/material.dart';
import 'package:front/screens/cart_screen.dart';
import 'package:front/widgets/app_drawer.dart';
import 'package:provider/provider.dart';
import '../widgets/demands_list.dart';
import '../widgets/badge.dart';
import 'package:front/providers/cart.dart';
import './cart_screen.dart';
import '../providers/demands.dart';

enum FilterOptions {
  Favorites,
  All,
}

class DemandOverviewScreen extends StatefulWidget {
  @override
  _DemandOverviewScreenState createState() => _DemandOverviewScreenState();
}

class _DemandOverviewScreenState extends State<DemandOverviewScreen> {
  var _showOnlyIsDone = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      _isLoading = true;
      Provider.of<Demands>(context).fetchAndSetDemands().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    //for system wide filter
    //final demandContainer = Provider.of<Demands>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text('Form Shop'),
          actions: <Widget>[
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyIsDone = true;
                  } else {
                    _showOnlyIsDone = false;
                  }
                });
              },
              icon: Icon(
                Icons.more_vert,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                    child: Text('Only Favorites'),
                    value: FilterOptions.Favorites),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                )
              ],
            ),
            Consumer<Cart>(
                builder: (_, cart, ch) => Badge(
                      child: ch,
                      value: cart.itemCount.toString(),
                    ),
                child: IconButton(
                  icon: Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(CartScreen.routName);
                  },
                )),
          ],
        ),
        drawer: AppDrawer(),
        body: _isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : DemandsList(_showOnlyIsDone));
  }
}
