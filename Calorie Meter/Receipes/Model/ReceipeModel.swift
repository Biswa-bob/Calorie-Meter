//
//  ReceipeModel.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 12/07/24.
//

import Foundation

struct ReceipeModel: Codable,Hashable {
    let count:Int
    let hits: [Receipes]
}

struct Receipes: Codable ,Hashable{
    let recipe:ReceipeObject
}

struct ReceipeObject:Codable,Hashable{
    let uri:String
    let label:String
    let images:Images
    let url:String
    let ingredientLines:[String]
    let totalNutrients: NutrientList
    let totalTime: Int
}

struct Images: Codable ,Hashable{
    let SMALL: ImageObject
}

struct ImageObject: Codable, Hashable {
    let url:String
    let width:Int
    let height:Int
}

struct Calories: Codable,Hashable {
    let ENERC_KCAL: Energy
}

struct Energy: Codable,Hashable {
    let label:String
    let quantity:Double
    let unit:String
}
struct NutrientList: Codable,Hashable{
    let ENERC_KCAL: Nutrients
    let FAT: Nutrients
    let CHOCDF: Nutrients
    let PROCNT: Nutrients
}
struct Nutrients: Codable,Hashable {
    let label:String
    let quantity:Double
    let unit:String
}
