import 'package:flutter/material.dart';
import './add_place_screen.dart';
import 'package:provider/provider.dart';
import '../providers/places.dart';
import '../screens/place_detail_screen.dart';

class PlacesList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Places'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<Places>(context, listen: false).fetchAndSetPlaces(),
        builder: (ctx, dataSnapshot) => dataSnapshot.connectionState ==
                ConnectionState.waiting
            ? Center(child: CircularProgressIndicator())
            : Consumer<Places>(
                child: Center(child: Text('got no places yet')),
                builder: (ctx, placesData, ch) => placesData.items.length > 0
                    ? ListView.builder(
                        itemCount: placesData.items.length,
                        itemBuilder: (ctx, i) => ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(
                                placesData.items[i].image,
                              ),
                            ),
                            title: Text(placesData.items[i].title),
                            subtitle:
                                Text(placesData.items[i].location.address),
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  PlacesDetailScreen.routeName,
                                  arguments: placesData.items[i].id);
                            }),
                      )
                    : ch,
              ),
      ),
    );
  }
}
