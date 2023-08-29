import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/favorite_provider.dart';

class FavoriteViewScreen extends StatefulWidget {
  const FavoriteViewScreen({super.key});

  @override
  State<FavoriteViewScreen> createState() => _FavoriteViewScreenState();
}

class _FavoriteViewScreenState extends State<FavoriteViewScreen> {
  @override
  Widget build(BuildContext context) {

     final provider=Provider.of<FavoriteProvider>(context,listen: false);

    print("Rebuild");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Favorite"),
        actions: [
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>FavoriteViewScreen()));
            },
            child: Icon(Icons.favorite),
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: provider.selectedIndex.length,
                itemBuilder: (context, index) {
                  return Consumer<FavoriteProvider>(builder: (context,value,child){
                    return ListTile(
                        title: Text("Items" + index.toString()),
                        trailing: IconButton(
                          onPressed: () {
                            if(value.selectedIndex.contains(index)){
                              value.removeItem(index);
                            }else{
                              value.addItem(index);
                            }


                          },
                          icon: value.selectedIndex.contains(index)
                              ? const Icon(
                            Icons.favorite,
                          )
                              : const Icon(
                            Icons.favorite_border_outlined,
                          ),
                        )
                    );
                  },





                  );
                }),
          )
        ],
      ),
    );
  }
}
