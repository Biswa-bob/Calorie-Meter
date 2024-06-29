//
//  HomeViewUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 26/06/24.
//

import SwiftUI

struct WelcomeView: View {
    @State private var showingCredits = false
    @State private var isLogin = false
    @State private var isStart = false
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Image("apple")
                Text("Welcome")
                    .font(.title2)
                    .padding(.top,12)
                    .foregroundColor(Color("OnBackground"))
                    .bold()
                Text("Start or sign in to your account")
                    .font(.subheadline)
                    .foregroundColor(Color("OnBackgroundVariant"))
                Spacer()
                VStack(spacing: 25) {
                    PrimaryButtonUI(btnLable: "Start",onPressed: {
                        isStart.toggle()
                    })
                        .navigationDestination(isPresented: $isStart){
                            GoalViewUI()
                        }
                    HStack{
                        Text("Already have an account?")
                        Button(action:{
                            showingCredits.toggle()
                        },label:{
                            Text("Sign In")
                                .foregroundColor(Color("Primary"))
                        })
                        .sheet(isPresented: $showingCredits) {
                            VStack(spacing: 20){
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                                    .frame(maxWidth: 312,maxHeight: 52)
                                    .overlay{ HStack(spacing: 10){
                                        Image("google")
                                        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                            Text("Sign In With Google")
                                                .foregroundColor(.white)
                                                .font(.subheadline)
                                            
                                        })
                                    } }
                                
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(.clear)
                                    .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                                    .frame(maxWidth: 312,maxHeight: 52)
                                    .overlay{
                                        HStack(spacing: 10){
                                            Image(systemName: "envelope")
                                            Button(action: {
                                                isLogin = true
                                                showingCredits = false
                                                print("sdfjsdkj",isLogin)
                                            }, label: {
                                                Text("Sign In With Email")
                                                    .foregroundColor(.white)
                                                    .font(.subheadline)
                                                
                                            }
                                            )
                                            
                                        }
                                    }
                                  
                                
                            }
                            .presentationDetents([.height(300)])
                        }
                        
                    }
                }
                
            }
            .navigationDestination(isPresented: $isLogin){
                LoginViewUI()
            }
        }
    }
}

#Preview {
    WelcomeView()
}
