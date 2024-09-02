import 'package:article_test/features/articles/domain/entities/article.dart';

class ArticlesDto {
  Exhaustive? exhaustive;
  bool? exhaustiveNbHits;
  bool? exhaustiveTypo;
  List<Hits>? hits;
  int? hitsPerPage;
  int? nbHits;
  int? nbPages;
  int? page;
  String? params;
  int? processingTimeMS;
  ProcessingTimingsMS? processingTimingsMS;
  String? query;
  int? serverTimeMS;

  ArticlesDto({
    this.exhaustive,
    this.exhaustiveNbHits,
    this.exhaustiveTypo,
    this.hits,
    this.hitsPerPage,
    this.nbHits,
    this.nbPages,
    this.page,
    this.params,
    this.processingTimeMS,
    this.processingTimingsMS,
    this.query,
    this.serverTimeMS,
  });

  ArticlesDto.fromJson(Map<String, dynamic> json) {
    exhaustive = json['exhaustive'] != null ? Exhaustive.fromJson(json['exhaustive']) : null;
    exhaustiveNbHits = json['exhaustiveNbHits'];
    exhaustiveTypo = json['exhaustiveTypo'];
    if (json['hits'] != null) {
      hits = (json['hits'] as List).map((v) => Hits.fromJson(v)).toList();
    }
    hitsPerPage = json['hitsPerPage'];
    nbHits = json['nbHits'];
    nbPages = json['nbPages'];
    page = json['page'];
    params = json['params'];
    processingTimeMS = json['processingTimeMS'];
    processingTimingsMS = json['processingTimingsMS'] != null ? ProcessingTimingsMS.fromJson(json['processingTimingsMS']) : null;
    query = json['query'];
    serverTimeMS = json['serverTimeMS'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (exhaustive != null) {
      data['exhaustive'] = exhaustive!.toJson();
    }
    data['exhaustiveNbHits'] = exhaustiveNbHits;
    data['exhaustiveTypo'] = exhaustiveTypo;
    if (hits != null) {
      data['hits'] = hits!.map((v) => v.toJson()).toList();
    }
    data['hitsPerPage'] = hitsPerPage;
    data['nbHits'] = nbHits;
    data['nbPages'] = nbPages;
    data['page'] = page;
    data['params'] = params;
    data['processingTimeMS'] = processingTimeMS;
    if (processingTimingsMS != null) {
      data['processingTimingsMS'] = processingTimingsMS!.toJson();
    }
    data['query'] = query;
    data['serverTimeMS'] = serverTimeMS;
    return data;
  }

  List<Article> toArticles() {
    if (hits == null) {
      return [];
    }
    return hits!.map((hit) {
      return Article(
        title: hit.storyTitle ?? '',
        author: hit.author ?? '',
        createdAt: DateTime.tryParse(hit.createdAt ?? '') ?? DateTime.now(),
      );
    }).toList();
  }
}

class Exhaustive {
  bool? nbHits;
  bool? typo;

  Exhaustive({this.nbHits, this.typo});

  Exhaustive.fromJson(Map<String, dynamic> json) {
    nbHits = json['nbHits'];
    typo = json['typo'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['nbHits'] = nbHits;
    data['typo'] = typo;
    return data;
  }
}

class Hits {
  HighlightResult? hHighlightResult;
  List<String>? lTags;
  String? author;
  String? commentText;
  String? createdAt;
  int? createdAtI;
  String? objectID;
  int? parentId;
  int? storyId;
  String? storyTitle;
  String? storyUrl;
  String? updatedAt;
  List<int>? children;
  int? numComments;
  int? points;
  String? title;
  String? url;

  Hits({
    this.hHighlightResult,
    this.lTags,
    this.author,
    this.commentText,
    this.createdAt,
    this.createdAtI,
    this.objectID,
    this.parentId,
    this.storyId,
    this.storyTitle,
    this.storyUrl,
    this.updatedAt,
    this.children,
    this.numComments,
    this.points,
    this.title,
    this.url,
  });

