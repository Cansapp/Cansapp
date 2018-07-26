//
//  SatPositions.swift
//  Cansapp
//
//  Created by Fernando Razon on 7/25/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation

struct SatPositions: Decodable {
    let info: SatInfo
    let positions: [Positions]
    
    enum CodingKeys: String, CodingKey {
        case info = "info"
        case positions = "positions"
    }
}

struct SatInfo: Decodable {
    let satname: String
    let satid: Int
    let transactionscount: Int
    
    enum CodingKeys: String, CodingKey {
        case satname = "satname"
        case satid = "satid"
        case transactionscount = "transactionscount"
    }
}

struct Positions: Decodable {
    let satlatitude: Float
    let satlongitude: Float
    let azimuth: Float
    let elevation: Float
    let ra: Float
    let dec: Float
    let timestamp: Int
}



