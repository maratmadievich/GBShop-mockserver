//
//  LoginHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class LoginHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard let userName = request.params(named: "user_name").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive user_name"))
            
            return
        }
        
        guard let password = request.params(named: "password").first else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive password"))
            
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        
        let responseString = UserDefaultResponse.instance.generateResponse(userName: userName, password: password)
        
        print(responseString)
        
        response.appendBody(string: responseString)
        
        response.completed()
    }
    
}
