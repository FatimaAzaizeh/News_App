abstract class Failures {
  final String? message;
  const Failures({this.message});
}

class FetchFailure extends Failures {
  const FetchFailure({String? message}) : super(message: message);
}
