//
//  ProfileView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 01/07/24.
//

import SwiftUI

struct ProfileView: View {
    @State private var isDarkMode = true
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var body: some View {
        NavigationStack{
            VStack{
                HStack{
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Image(systemName: "chevron.left")
                          
                    })
                    .foregroundColor(Color("OnBackground"))
                    
             
                      Spacer()
                        .frame(width: 130)
                    Text("Profile")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("OnBackground"))
                    Spacer()
                       
                }
                .padding(.bottom,30)
                .padding(.top,10)
                .padding(.leading)
                VStack(spacing: 20){
                    Image("demo")
                        .resizable()
                        .frame(width: 90,height: 90)
                    VStack{
                        Text("Bob")
                            .font(.title2)
                            .foregroundColor(Color("OnBackground"))
                            .bold()
                        Text("bob.panda@gmail.com")
                            .font(.title3)
                            .foregroundColor(Color("secondary"))
                            .bold()
                    }
                }
                VStack{
                    NavigationLink{
                        ProfileSettingsView()
                    } label:{
                        ZStack{
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color("SurfacePrimary"))
                                .frame(width: 360,height: 50)
                            HStack{
                                Text("Me")
                                    .bold()
                                    .foregroundColor(Color("Primary"))
                                Spacer()
                                Image(systemName: "chevron.right")
                                    .foregroundColor(Color("Primary"))
                            }.padding(.horizontal)
                        }
                    }
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color("SurfacePrimary"))
                            .frame(width: 360,height: 50)
                        HStack{
                            Text("Calorie Intake")
                                .bold()
                            Spacer()
                            Text("3600 Cal")
                                .bold()
                            .foregroundColor(Color("Primary"))
                        }
                        .padding(.horizontal)
                    }
                    
                    ZStack{
                        Rectangle()
                            .cornerRadius(10)
                            .foregroundColor(Color("SurfacePrimary"))
                            .frame(width: 360,height: 50)
                        HStack{
                            Text("Weight Unit")
                                .bold()
                            Spacer()
                            Text("Kilograms")
                                .bold()
                            .foregroundColor(Color("Primary"))
                        }
                        .padding(.horizontal)
                    }
                }
                .padding()
                
                Rectangle()
                    .frame(width: .infinity,height: 1)
                    .foregroundColor(Color("OnBackgroundVariant"))
                
                VStack(spacing: 40){
                   
                    HStack(spacing: 15){
                        Image(systemName: "circle.lefthalf.filled")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("Dark Theme")
                            .font(.title2)
                            
                        Spacer()
                        Toggle(isOn: $isDarkMode) {
                        }
                    }.foregroundColor(Color("OnBackground"))
                    HStack(spacing: 15){
                        Image(systemName: "envelope")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("Contact us")
                            .font(.title2)
                        Spacer()
                    }.foregroundColor(Color("OnBackground"))
                    HStack(spacing: 15){
                        Image(systemName: "info.circle")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("About app")
                            .font(.title2)
                        Spacer()
                    }.foregroundColor(Color("OnBackground"))
                    HStack(spacing: 15){
                        Image(systemName: "gearshape")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("Settings")
                            .font(.title2)
                        Spacer()
                    }.foregroundColor(Color("OnBackground"))
                    HStack(spacing: 15){
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .frame(width: 24,height: 24)
                        Text("Logout")
                            .font(.title2)
                        Spacer()
                    }.foregroundColor(.red)
                }.padding()
                Spacer()
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ProfileView()
}
