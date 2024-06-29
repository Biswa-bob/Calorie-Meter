//
//  ForgotPasswordViewUI.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 26/06/24.
//

import SwiftUI

struct ForgotPasswordViewUI: View {
    @State private var username = ""
    var body: some View {
        NavigationView{
            VStack{
                Text("Forgot Password")
                Spacer()
                VStack{
                    Text("We will send a password reset code to your email account.")
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("OnBackgroundVariant"))
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
                        .padding(.top,12)
                }
                
                Spacer()
                PrimaryButtonUI(btnLable: "Send Code")
                    .padding(.bottom)
            }
        }
    }
}

#Preview {
    ForgotPasswordViewUI()
}
