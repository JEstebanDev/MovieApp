class WatchProviders {
  final int id;
  final Results? results;

  WatchProviders({required this.id, this.results});

  factory WatchProviders.fromJson(Map<String, dynamic> json) => WatchProviders(
    id: json["id"],
    results: json["results"] != null && json["results"].isNotEmpty
        ? Results.fromJson(json["results"])
        : null, // o Results.empty()
  );
}

class Results {
  final Co? co;

  Results({this.co});

  factory Results.fromJson(Map<String, dynamic> json) =>
      Results(co: json["CO"] != null ? Co.fromJson(json["CO"]) : null);
}

class Co {
  final String link;
  final List<FlatRate> flatRate;

  Co({required this.link, required this.flatRate});

  factory Co.fromJson(Map<String, dynamic> json) => Co(
    link: json["link"],
    flatRate: List<FlatRate>.from(
      json["flatrate"].map((x) => FlatRate.fromJson(x)),
    ),
  );
}

class FlatRate {
  final String logoPath;
  final int providerId;
  final String providerName;
  final int displayPriority;

  FlatRate({
    required this.logoPath,
    required this.providerId,
    required this.providerName,
    required this.displayPriority,
  });

  factory FlatRate.fromJson(Map<String, dynamic> json) => FlatRate(
    logoPath: json["logo_path"],
    providerId: json["provider_id"],
    providerName: json["provider_name"],
    displayPriority: json["display_priority"],
  );
}
