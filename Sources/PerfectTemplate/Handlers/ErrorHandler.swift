//
//  ErrorHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class ErrorHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        response.completed(status: HTTPResponseStatus.custom(code: 404, message: "Page not found"))
    }
    
}
