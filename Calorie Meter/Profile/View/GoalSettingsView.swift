//
//  GoalSettingsView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 20/07/24.
//

import SwiftUI

struct GoalSettingsView: View {
    @State private var selectedId: String? = nil
    let cards:[String:String] = [
        
        "Lose Weight": "lose",
        "Keep Weight": "keep",
        "Gain Weight": "gain",
    ]
    var body: some View {
        VStack{
            Text("Goal")
                .font(.title)
                .bold()
                .padding(.bottom,20)
            
            ForEach(cards.keys.sorted(), id: \.self){ label in
                let identifier = cards[label]!
                CardView(isSelected: Binding(get: {
                    selectedId == identifier
                }, set: { newValue in
                    if newValue {
                        selectedId = identifier
                    } else {
                        selectedId = nil
                    }
                }), lable: label)
                
            }
            
            PrimaryButton(btnLable: "Done", onPressed: {})
                .padding(.top,40)
            
        }
    }
}

#Preview {
    GoalSettingsView()
}
