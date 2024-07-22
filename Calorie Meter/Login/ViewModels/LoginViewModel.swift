//
//  LoginViewModel.swift
//  Calorie Meter
//
//  Created by Biswajeet Panda on 22/07/24.
//

import Foundation
import Firebase

class LoginViewModel:ObservableObject{
    
    func loginUser(email:String,password:String,completion: @escaping (Bool) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) {authResponse,error in
            if let err = error {
                print("Could not login \(err)")
                completion(false)
                return
            }else{
                print("Logged in successfully !")
                completion(true)
            }
        }
    }
}
