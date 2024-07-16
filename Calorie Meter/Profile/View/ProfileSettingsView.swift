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
    var body: some View {
        VStack{
            Text("Me")
                .font(.title2)
                .bold()
                .foregroundColor(Color("OnBackground"))
                .padding(.bottom,30)
            VStack{
                SettingsCard(name: "Goal", value: "Gain Weight",isSheetOpen: $isWeightActivity)
                SettingsCard(name: "Age", value: "17 years",isSheetOpen: $isAge)
                SettingsCard(name: "Height", value: "185 cm",isSheetOpen: $isHeight)
                SettingsCard(name: "Weight", value: "84 kg",isSheetOpen: $isWeight)
                SettingsCard(name: "Sex", value: "Male",isSheetOpen: $isSex)
                SettingsCard(name: "Lifestyle", value: "Active",isSheetOpen: $isLifeStyle)
            }
            Spacer()
            PrimaryButtonUI(btnLable: "Done")
        }
    }
    
    @ViewBuilder
    func ageField(_ ageField:Int)-> some View{
        VStack{
            Text("Age")
                .font(.title2)
                .bold()
            HStack{
//                TextField("", text: $age)
                Text("years")
                    .font(.subheadline)
            }
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
                                Text("hello \(name)")
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
