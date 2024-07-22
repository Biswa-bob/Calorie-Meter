//
//  ActiveView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 28/06/24.
//

import SwiftUI

struct ActiveView: View {
    @State private var selectedId: LifeStyle? = nil
    @State private var isHeightView:Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @ObservedObject var viewModel: RegistrationViewModel
    
    let activity:[String:LifeStyle] = [
        "Sedentery": .sedentery,
        "Low Active": .low,
        "Active" : .active,
        "Very Active" : .veryActive,
    ]
    
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("How active are you?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("A sedentary person burns fewer calories than an active person")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                        .padding(.horizontal,50)
                        .padding(.top,5)
                    Spacer()
                    
                    ForEach(activity.keys.sorted(), id: \.self){ label in
                        let identifier = activity[label]!
                        CardView(isSelected: Binding(get: {
                            selectedId == identifier
                        }, set: { newValue in
                            if newValue {
                                selectedId = identifier
                                viewModel.registrationData.lifeStyle = identifier
                            } else {
                                selectedId = nil
                            }
                        }), lable: label)
                        
                    }
                    Spacer()
                    HStack {
                        Button(action: {
                            self.presentationMode.wrappedValue.dismiss()
                        }, label: {
                            Text("Back")
                                .padding(.leading)
                                .font(.title3)
                                .foregroundColor(Color("OnBackgroundVariant"))
                        })
                        Spacer()
                        NavigationLink{
                            HeightView(viewModel: viewModel)
                        } label:{
                            FloatingNavButtonUI()
                        }
                    }
                }
            }
          
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ActiveView(viewModel: RegistrationViewModel())
}
