class ResultResponse<T> {
  final int count;
  final int pages;
  final String nextPage;
  final String previousPage;
  T? data;

  ResultResponse(
      {required this.count,
      required this.pages,
      required this.nextPage,
      required this.previousPage,
      this.data});

  factory ResultResponse.fromJSON(Map json) {
    return ResultResponse(
        count: json["count"],
        pages: json["pages"],
        nextPage: json["next"] ?? "",
        previousPage: json["previous"] ?? "");
  }
}
