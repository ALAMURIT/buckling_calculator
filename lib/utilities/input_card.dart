import 'package:flutter/material.dart';
class inputCard extends StatelessWidget {
  final String captionText, labelText;
  final TextEditingController inputCardController;
  inputCard({
    super.key,
    required this.captionText,
    required this.labelText,
    required this.inputCardController,
    });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                              // color: Colors.red,
                              width: 512,
                              height: 64,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text('$captionText'),
                                  Container(
                                    color: Colors.white,
                                    height: 50,
                                    width: 250,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('$labelText'),
                                      ),
                                      controller: inputCardController,
                                    ),
                                  )
                                ],
                              ),
                            );
  }
}