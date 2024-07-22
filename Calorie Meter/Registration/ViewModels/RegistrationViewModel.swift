//
//  RegistrationViewModel.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 21/07/24.
//

import Foundation
import Firebase

class RegistrationViewModel: ObservableObject {
    @Published var registrationData = RegistrationData()

//    func submitData() {
//        print("REG: - \(registrationData)")
//    }
    
    func registerUser() -> Bool{
        guard registrationData.email.isValidEmail(), registrationData.password.count >= 6 else {
            print("Invalid email or password")
            return false
        }
        Auth.auth().createUser(withEmail: registrationData.email, password: registrationData.password) { [self]authResult,error in
            if let e = error {
                print("Could not register user \(e)")
                return
            }
            guard let userid = authResult?.user else { return }
            storeUserData(user: self.registrationData,uid: userid.uid)
            return
        }
        return true
    }
    
    func storeUserData(user:RegistrationData,uid: String ) {
        let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        
//        print("USER: \(user)")
        let registrationDataDict = user.toDictionary()
        docRef.setData(registrationDataDict){ error in
            if let e = error{
                print("Could not  add user to database \(e)")
                return
            }else{
                print("User added to database successfully!")
            }
            
        }
    }
    
    
}

extension String {
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with: self)
    }
}
