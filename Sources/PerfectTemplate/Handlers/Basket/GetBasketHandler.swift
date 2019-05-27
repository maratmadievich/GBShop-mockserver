//
//  GetBasketHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/27/19.
//

import PerfectHTTP

class GetBasketHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard Int(request.params(named: "id_user").first ?? "") != nil else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive id user"))
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        let responseString = generateResponse()
        
        print(responseString)
        response.appendBody(string: responseString)
        response.completed()
    }
    
    private func generateResponse() -> String {
        return "{\"amount\": \(6000), \"count_goods\": \(3), \"contents\": [\(generateContents())]}"
    }
    
    private func generateContents() -> String {
        
        let baseProductName = "default productName"
        let baseLimit = 3
        return Array(1...baseLimit)
            .reduce("") {(totalString, number) in totalString + "{\"id_product\": \(number), \"price\": \(number * 1000), \"quantity\": \(number), \"product_name\": \"\(baseProductName)\(number)\"}\(number < baseLimit ? ", " : "")"}
    }
    
}
