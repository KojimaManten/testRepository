//
//  Decodable.DataPaser.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/16.
//  Copyright © 2020 Manchen. All rights reserved.
//

//DecodableDataParser


import Foundation
import APIKit


class DecodableDataParser: APIKit.DataParser {
    //データの中身をString?型で返してくれる
    var contentType: String? {
        return "application/json"
    }
    //返ってきたデータをパースしてくれる(プログラムで扱えるようにしてくれる)
    func parse(data: Data) throws -> Any {
        return data
    }
}
