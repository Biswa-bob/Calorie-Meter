//
//  Meals.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 29/06/24.
//

import Foundation

struct Meals:Identifiable,Hashable{
    let id = UUID()
    let name:String
    let calorie:String
    let time:String
    
}
