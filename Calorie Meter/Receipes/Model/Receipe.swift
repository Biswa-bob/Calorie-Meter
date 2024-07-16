//
//  Receipe.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 01/07/24.
//

import Foundation

struct Receipe:Identifiable,Hashable,Codable{
    let id = UUID()
    let name:String
    let calorie:String
    let time:String
}
