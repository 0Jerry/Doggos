import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/dog_detail.dart';

import 'dog_model.dart';

class DogCard extends StatefulWidget {

  final Dog dog;

  DogCard(this.dog);

  @override
  _DogCardState createState() {
    return _DogCardState(dog);
  }

}

class _DogCardState extends State<DogCard> {

  Dog dog;
  String readerUrl;

  _DogCardState(this.dog);

  @override
  void initState() {
    super.initState();
    renderDogPic();
  }

  void renderDogPic() async {
    await dog.getImageUrl();
    if (mounted) {
      setState(() {
       readerUrl = dog.imageUrl; 
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: showDogDetailWidget,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0,  vertical: 8.0),
        child: Container(
          height: 115.0,
          child: Stack(
            children: <Widget>[
              Positioned(
                left: 50,
                child: dogCard,
              ),
              Positioned(
                top: 7.5,
                child: dogImage,
              ),
            ],
          ),
        ),
      ),
    );
  }

  showDogDetailWidget() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) {
        return DogDetailPage(dog);
      })
    );
  }

  Widget get dogImage {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          fit: BoxFit.cover,
          image: NetworkImage(readerUrl ?? ''),
        ),
      ),
    );
  }

  Widget get dogCard {
    return Container(
      width: 290.0,
      height: 115.0,
      child: Card(
        color: Colors.black12,
        child: Padding(
          padding: const EdgeInsets.only(
            top: 8.0,
            bottom: 8.0,
            left: 64.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              Text(widget.dog.name, style: Theme.of(context).textTheme.headline,),
              Text(widget.dog.location, style: Theme.of(context).textTheme.subhead,),
              Row(
                children: <Widget>[
                  Icon(Icons.star),
                  Text(': ${widget.dog.rating} / 10')
                ],
                
              ),
            ],
          ),
        ),
      ),
    );
  }

}