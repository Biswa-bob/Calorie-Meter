//
//  RegisterSuccessView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 04/07/24.
//

import SwiftUI

struct RegisterSuccessView: View {
    @State private var isLogin = false
    var body: some View {
        NavigationStack{
            VStack{
                Spacer()
                Text("You have successfully registered.")
                Spacer()
                
//                NavigationLink{
//                   LoginViewUI()
//                } label:{
//                    PrimaryButtonUI( btnLable: "Go to Login")
//                }
                PrimaryButton(btnLable: "Login",onPressed: {
                    isLogin.toggle()
                })
                
            }
            .navigationDestination(isPresented: $isLogin ){
                LoginViewUI()
            }
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    RegisterSuccessView()
}
