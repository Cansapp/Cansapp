//
//  NyoService.swift
//  Cansapp
//
//  Created by Jaime ISLAS on 23/07/18.
//  Copyright © 2018 d182_fernando_r. All rights reserved.
//

import Foundation
import CoreLocation

class NyoService {
    
    let session: URLSession;
    var urlComponents = URLComponents()
    
    
    static let shared = NyoService(session: URLSession.shared)
    
    init(session: URLSession) {
        self.session = session
        urlComponents.scheme = "https"
        urlComponents.host = "n2yo.com"
        //self.decoder.keyDecodingStrategy = .convertFromSnakeCase
    }
    
    func all(completion: @escaping ((SatPositions) -> Void)){
        urlComponents.path = "/rest/v1/satellite/positions/25544/41.702/-76.014/0/2/&apiKey=DJQMYV-93PEFY-ZVFLHZ-3UW0"
        
        guard let url = urlComponents.url else {
            print("Url not valid")
            return
        }
        
        let task = session.dataTask(with: url) {(data, response, error) in
            guard error == nil else {
                print("Error: \(error!)")
                return
            }
            guard let resp = response as? HTTPURLResponse else {
                return
            }
            
            if resp.statusCode == 200, let json = data {
                do {
                    let jsonResult = try JSONDecoder().decode(SatPositions.self, from: json)
                    print(jsonResult)

                    
//                    if  let jsonResult = jsonResult as? Dictionary<String, AnyObject>{
//                        DispatchQueue.main.async {
//                            let info = jsonResult["info"]
//                            let positions = jsonResult["positions"]
//                            _ = SatPositions(info: info as! SatInfo, positions: positions as! [Positions])
//                        }
//
//                    }
                    
//                    if let positions = try self?.decoder.decode(SatPositions.self, from: json) {
//                        DispatchQueue.main.async {
//                            print(positions)
//                            completion(positions)
//                        }
//                    }
                    
                } catch(let err) {
                    print("Parsing Error: \(err)")
                }
            }
        }
        task.resume()
    }
}
