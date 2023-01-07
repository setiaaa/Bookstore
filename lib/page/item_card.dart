import 'package:flutter/material.dart';

class ItemCard extends StatelessWidget {
  final String judul;
  final int harga;
  //// Pointer to Update Function
  final Function? onUpdate;
  //// Pointer to Delete Function
  final Function? onDelete;

  ItemCard(this.judul, this.harga, {this.onUpdate, this.onDelete});

  @override
  Widget build(BuildContext context) {
    final itemCard = new Container(
      child: new Container(
        margin: new EdgeInsets.all(20),
        constraints: new BoxConstraints.expand(),
        child: new Container(
          height: 4.0,
          child: new Column(
            children: <Widget>[
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Row(
                    children: [
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Image.asset('../lib/assets/contents/636138.jpg', height: 70.0),
                        ],
                      ),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Row(
                            children: <Widget>[
                              new Container(
                                width: 20.0,
                              ),
                              new Text(
                                judul,
                                textAlign: TextAlign.justify,
                                // overflow: TextOverflow.ellipsis,
                                style: new TextStyle(fontWeight: FontWeight.bold)
                              ),
                            ],
                          ),
                          new Row(
                            children: <Widget>[
                              new Container(
                                width: 20.0,
                              ),
                              new Text(
                                '$harga',
                                textAlign: TextAlign.left,
                                // overflow: TextOverflow.ellipsis,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  new Column(
                    children: [
                      new Column(
                        // crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.yellow),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.arrow_upward,
                                  color: Colors.white,
                                )
                              ),
                              onPressed: () {
                                if (onUpdate != null) onUpdate!();
                              }
                            ),
                          ),
                          SizedBox(
                            height: 40,
                            width: 60,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.red),
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.delete,
                                  color: Colors.white,
                                )
                              ),
                              onPressed: () {
                                if (onDelete != null) onDelete!();
                              },
                            ),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        )
      ),
      height: 115.0,
      decoration: new BoxDecoration(
        color: new Color(0xFFFFFFFF),
        shape: BoxShape.rectangle,
        borderRadius: new BorderRadius.circular(8.0),
        boxShadow: <BoxShadow>[
          new BoxShadow(
            color: Colors.black38,
            blurRadius: 25.0,
            offset: new Offset(8.0, 8.0),
          ),
        ],
      ),
    );
    return new Container(
      height: 140.0,
      margin: EdgeInsets.all(1.0),
      child: new Column(
        children: <Widget>[
          itemCard,
        ],
      ),
    );
  }

  // Widget build(BuildContext context) {
  //   return Container(
  //     width: double.infinity,
  //     margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
  //     padding: const EdgeInsets.all(5),
  //     decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(8),
  //         border: Border.all(color: Colors.blue)),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 SizedBox(
  //                   width: MediaQuery.of(context).size.width * 0.5,
  //                   child: Text(
  //                     judul,
  //                   ),
  //                 ),
  //                 Text(
  //                   "$harga",
  //                 )
  //               ],
  //             ),
              
    
}
