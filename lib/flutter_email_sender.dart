import 'dart:async';

import 'package:flutter/services.dart';

class FlutterEmailSender {
  static const MethodChannel _channel =
      const MethodChannel('flutter_email_sender');

  static Future<void> send(Email mail) {
    return _channel.invokeMethod('send', mail.toJson());
  }
}

class Email {
  final String subject;
  final List<String> recipients;
  final List<String> cc;
  final List<String> bcc;
  final String body;
  final String attachmentPath;
  final List<String> attachmentPaths;
  Email({
    this.subject = '',
    this.recipients = const [],
    this.cc = const [],
    this.bcc = const [],
    this.body = '',
    this.attachmentPath,
    this.attachmentPaths,
  });

  Map<String, dynamic> toJson() {
    var map = {
      'subject': subject,
      'body': body,
      'recipients': recipients,
      'cc': cc,
      'bcc': bcc,
      'attachment_path': attachmentPath
    };

    if (attachmentPaths != null) {
      map['attachment_paths'] = attachmentPaths;
    }

    return map;
  }
}
