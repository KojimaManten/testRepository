//
//  Decodable.DataPaser.swift
//  MakeTableView
//
//  Created by 小島満天 on 2020/07/16.
//  Copyright © 2020 Manchen. All rights reserved.
//

import Foundation
import APIKit


class DecodableDataParser: APIKit.DataParser {
    var contentType: String? {
        return "application/json"
    }

    func parse(data: Data) throws -> Any {
        return data
    }
}
