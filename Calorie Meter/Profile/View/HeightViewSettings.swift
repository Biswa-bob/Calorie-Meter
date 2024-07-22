//
//  HeightViewSettings.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 20/07/24.
//

import SwiftUI

struct HeightViewSettings: View {
    let meter = 1...10
    let centi = 1...99
    @State private var selectedMeter = 1
    @State private var selectedCenti = 1
    var body: some View {
        VStack{
            Text("Height")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.bottom,30)
            HStack{
                VStack{
                 
                    Picker("Enter Height",selection: $selectedMeter){
                        ForEach(meter,id: \.self){
                            Text("\($0)")
                        }
                    }
                    .pickerStyle(.wheel)
                   
                }
                Text("m")
                    .foregroundColor(Color("Primary"))
                Picker("Enter Height",selection: $selectedCenti){
                    ForEach(centi,id: \.self){
                        Text("\($0)")
                            .tag("\($0)")
                        
                    }
                }
                .background(Color.clear) // Set background to transparent
                .pickerStyle(.wheel)
                .clipped()
                
                Text("cm")
                    .foregroundColor(Color("Primary"))
            }
            .padding(.horizontal,80)
            Spacer()
                .frame(height: 40)
            
            PrimaryButton(btnLable: "Done",onPressed: {})
            
        }
    }
}

#Preview {
    HeightViewSettings()
}
