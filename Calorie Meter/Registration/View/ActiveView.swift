//
//  ActiveView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct ActiveView: View {
    @State private var selectedId: String? = nil
    let activity:[String:String] = [
        "Sedentery":"sedentery",
        "Low Active": "low",
        "Active" : "active",
        "Very Active" : "very_active",
    ]
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    Text("How active are you?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("A sedentary person burns fewer calories than an active person")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.horizontal,50)
                        .padding(.top,5)
                    Spacer()
                    
                    ForEach(activity.keys.sorted(), id: \.self){ label in
                        let identifier = activity[label]!
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
                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                            Text("Back")
                                .padding(.leading)
                                .font(.title3)
                                .foregroundColor(Color("OnBackgroundVariant"))
                        })
                        Spacer()
                        Button(action: {}, label: {
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
                    }
                }
            }
        }
    }
}

#Preview {
    ActiveView()
}
