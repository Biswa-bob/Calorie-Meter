//
//  RecommendView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct RecommendView: View {
    let nutrients:[String] = [
        "Proteins: 225g",
        "Fats: 118g",
        "Carbs: 340g",
        "Calories: 3400",
    ]
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 120))
    ]
    @ObservedObject var viewModel: RegistrationViewModel
    
    var body: some View {
           NavigationStack {
                VStack{
                    Text("Recommended PFC")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                        .bold()
                    Text("You can always change PFC in the profile")
                        .font(.subheadline)
                        .padding(.top,2)
                        .padding(.horizontal,60)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.bottom,30)
                    
                    LazyVGrid(columns: adaptiveColumns,spacing: 10){
                        ForEach(nutrients,id: \.self){ nutrient in
                            RoundedRectangle(cornerRadius: 12)
                                .frame(height: 50)
                                .foregroundColor(Color("Primary"))
                                .overlay{
                                    Text(nutrient)
                                        .foregroundColor(.black)
                                }
                          
                            
                        }
                    }
                
                   
    //                RoundedRectangle(cornerRadius: 12)
    //                    .frame(height: 50)
    //                    .foregroundColor(Color("Primary"))
    //                    .overlay{
    //                        Text("Fat: 100g")
    //                            .foregroundColor(.black)
    //                    }
                    Spacer()
                    VStack(spacing: 20){
                        RoundedRectangle(cornerRadius: 12)
                            .fill(.clear)
                            .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                            .frame(maxWidth: 312,maxHeight: 52)
                            .overlay{ HStack(spacing: 10){
                                Image("google")
                                Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
                                    Text("Sign Up With Google")
                                        .foregroundColor(.white)
                                        .font(.subheadline)
                                    
                                })
                            } }
                        NavigationLink{ RegisterView(viewModel:viewModel)} label: {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(.clear)
                                .stroke(Color("OnBackgroundVariant"), lineWidth: 1)
                                .frame(maxWidth: 312,maxHeight: 52)
                                .overlay{ HStack(spacing: 10){
                                    Image(systemName: "envelope")
                                        Text("Sign Up With Email")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
                                   
                                }
                                }
                            
                        
                    }
                    }
                }
            }
    }
    
  
   
}



#Preview {
    RecommendView(viewModel: RegistrationViewModel())
}
