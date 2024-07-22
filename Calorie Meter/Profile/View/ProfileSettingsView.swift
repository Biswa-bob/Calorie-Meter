//
//  ProfileSettingsView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 01/07/24.
//

import SwiftUI

struct ProfileSettingsView: View {
    @State private var isWeightActivity = false
    @State private var isAge = false
    @State private var isHeight = false
    @State private var isWeight = false
    @State private var isSex = false
    @State private var isLifeStyle = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack{
            HStack{
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "chevron.left")
                      
                })
                .foregroundColor(Color("OnBackground"))
                
         
                  Spacer()
                Text("Me")
                    .font(.title2)
                    .bold()
                    .foregroundColor(Color("OnBackground"))
                Spacer()
                   
            }
            .padding(.bottom,30)
            .padding(.leading)
            VStack{
                SettingsCard(name: "Goal", value: "Gain Weight",isSheetOpen: $isWeightActivity)
                SettingsCard(name: "Age", value: "17 years",isSheetOpen: $isAge)
                SettingsCard(name: "Height", value: "185 cm",isSheetOpen: $isHeight)
                SettingsCard(name: "Weight", value: "84 kg",isSheetOpen: $isWeight)
                SettingsCard(name: "Sex", value: "Male",isSheetOpen: $isSex)
                SettingsCard(name: "Lifestyle", value: "Active",isSheetOpen: $isLifeStyle)
            }
            Spacer()
            PrimaryButtonUI(btnLable: "Save")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)
        }
    }
    
}

#Preview {
    ProfileSettingsView()
}

struct SettingsCard: View {
    let name:String
    let value:String
    @Binding var isSheetOpen:Bool
    var body: some View {
        VStack{
            HStack{
                Text(name)
                    .font(.title2)
                    .foregroundColor(Color("OnBackground"))
                Spacer()
                Button(action:{
                    self.isSheetOpen.toggle()
                },label:{
                    Text(value)
                        .foregroundColor(Color("Primary"))
                })
                .sheet(isPresented: $isSheetOpen) {
                    VStack{
                        switch name{
                            case "Goal":
                                GoalSettingsView()
                            case "Age":
                                AgeViewSettings()
                            case "Height":
                                HeightViewSettings()
                            case "Weight":
                                WeightViewSettings()
                            default:
                                Text("Nothing to show")
                        }
                    }
                        .presentationDetents([.medium, .large])
                }
            }
            .padding(.horizontal)
            Rectangle()
                .frame(width: .infinity, height: 1)
                .foregroundColor(Color("OnBackgroundVariant"))
        }.padding(.top)
    }
}
