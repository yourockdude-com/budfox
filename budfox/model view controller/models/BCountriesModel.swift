//
//  BCountriesModel.swift
//  budfox
//
//  Created by Vladimir Psyukalov on 18.09.17.
//  Copyright © 2017 YOUROCK INC. All rights reserved.
//


import UIKit


class BCountriesModel: NSObject {
    
    static let sharedModel = BCountriesModel()
    
    var countries: [BCountry]?
    
    // TODO: Asynch load countries list from server
    
    func load(completion: @escaping (_ success: Bool) -> Void) {
        
        if countries == nil {
            countries = []
        }
        countries?.removeAll()
        
        // Fake loading
        let usa = BCountry("United States", "+1")
        let russia = BCountry("Russian Federation", "+7")
        countries?.append(usa)
        countries?.append(russia)
        
        DispatchQueue.main.async {
            completion(true)
        }
        
    }
    
}

class BCountry: NSObject {
    
    let name: String
    let code: String
    
    required init(_ name: String, _ code: String) {
        self.name = name
        self.code = code
    }
    
}
