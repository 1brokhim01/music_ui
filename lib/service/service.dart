class AbdullohData {
    AbdullohData({
        this.branches,
        this.count,
    });

    List<Branch>? branches;
    int? count;

    factory AbdullohData.fromJson(Map<String, dynamic> json) => AbdullohData(
        branches: List<Branch>.from(json["branches"].map((x) => Branch.fromJson(x))),
        count: json["count"],
    );

}

class Branch {
    Branch({
        this.id,
        this.name,
        this.city,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? city;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Branch.fromJson(Map<String, dynamic> json) => Branch(
        id: json["Id"],
        name: json["name"],
        city: json["city"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
    );

}
