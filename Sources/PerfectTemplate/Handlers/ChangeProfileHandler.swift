//
//  ChangeProfileHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class ChangeProfileHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard let userId = Int(request.params(named: "id_user").first ?? "") else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive id_user"))
            
            return
        }
        
        guard let userName = request.params(named: "user_name").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive login"))
            
            return
        }
        
        guard let password = request.params(named: "password").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive password"))
            
            return
        }
        
        guard let email = request.params(named: "email").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive email"))
            
            return
        }
        
        guard let gender = request.params(named: "gender").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive gender"))
            
            return
        }
        
        guard let card = request.params(named: "credit_card").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive credit card"))
            
            return
        }
        
        guard let bio = request.params(named: "bio").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive bio"))
            
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        
        response.appendBody(string: UserDefaultResponse.instance.generateResponse(userId: userId, userName: userName, password: password, email: email, gender: gender, card: card, bio: bio))
        
        response.completed()
    }
    
    
}
