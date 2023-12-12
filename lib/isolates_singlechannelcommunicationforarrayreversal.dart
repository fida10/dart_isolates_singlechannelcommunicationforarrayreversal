/// Support for doing something awesome.
///
/// More dartdocs go here.
library;

import 'dart:async';
import 'dart:isolate';

export 'src/isolates_singlechannelcommunicationforarrayreversal_base.dart';

/*
Practice Question 3: Single-Channel Communication for Array Reversal

Task:

Write a function reverseArrayInIsolate that reverses an array of integers 
in a separate isolate using single-channel communication. 
The main isolate sends an array to the spawned isolate and receives the reversed array.
 */

reverseArrayInIsolate(List<int> listToReverse) async {
  ReceivePort receivedFromWorker = ReceivePort();
  final completer = Completer();
  Isolate worker = await Isolate.spawn(reverseArrayInIsolateWorker,
      [receivedFromWorker.sendPort, listToReverse]);

  receivedFromWorker.listen((message) {
    if (message is List) {
      completer.complete(message);
      receivedFromWorker.close();
      worker.kill();
    }
  });

  return completer.future;
}

reverseArrayInIsolateWorker(List<dynamic> input) {
  (input[0] as SendPort).send((input[1] as List).reversed.toList());
}
