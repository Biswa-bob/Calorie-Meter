//
//  Tab.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 30/06/24.
//

import Foundation

enum Tab:String,CaseIterable{
    case receipes = "Receipes"
    case diary = "Diary"
    case reports = "Reports"
    
    var systemImage: String{
        switch self{
        case .receipes:
            return "book"
        case .diary:
            return "clock"
        case .reports:
            return "chart.line.uptrend.xyaxis"
        }
    }
    
    var index:Int{
        return Tab.allCases.firstIndex(of: self) ?? 0
    }
}
