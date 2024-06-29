//
//  GoalViewUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 27/06/24.
//

import SwiftUI

struct GoalViewUI: View {
    @State private var selectedId: String? = nil
    @State private var isNext = false
    let cards:[String:String] = [
        
        "Lose Weight": "lose",
        "Keep Weight": "keep",
        "Gain Weight": "gain",
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
                            } else {
                                selectedId = nil
                            }
                        }), lable: label)
                        
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {
                            isNext.toggle()
                        }, label: {
                            Image(systemName: "chevron.right")
                                .frame(width: 77, height: 70)
                                .foregroundColor(Color.black)
                                .padding(.vertical,2)
                               
                        })
                        .background(Color("Primary"))
                        .cornerRadius(38.5)
                        .padding()
                        .shadow(color: Color.black.opacity(0.3),
                                radius: 3,
                                x: 3,
                                y: 3)
                        .navigationDestination(isPresented: $isNext){
                            GenderView()
                        }
                    }
                    
                }
            }
            .navigationBarBackButtonHidden(true)

        }
    }
}



#Preview {
    GoalViewUI()
}
