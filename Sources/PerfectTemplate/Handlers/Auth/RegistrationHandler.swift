//
//  RegistrationHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class RegistrationHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
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
        
        response.setHeader(.contentType, value: "text/html")
        
        response.appendBody(string: UserDefaultResponse.instance.generateResponse(userName: userName, password: password, email: email, gender: gender, card: "", bio: ""))
        
        response.completed()
    }
    
}
