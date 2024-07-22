//
//  LoginViewUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 26/06/24.
//

import SwiftUI

struct LoginViewUI: View {
    @State private var username = ""
    @State private var password = ""
    @State private var isLogin = false
    @StateObject private var loginVC = LoginViewModel()
    var body: some View {
        NavigationStack{
                VStack(spacing: 20){
                    Text("Login")
                        .font(.title2)
                    Spacer()
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.clear)
                        .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                        .frame(width: 300,height: 50)
                        .overlay{
                            HStack{
                                Image(systemName: "envelope")
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                TextField("Enter Your Email", text: $username)
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                    .autocorrectionDisabled(true)
                                    .autocapitalization(.none)
                            }
                            .padding()
                        }
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.clear)
                        .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                        .frame(width: 300,height: 50)
                        .overlay{
                            HStack{
                                Image(systemName: "lock")
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                
                                SecureField("Enter Password", text: $password)
                                    
                            }
                            .padding()
                        }
                    Spacer()
                       PrimaryButtonUI(btnLable: "Login")
                        .onTapGesture {
                            loginVC.loginUser(email: username, password: password){ isLoginSuccess in
                                if(isLoginSuccess){
                                    isLogin.toggle()
                                }else{
                                    return
                                }
                            }
                        }
                   
                    Button(action:{},label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color("Primary"))
                    })
                }
                .navigationDestination(isPresented: $isLogin){
                    HomeView()
                }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
          
        }
    }
}

#Preview {
    LoginViewUI()
}
