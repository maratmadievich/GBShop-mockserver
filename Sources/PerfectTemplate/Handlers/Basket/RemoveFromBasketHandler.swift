//
//  RemoveFromBasketHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/27/19.
//

import PerfectHTTP

class RemoveFromBasketHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard Int(request.params(named: "id_product").first ?? "") != nil else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive id product"))
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        let responseString = generateResponse()
        
        print(responseString)
        response.appendBody(string: responseString)
        response.completed()
    }
    
    private func generateResponse() -> String {
        return "{\"result\": \(1), \"message\": \"Product successfully removed from Basket!\"}"
    }
    
}
