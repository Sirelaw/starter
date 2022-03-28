//
//  ViewModel.swift
//  starter
//
//  Created by Olawale Ipadeola on 3/28/22.
//

import Foundation

class ViewModel {
    var technologies: [Technology]?
    
    init() {
//        let unwrapped = technologies! // Forced unwrapping. Don't do this
//        guard let safe = technologies else {return}
//        safe.........
//        if let safe2 = technologies{
//
//        } else {
//
//        }
//        let safe3 = technologies ?? [] // unwrap but store the default value of [] if nil
        
        technologies = DecodeHelper.load("Technology.json")
        
    }
    
    func itemAt(_ index: Int) -> Technology? {
        guard let items = technologies else {return nil}
        return items[index]
    }
}
