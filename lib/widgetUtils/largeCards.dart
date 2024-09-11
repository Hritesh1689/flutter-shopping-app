import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_flutter_demo/database/dao.dart';
import 'package:velocity_x/velocity_x.dart';

import '../models/cartItem.dart';
import '../models/normalCardInfo.dart';
import '../utils.dart';

class LargeCard extends StatefulWidget {
  final NormalCardInfo normalCardInfo;
  final bool toShowFav;
  final bool toShowOrderBotton;
  final VoidCallback addCallback;
  final VoidCallback removeCallback;
  final TextEditingController? controller;

  const LargeCard({super.key, required this.normalCardInfo, required this.toShowFav, required this.toShowOrderBotton, required this.controller, required this.addCallback, required this.removeCallback});

  @override
  State<LargeCard> createState() => _LargeCardState();
}

class _LargeCardState extends State<LargeCard> {

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.antiAlias,
      children: [
        Card.outlined(
          color: Colors.grey[300],
          child: ImageTextCard(normalCardInfo: widget.normalCardInfo, toShowFavourite: widget.toShowFav, toShowOrderButton: widget.toShowOrderBotton, controller: widget.controller, addCallback: widget.addCallback, removeCallback: widget.removeCallback,),
        ),
      ],
    );
  }
}

class ImageTextCard extends StatefulWidget {
  final NormalCardInfo normalCardInfo;
  final bool toShowFavourite;
  final bool toShowOrderButton;
  final VoidCallback addCallback;
  final VoidCallback removeCallback;
  final TextEditingController? controller;

  const ImageTextCard({super.key, required this.normalCardInfo, required this.toShowFavourite, required this.toShowOrderButton, required this.controller, required this.addCallback, required this.removeCallback});

  @override
  State<ImageTextCard> createState() => _ImageTextCardState();
}

class _ImageTextCardState extends State<ImageTextCard> {

  @override
  Widget build(BuildContext context) {
    DatabaseDao dbDao = DatabaseDao();
    final ValueNotifier<bool> toShowFavIconPressed = ValueNotifier<bool>(widget.normalCardInfo.isFavourite);

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 152,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Stack(
                    children: [
                      // Placeholder image shown while the network image loads
                      Center(child: Icon(Icons.download_for_offline, size: 36, color: Colors.amber[300])),
                      Image.network(
                        widget.normalCardInfo.imgUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
                        loadingBuilder: (context, child, progress) {
                          if (progress == null) {
                            return child;
                          } else {
                            final percentage = (progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)) * 100;
                            return Center(
                              child: SizedBox(
                                width: double.infinity,
                                height: 100,
                                child: Stack(
                                  alignment: Alignment.center,
                                  children: [
                                    CircularProgressIndicator(
                                      color: Colors.green,
                                      value: progress.expectedTotalBytes != null
                                          ? progress.cumulativeBytesLoaded / (progress.expectedTotalBytes ?? 1)
                                          : null,
                                    ),
                                    Text(
                                      '${percentage.toStringAsFixed(0)}%',
                                      style: const TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 8,
                                      ),
                                    ),
                                  ],
                                ).pSymmetric(h: 4, v: 2),
                              ),
                            );
                          }
                        },
                        errorBuilder: (context, error, stackTrace) {
                          return Center(child: Icon(Icons.dnd_forwardslash, size: 36, color: Colors.amber[300]));
                        },
                      ),
                      Visibility(
                        visible: widget.toShowFavourite,
                        child: ValueListenableBuilder(
                            valueListenable: toShowFavIconPressed,
                            builder: (context, v, child) {
                              return IconButton(
                                alignment: Alignment.topRight,
                                icon: Icon(Icons.favorite,
                                  color: (toShowFavIconPressed.value ? Colors
                                      .red : Colors.grey),),
                                onPressed: () {
                                  toShowFavIconPressed.value =
                                  !toShowFavIconPressed.value;
                                  dbDao.markItemFavourite(
                                      widget.normalCardInfo.info[0],
                                      !widget.normalCardInfo.isFavourite);
                                },
                              );
                            }),
                      )
                    ],
                  )
              ),
            ),
            Column(
              children: List.generate(min(widget.normalCardInfo.info.length,2), (index) => Text(widget.normalCardInfo.info[index], style: const TextStyle(color: Colors.black, fontSize: 18),)),
            ),
            Visibility(
              visible: widget.toShowOrderButton,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 30,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey, width: 1),
                  borderRadius:
                  BorderRadius.circular(6),
                ),
                child: Row(
                  mainAxisAlignment:
                  MainAxisAlignment
                      .spaceBetween,
                  children: [
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(
                            Icons.remove,
                            size: 14,
                            color: Colors.black),
                        onPressed: () => widget.removeCallback(),
                      ),
                    ),
                    SizedBox(
                      width: 30,
                      child: TextField(
                        controller: widget.controller,
                        textAlign: TextAlign.center,
                        inputFormatters: [
                          FilteringTextInputFormatter
                              .digitsOnly,
                        ],
                        enabled: false,
                        maxLines: 1,
                        keyboardType:
                        TextInputType.number,
                        decoration:
                        const InputDecoration(
                          border:
                          OutlineInputBorder(),
                          contentPadding:EdgeInsets.all(0),
                          enabledBorder:
                          OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey),
                          ),
                          focusedBorder:
                          OutlineInputBorder(
                            borderSide: BorderSide(
                                color: Colors.grey),
                          ),
                        ),
                        style: const TextStyle(
                          fontSize: 12,
                          // Set your desired font size here
                          color: Colors.black,
                        ),
                        cursorColor: Colors
                            .grey, // Prevents any interactions with the TextField
                      ).p(2),
                    ),
                    Expanded(
                      flex: 1,
                      child: IconButton(
                        icon: const Icon(Icons.add,
                            size: 14,
                            color: Colors.black),
                        onPressed: () => widget.addCallback(),
                      ),
                    )
                  ],
                ),
              ).pSymmetric(h: 4, v: 8),
            )
          ],
        ).pSymmetric(h: 4, v: 2),
      ],
    );
  }
}