  Hits.fromJson(Map<String, dynamic> json) {
    hHighlightResult = json['_highlightResult'] != null ? HighlightResult.fromJson(json['_highlightResult']) : null;
    lTags = (json['_tags'] as List?)?.cast<String>();
    author = json['author'];
    commentText = json['comment_text'];
    createdAt = json['created_at'];
    createdAtI = json['created_at_i'];
    objectID = json['objectID'];
    parentId = json['parent_id'];
    storyId = json['story_id'];
    storyTitle = json['story_title'];
    storyUrl = json['story_url'];
    updatedAt = json['updated_at'];
    children = (json['children'] as List?)?.cast<int>();
    numComments = json['num_comments'];
    points = json['points'];
    title = json['title'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (hHighlightResult != null) {
      data['_highlightResult'] = hHighlightResult!.toJson();
    }
    data['_tags'] = lTags;
    data['author'] = author;
    data['comment_text'] = commentText;
    data['created_at'] = createdAt;
    data['created_at_i'] = createdAtI;
    data['objectID'] = objectID;
    data['parent_id'] = parentId;
    data['story_id'] = storyId;
    data['story_title'] = storyTitle;
    data['story_url'] = storyUrl;
    data['updated_at'] = updatedAt;
    data['children'] = children;
    data['num_comments'] = numComments;
    data['points'] = points;
    data['title'] = title;
    data['url'] = url;
    return data;
  }
}

class HighlightResult {
  Author? author;
  CommentText? commentText;
  CommentText? storyTitle;
  CommentText? storyUrl;
  CommentText? title;
  CommentText? url;

  HighlightResult({
    this.author,
    this.commentText,
    this.storyTitle,
    this.storyUrl,
    this.title,
    this.url,
  });

  HighlightResult.fromJson(Map<String, dynamic> json) {
    author = json['author'] != null ? Author.fromJson(json['author']) : null;
    commentText = json['comment_text'] != null ? CommentText.fromJson(json['comment_text']) : null;
    storyTitle = json['story_title'] != null ? CommentText.fromJson(json['story_title']) : null;
    storyUrl = json['story_url'] != null ? CommentText.fromJson(json['story_url']) : null;
    title = json['title'] != null ? CommentText.fromJson(json['title']) : null;
    url = json['url'] != null ? CommentText.fromJson(json['url']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (author != null) {
      data['author'] = author!.toJson();
    }
    if (commentText != null) {
      data['comment_text'] = commentText!.toJson();
    }
    if (storyTitle != null) {
      data['story_title'] = storyTitle!.toJson();
    }
    if (storyUrl != null) {
      data['story_url'] = storyUrl!.toJson();
    }
    if (title != null) {
      data['title'] = title!.toJson();
    }
    if (url != null) {
      data['url'] = url!.toJson();
    }
    return data;
  }
}

class Author {
  String? matchLevel;
  List<String>? matchedWords;
  String? value;

  Author({this.matchLevel, this.matchedWords, this.value});

  Author.fromJson(Map<String, dynamic> json) {
    matchLevel = json['matchLevel'];
    matchedWords = (json['matchedWords'] as List?)?.cast<String>();
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['matchLevel'] = matchLevel;
    data['matchedWords'] = matchedWords;
    data['value'] = value;
    return data;
  }
}

class CommentText {
  bool? fullyHighlighted;
  String? matchLevel;
  List<String>? matchedWords;
  String? value;

  CommentText({this.fullyHighlighted, this.matchLevel, this.matchedWords, this.value});

  CommentText.fromJson(Map<String, dynamic> json) {
    fullyHighlighted = json['fullyHighlighted'];
    matchLevel = json['matchLevel'];
    matchedWords = (json['matchedWords'] as List?)?.cast<String>();
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fullyHighlighted'] = fullyHighlighted;
    data['matchLevel'] = matchLevel;
    data['matchedWords'] = matchedWords;
    data['value'] = value;
    return data;
  }
}

class ProcessingTimingsMS {
  int? total;

  ProcessingTimingsMS({this.total});

  ProcessingTimingsMS.fromJson(Map<String, dynamic> json) {
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['total'] = total;
    return data;
  }
}

class Request {
  String? indexName;
  String? params;

  Request({this.indexName, this.params});

  Request.fromJson(Map<String, dynamic> json) {
    indexName = json['indexName'];
    params = json['params'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['indexName'] = indexName;
    data['params'] = params;
    return data;
  }
}

class AfterFetch {
  Format? format;
  Fetch? fetch;

  AfterFetch({this.format, this.fetch});

  AfterFetch.fromJson(Map<String, dynamic> json) {
    format = json['format'] != null ? Format.fromJson(json['format']) : null;
    fetch = json['fetch'] != null ? Fetch.fromJson(json['fetch']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    if (format != null) {
      data['format'] = format!.toJson();
    }
    if (fetch != null) {
      data['fetch'] = fetch!.toJson();
    }
    return data;
  }
}

class Format {
  int? length;
  int? numberOfChunks;

  Format({this.length, this.numberOfChunks});

  Format.fromJson(Map<String, dynamic> json) {
    length = json['length'];
    numberOfChunks = json['numberOfChunks'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['length'] = length;
    data['numberOfChunks'] = numberOfChunks;
    return data;
  }
}

class Fetch {
  String? content;

  Fetch({this.content});

  Fetch.fromJson(Map<String, dynamic> json) {
    content = json['content'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['content'] = content;
    return data;
  }
}
