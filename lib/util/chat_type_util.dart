import 'package:flutter/material.dart';
import 'package:flutter_chat_types/flutter_chat_types.dart';
import 'package:intl/intl.dart';

class ChatTypeUtil {
  static Widget messageSubtitle(Message? message) {
    if (message == null) return const Text("");
    if (message.type == MessageType.text) {
      return Text(
        (message as TextMessage).text,
        maxLines: 2,
      );
    } else {
      return const Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.image, size: 15),
          SizedBox(width: 5),
          Text("Photo")
        ],
      );
    }
  }

  static String getLastUpdatedDate(Message? message) {
    switch (message?.type) {
      case null:
        return "";
      case MessageType.audio:
      case MessageType.custom:
      case MessageType.file:
      case MessageType.image:
        final msg = message as ImageMessage;
        return formatIntDate(msg.updatedAt);
      case MessageType.system:
      case MessageType.text:
        final msg = message as TextMessage;
        return formatIntDate(msg.updatedAt);
      case MessageType.unsupported:
      case MessageType.video:
    }
    return "";
  }

  static String formatIntDate(int? time) {
    if (time == null) return "";
    final date = DateTime.fromMillisecondsSinceEpoch(time);
    final now = DateTime.now();
    final differenceInDays = now.difference(date).inDays;

    if (differenceInDays == 0) {
      // Today
      return DateFormat('HH:mm').format(date);
    } else if (differenceInDays <= 7) {
      // This week (including yesterday)
      return '${differenceInDays}d';
    } else if (differenceInDays <= 30) {
      // This month
      return DateFormat('MMM d')
          .format(date); // "MMM" for short month name, "d" for day
    } else {
      // Check if it's a different year
      if (date.year != now.year) {
        return DateFormat('y').format(date); // "y" for year only
      } else {
        return DateFormat('MMM d')
            .format(date); // Fallback to month and day if same year
      }
    }
  }
}
