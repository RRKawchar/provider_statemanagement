import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_statemanagement/provider/favorite_provider.dart';
import 'package:provider_statemanagement/screens/favorite_view_screen.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  List<int> selectedIndex = [];
  @override
  Widget build(BuildContext context) {

  // final provider=Provider.of<FavoriteProvider>(context,listen: false);

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
                itemCount: 100,
                itemBuilder: (context, index) {
                  return  Consumer<FavoriteProvider>(builder: (context,value,child){
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
