//
//  WeightViewSettings.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 20/07/24.
//

import SwiftUI

struct WeightViewSettings: View {
    @State private var weight:String = "10"
    @State private var selectedWeight = "kg"
    let units = ["kg","lb"]
    var body: some View {
        VStack{
            Text("Weight")
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .bold()
                .padding(.bottom,40)
            
            HStack(alignment: .center){
                VStack{
                    TextField("", text: $weight)
                        .frame(width: 40)
                        .onChange(of: weight) { newValue in
                             if newValue.count > 4 {
                               weight = String(newValue.prefix(4)) // Truncate to limit
                             }
                           }
                 
                    Rectangle()
                        .frame(width:60, height: 1)
                        .foregroundColor(Color("Primary"))
                }
                
                
                Picker("Enter Height",selection: $selectedWeight){
                    ForEach(units,id: \.self){
                        Text("\($0)")
                            .tag("\($0)")
                            .font(.title)
                           
                        
                    }
                }
                .foregroundColor(Color("Primary"))
                .pickerStyle(.menu)
                
           
            }
            Spacer()
                .frame(height: 100)
            PrimaryButton(btnLable: "Done")
        }
    }
}

#Preview {
    WeightViewSettings()
}
