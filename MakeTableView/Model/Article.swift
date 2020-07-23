//
//  Article.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/09.
//  Copyright © 2020 Manchen. All rights reserved.
//
import Foundation
//レスポンスのデータ構造の定義！！！

struct Article: Codable {
    let title: String
    let url: String
    let user: User
}

struct User: Codable {
    let name: String
    let profile_image_url: String
}
