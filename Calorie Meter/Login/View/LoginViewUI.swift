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
    var body: some View {
        NavigationView{
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
                    Button(action:{},label: {
                        Text("Forgot Password?")
                            .foregroundColor(Color("Primary"))
                    })
                }
            .navigationTitle("Login")
            .navigationBarHidden(true)
            
        }
    }
}

#Preview {
    LoginViewUI()
}
