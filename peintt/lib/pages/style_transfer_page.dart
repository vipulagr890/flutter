import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:peintt/blocs/image_bloc.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  int selectStyle = -1;
  var imageBloc;

  @override
  void initState() {
    imageBloc = context.read<ImageBloc>();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          onPressed: () {
            imageBloc.add(ImageEvent.resetImage());
          },
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          RawMaterialButton(
            constraints: BoxConstraints.expand(width: 80, height: 5),
            elevation: 2.0,
            child: Text('Save',
                style: TextStyle(color: Colors.white, fontSize: 20)),
            padding: EdgeInsets.fromLTRB(-20, 0, 0, 0),
            onPressed: () {},
          ),
          RawMaterialButton(
            constraints: BoxConstraints.expand(width: 80, height: 5),
            elevation: 2.0,
            child: Icon(Icons.share),
            padding: EdgeInsets.fromLTRB(-20, 0, 0, 0),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        minimum: EdgeInsets.fromLTRB(0, 0, 0, 15),
        child: BlocBuilder<ImageBloc, ImageState>(
          builder: (context, state) {
            return Stack(
              children: [
                Column(
                  children: [
                    Expanded(
                      child: state.transferImage == null
                          ? Image.memory(state.originImage)
                          : Image.memory(state.transferImage),
                    ),
                    Container(height: 10),
                    Container(
                      height: 50,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          RawMaterialButton(
                            constraints: BoxConstraints.tight(Size(32, 32)),
                            shape: new CircleBorder(),
                            child: Text('HD'),
                            fillColor: const Color(0xff888888).withOpacity(0.5),
                            onPressed: () {},
                          ),
                          RawMaterialButton(
                            constraints: BoxConstraints.tight(Size(32, 32)),
                            shape: new CircleBorder(),
                            child: Icon(Icons.share, size: 18),
                            fillColor: const Color(0xff888888).withOpacity(0.5),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          if (index == 0) {
                            return GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: 100,
                                child: Center(
                                    child: Text(
                                  'Library...',
                                  style: TextStyle(fontSize: 20),
                                )),
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.yellow,
                                ),
                              ),
                            );
                          } else {
                            var stylePath =
                                'assets/style_transfer_images/style$index.jpg';
                            return GestureDetector(
                              onTap: () {
                                if (selectStyle == index) {
                                  return;
                                }

                                setState(() {
                                  selectStyle = index;
                                });

                                imageBloc
                                    .add(ImageEvent.transferImage(stylePath));
                              },
                              child: Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                  border: selectStyle == index
                                      ? Border.all(
                                          color: Colors.yellow,
                                          width: 2,
                                        )
                                      : null,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.asset(stylePath),
                                ),
                              ),
                            );
                          }
                        },
                        itemCount: 30,
                      ),
                    ),
                  ],
                ),
                Center(
                  child: state.isLoading ? _loadingWidget() : Container(),
                )
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _loadingWidget() {
    return FittedBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          'Model Running...',
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
