//
//  SettingsView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 15/07/24.
//

import SwiftUI

struct SettingsView: View {
    @State private var calorieId: String? = nil
    @State private var timeId: String? = nil
    
    @State var proteinValue = 20.0
    @State var fatValue = 20.0
    @State var carbsValue = 20.0
    @State private var scrollViewContentSize: CGSize = .zero
    
    let calories:[String:String] = [
        "Less than 100":"<100",
        "100-250": "100-250",
        "250-500": "250 - 500",
        "More than 500": ">500"
    ]
    
    let time: [String:String] = [
        "Less than 15 min":"<15 min",
        "15 - 30 min" : "15 - 30",
        "30 - 60 min" : "30-60",
        "More than 60 min" : ">60 min"
    ]
    
    let rows = [
        GridItem(.adaptive(minimum: 70))
    ]
    
    @Environment(\.dismiss) var dismiss
    var body: some View {
        
        ScrollView(.vertical,showsIndicators: false) {
                VStack{
                    VStack{
                        HStack{
                            Text("Calorie Per Serve")
                                .foregroundColor(Color("OnBackground"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal,10)
                        .padding(.top,40)
                        LazyHGrid(rows: rows,spacing: 20) {
                            ForEach(calories.keys.sorted(), id: \.self){ label in
                                let identifier = calories[label]!
                                ChipView(isSelected: Binding(get: {
                                    calorieId == identifier
                                }, set: { newValue in
                                    if newValue {
                                        calorieId = identifier
                                    } else {
                                        calorieId = nil
                                    }
                                }), lable: label)
                                
                            }
                        
                        }
                        .frame(width: 300,height: 200)
                       
                    }
                    VStack{
                        HStack{
                            Text("Total Cooking Time")
                                .foregroundColor(Color("OnBackground"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        LazyHGrid(rows: rows,spacing: 20) {
                            ForEach(time.keys.sorted(), id: \.self){ label in
                                let identifier = time[label]!
                                ChipView(isSelected: Binding(get: {
                                    timeId == identifier
                                }, set: { newValue in
                                    if newValue {
                                        timeId = identifier
                                    } else {
                                        timeId = nil
                                    }
                                }), lable: label)
                                
                            }
                            
                        }
                        .frame(width: 300,height: 200)
                        .padding()
                    }
                    VStack{
                        HStack{
                            Text("Macronutrients")
                                .foregroundColor(Color("OnBackground"))
                                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                .bold()
                            Spacer()
                        }
                        .padding(.horizontal)
                        
                        VStack{
                            Text("Proteins")
                                .font(.title2)
                                .padding(.top)
                            HStack{
                                Text("Min 0%")
                                Slider(value: $proteinValue)
                                Text("Max >50%")
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack{
                            Text("Fats")
                                .font(.title2)
                                .padding(.top)
                            HStack{
                                Text("Min 0%")
                                Slider(value: $fatValue)
                                Text("Max >50%")
                            }
                            .padding(.horizontal)
                        }
                        
                        VStack{
                            Text("Carbohydrates")
                                .font(.title2)
                                .padding(.top)
                            HStack{
                                Text("Min 0%")
                                Slider(value: $carbsValue)
                                Text("Max >50%")
                            }
                            .padding(.horizontal)
                        }
                    }
                    .foregroundColor(Color("OnBackgroundVariant"))
                }
            PrimaryButton(btnLable: "Done",onPressed: {
                dismiss()
            })
                .padding(.top,30)
            }
    }
}

#Preview {
    SettingsView()
}
