//
//  WeightView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct WeightView: View {
    @State private var weight:String = "10"
    @State private var selectedWeight = "kg"
    @Environment(\.dismiss) private var dismiss
    @State private var isAgeView:Bool = false
    let units = ["kg","lb"]
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("What’s your weight?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("The more you weigh, the more calories your body burns")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.horizontal,50)
                        .padding(.top,20)
                    Spacer()
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
                    HStack {
                        Button(action: {
                            dismiss()
                        }, label: {
                            Text("Back")
                                .padding(.leading)
                                .font(.title3)
                                .foregroundColor(Color("OnBackgroundVariant"))
                        })
                        Spacer()
                        NavigationLink{
                            AgeView()
                        } label:{
                            FloatingNavButtonUI()
                        }
                    }
                }
            }
            .navigationDestination(isPresented: $isAgeView){
                AgeView()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    WeightView()
}
