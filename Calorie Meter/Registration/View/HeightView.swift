//
//  HeightView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct HeightView: View {
    let meter = 1...10
    let centi = 1...99
    @State private var selectedMeter = 1
    @State private var selectedCenti = 1
    @Environment(\.dismiss) private var dismiss
    @State private var isWeightView:Bool = false
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("How tall are you?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("The taller you are, the more calories your body needs")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.horizontal,50)
                        .padding(.top,5)
                    Spacer()
                    HStack{
                        Picker("Enter Height",selection: $selectedMeter){
                            ForEach(meter,id: \.self){
                                Text("\($0)")
                            }
                        }
                        .pickerStyle(.wheel)
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
                            WeightView(viewModel: viewModel)
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
    HeightView(viewModel: RegistrationViewModel())
}
