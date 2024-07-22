//
//  RegistrationData.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 21/07/24.
//

import Foundation

enum Gender: String, CaseIterable, Identifiable,Codable {
    case male = "Male"
    case female = "Female"
    case other = "Other"

    var id: String { self.rawValue }
}

enum Goal: String, CaseIterable, Identifiable, Codable {
    case lose = "Lose Weight"
    case gain = "Gain Weight"
    case keep = "Keep Weight"

    var id: String { self.rawValue }
}

enum LifeStyle: String, CaseIterable, Identifiable, Codable {

    case sedentery =  "Sedentery"
    case low =  "Low Active"
    case active = "Active"
    case veryActive = "Very Active"

    var id: String { self.rawValue }
}

struct RegistrationData {
    var name: String = ""
    var email: String = ""
    var password: String = ""
    var goal:Goal = .lose
    var gender: Gender = .male
    var height: String = ""
    var weight: String = ""
    var weight_unit: String = "kg"
    var lifeStyle:LifeStyle = .active
    var age: String = ""
    
    
    func toDictionary() -> [String: Any] {
         return [
             "name": name,
             "email": email,
             "password": password,
             "goal": goal.rawValue,
             "gender": gender.rawValue,
             "height": height,
             "weight": weight,
             "weightUnit": weight_unit,
             "lifeStyle": lifeStyle.rawValue,
             "age": age
         ]
     }
    
    
}
