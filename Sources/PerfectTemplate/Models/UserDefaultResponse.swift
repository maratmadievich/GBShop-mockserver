//
//  UserDefaultResponse.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import Foundation

class UserDefaultResponse {
    
    static let instance = UserDefaultResponse()
    
    private init(){}
    
    private static let baseUserId = 1
    
    private static let baseUserName = "geekbrains"
    
    private static let basePassword = "ios"
    
    private static let baseEmail = "ios@geekbrains.ru"
    
    private static let baseGender = "m"
    
    private static let baseCard = "1234-5678-9012-3456"
    
    private static let baseBio = "Hello, i'm using Perfect"
    
    
    func generateResponse(userId: Int = baseUserId,
                          userName: String = baseUserName,
                          password: String = basePassword,
                          email: String = baseEmail,
                          gender: String = baseGender,
                          card: String = baseCard,
                          bio: String = baseBio) -> String {
        
        return "{\"result\": 1, \"user\": {\"id_user\": \(userId), \"user_name\": \"\(userName)\", \"password\": \"\(password)\", \"email\": \"\(email)\", \"gender\": \"\(gender)\", \"credit_card\": \"\(card)\", \"bio\": \"\(bio)\"}}"
    }
    
}
