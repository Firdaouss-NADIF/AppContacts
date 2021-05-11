import 'package:contacts_app/bloc/Messages/messages.actions.dart';
import 'package:contacts_app/bloc/Messages/messages.bloc.dart';
import 'package:contacts_app/model/messages.model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';

class MessageItemWidget extends StatelessWidget {
  Message message;
  MessageItemWidget(this.message);
  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: message.selected,
      selectedTileColor: Color.fromARGB(255, 236, 229, 221),
      onLongPress: (){
        context.read<MessageBloc>().add(new SelectMessagesEvent(message));
      },
      title: Column(
        children :[
          SizedBox(height: 5,),
          Row(
          mainAxisAlignment: (message.type=='sent')?MainAxisAlignment.start:MainAxisAlignment.end,
          children: [
            Flexible(
              child:Container(
                padding: EdgeInsets.all(20),
                color:(message.type=='sent')? Color.fromARGB(255, 255,255,224):Color.fromARGB(
                    255,240,230,140),
                child:
                  Text('${message.content}  (${message.date.hour}:${message.date.minute})' ),
                foregroundDecoration: BoxDecoration(
                  border: Border.all(color:HexColor("#8FBC8F"),width: 3.0),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0) //         <--- border radius here
                  ),
                ),
              ),
            ),
            (message.type=='sent')?SizedBox(width: 40,):SizedBox(width: 0,)
          ],
        ),
        ],
      ),
    );
  }
}
