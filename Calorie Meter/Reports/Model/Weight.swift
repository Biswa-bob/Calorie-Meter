//
//  Weight.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 30/06/24.
//

import Foundation

struct WeightData: Identifiable,Hashable {
    let id = UUID()
    let date: Date
    let weight: Double

    init(year: Int, month: Int, day: Int, weight: Double) {
        self.date = Calendar.current.date(from: .init(year: year, month: month, day: day)) ?? Date()
        self.weight = weight
    }
}
