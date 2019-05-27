//
//  LogoutHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class LogoutHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard request.params(named: "id_user").first != nil else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive id_user"))
            
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        
        response.appendBody(string: "{\"result\"=1}")
        
        response.completed()
    }
    
    
}
