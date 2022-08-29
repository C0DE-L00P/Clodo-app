import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class PageRecyclerBin extends StatelessWidget {
  const PageRecyclerBin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children: [
            // Expanded(
            //   flex: 1,
              ListView.builder(
                itemCount: 5,
                itemBuilder: ((context, index) => Container(height: 200,margin: EdgeInsets.all(8),color: Colors.amber,)),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                
              ),
            // ),
            // Expanded(
            //   flex: 1,
             Column(
                children: [
                  Container(height:200,color: Colors.amber,),
                  Container(height:200,color: Colors.green,),
                  Container(height:200,color: Colors.blue,),
                  Container(height:200,color: Colors.red,),
                  Container(height:200,color: Colors.black54,),
                ],
              ),
            // ),
          ],
        ),
    );
  }
}
