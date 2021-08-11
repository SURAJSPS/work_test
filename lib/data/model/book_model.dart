

class BookModel {
    BookModel({
        this.id,
        this.title,
        this.authors,
        this.translators,
        this.subjects,
        this.bookshelves,
        this.languages,
        this.copyright,
        this.mediaType,
        this.formats,
        this.downloadCount,
    });

    int? id;
    String? title;
    List<Author>? authors;
    List<dynamic>? translators;
    List<String>? subjects;
    List<String>? bookshelves;
    List<String>? languages;
    bool? copyright;
    String? mediaType;
    Formats? formats;
    int? downloadCount;

    factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        id: json["id"],
        title: json["title"],
        authors: List<Author>.from(json["authors"].map((x) => Author.fromJson(x))),
        translators: List<dynamic>.from(json["translators"].map((x) => x)),
        subjects: List<String>.from(json["subjects"].map((x) => x)),
        bookshelves: List<String>.from(json["bookshelves"].map((x) => x)),
        languages: List<String>.from(json["languages"].map((x) => x)),
        copyright: json["copyright"],
        mediaType: json["media_type"],
        formats: Formats.fromJson(json["formats"]),
        downloadCount: json["download_count"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "authors": List<dynamic>.from(authors!.map((x) => x.toJson())),
        "translators": List<dynamic>.from(translators!.map((x) => x)),
        "subjects": List<dynamic>.from(subjects!.map((x) => x)),
        "bookshelves": List<dynamic>.from(bookshelves!.map((x) => x)),
        "languages": List<dynamic>.from(languages!.map((x) => x)),
        "copyright": copyright,
        "media_type": mediaType,
        "formats": formats!.toJson(),
        "download_count": downloadCount,
    };
}

class Author {
    Author({
        this.name,
        this.birthYear,
        this.deathYear,
    });

    String? name;
    int? birthYear;
    int? deathYear;

    factory Author.fromJson(Map<String, dynamic> json) => Author(
        name: json["name"],
        birthYear: json["birth_year"],
        deathYear: json["death_year"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "birth_year": birthYear,
        "death_year": deathYear,
    };
}

class Formats {
    Formats({
        this.imageJpeg,
        this.applicationEpubZip,
        this.applicationRdfXml,
        this.textHtmlCharsetUtf8,
        this.applicationXMobipocketEbook,
        this.applicationZip,
        this.textPlainCharsetUtf8,
    });

    String? imageJpeg;
    String? applicationEpubZip;
    String? applicationRdfXml;
    String? textHtmlCharsetUtf8;
    String? applicationXMobipocketEbook;
    String? applicationZip;
    String? textPlainCharsetUtf8;

    factory Formats.fromJson(Map<String, dynamic> json) => Formats(
        imageJpeg: json["image/jpeg"],
        applicationEpubZip: json["application/epub+zip"],
        applicationRdfXml: json["application/rdf+xml"],
        textHtmlCharsetUtf8: json["text/html; charset=utf-8"],
        applicationXMobipocketEbook: json["application/x-mobipocket-ebook"],
        applicationZip: json["application/zip"],
        textPlainCharsetUtf8: json["text/plain; charset=utf-8"],
    );

    Map<String, dynamic> toJson() => {
        "image/jpeg": imageJpeg,
        "application/epub+zip": applicationEpubZip,
        "application/rdf+xml": applicationRdfXml,
        "text/html; charset=utf-8": textHtmlCharsetUtf8,
        "application/x-mobipocket-ebook": applicationXMobipocketEbook,
        "application/zip": applicationZip,
        "text/plain; charset=utf-8": textPlainCharsetUtf8,
    };
}
