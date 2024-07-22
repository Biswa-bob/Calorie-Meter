//
//  RegisterView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct RegisterView: View {
    @State private var name = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isRegister = false
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
        NavigationStack{
                VStack(spacing: 20){
                    Text("Register")
                        .font(.title2)
                    Spacer()
                    RoundedRectangle(cornerRadius: 12)
                        .fill(.clear)
                        .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                        .frame(width: 300,height: 50)
                        .overlay{
                            HStack{
                                Image(systemName: "person")
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                TextField("Enter Your name", text: $viewModel.registrationData.name)
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
                                Image(systemName: "envelope")
                                    .foregroundColor(Color("OnBackgroundVariant"))
                                TextField("Enter Your Email", text: $viewModel.registrationData.email)
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
                                
                                SecureField("Enter Password", text: $viewModel.registrationData.password)
                                    
                            }
                            .padding()
                        }
                    Spacer()
                    PrimaryButton(btnLable: "Register",onPressed: {
                        if(viewModel.registerUser()){
                            isRegister.toggle()
                        }
                    })
                    NavigationLink(destination: RegisterSuccessView(), isActive: $isRegister) { EmptyView() }

                }
        
            .navigationBarBackButtonHidden()
       
            
        }
    }
}

#Preview {
    RegisterView(viewModel: RegistrationViewModel())
}
