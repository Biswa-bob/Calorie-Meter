//
//  GenderView.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 27/06/24.
//

import SwiftUI


struct GenderView: View {
    @State private var selectedId: String? = nil
    @State private var isActiveView:Bool = false
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    let gender:[String:String] = [
        "Male" : "male",
        "Female" : "female"
    ]
    var body: some View {
        NavigationStack{
            ZStack{
                VStack{
                    Text("What’s your gender?")
                        .font(.title2)
                        .foregroundColor(Color("OnBackground"))
                    Text("Male bodies need more calories")
                        .multilineTextAlignment(.center)
                        .font(.subheadline)
                        .foregroundColor(Color("OnBackgroundVariant"))
                    Spacer()
                    
                    ForEach(gender.keys.sorted(), id: \.self){ label in
                        let identifier = gender[label]!
                        CardView(isSelected: Binding(get: {
                            selectedId == identifier
                        }, set: { newValue in
                            if newValue {
                                selectedId = identifier
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
                            ActiveView()
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
    GenderView()
}
