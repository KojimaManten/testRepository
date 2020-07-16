//
//  FetchQiitaArticleRequest.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/09.
//  Copyright © 2020 Manchen. All rights reserved.
//

import APIKit

struct FetchQiitaArticleRequest: QiitaAPI {
    var baseURL: URL
    
    
    typealias Response = [Article]
    
    var method: HTTPMethod {
        return .get
    }
    
    var path: String {
        return "/items"
    }
}
