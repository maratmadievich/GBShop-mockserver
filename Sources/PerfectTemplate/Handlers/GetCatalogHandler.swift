//
//  GetCatalogHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class GetCatalogHandler: AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard let pageNumber = Int(request.params(named: "page_number").first ?? "") else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive login"))
            
            return
        }
        
        guard Int(request.params(named: "id_category").first ?? "") != nil else {
            
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive password"))
            
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        
        let responseString = GetCatalogDefaultResponse.instance.generateResponse(pageNumber: pageNumber)
        
        print(responseString)
        
        response.appendBody(string: responseString)
        
        response.completed()
    }
    
}

