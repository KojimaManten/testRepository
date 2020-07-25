//
//  FetchQiitaArticleRequest.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/09.
//  Copyright © 2020 Manchen. All rights reserved.
//

//記事一覧を取得するリクエスト定義！！！

import APIKit

struct FetchQiitaArticleRequest: QiitaAPI {
    var baseURL: URL
    
    //レスポンスを[Article]型に流し込む
    typealias Response = [Article]
    //HTTPメソッド指定
    var method: HTTPMethod {
        return .get
    }
    //パス指定
    var path: String {
        return "/items"
    }
    
    var queryParameters: [String : Any]? {
        guard let query = query else { return nil }
        return ["query": "title: \(query)"]
    }
    
    var query: String?
}
