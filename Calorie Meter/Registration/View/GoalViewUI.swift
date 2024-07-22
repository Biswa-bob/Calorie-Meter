//
//  GoalViewUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 27/06/24.
//

import SwiftUI

struct GoalViewUI: View {
    @State private var selectedId: Goal? = nil
    @State private var isNext = false
    @ObservedObject var viewModel: RegistrationViewModel
    
    let cards:[String:Goal] = [
        
        "Lose Weight": .lose,
        "Keep Weight": .keep,
        "Gain Weight": .gain,
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("What's your goal?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("We will calculate daily calories according to your goal")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                    Spacer()
                    
                    ForEach(cards.keys.sorted(), id: \.self){ label in
                        let identifier = cards[label]!
                        CardView(isSelected: Binding(get: {
                            selectedId == identifier
                        }, set: { newValue in
                            if newValue {
                                selectedId = identifier
                                viewModel.registrationData.goal = identifier
                            } else {
                                selectedId = nil
                            }
                        }), lable: label)
                        
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink{
                            GenderView(viewModel: viewModel)
                        } label:{
                            FloatingNavButtonUI()
                        }
                      
                    }
                    
                }
            }
         
            .navigationBarBackButtonHidden(true)

        }
    }
}



#Preview {
    GoalViewUI(viewModel: RegistrationViewModel())
}
