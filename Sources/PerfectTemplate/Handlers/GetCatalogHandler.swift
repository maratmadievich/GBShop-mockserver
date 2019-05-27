//
//  GetCatalogHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class GetCatalogHandler: AbstractHandler {
    
    private let baseLimit = 20
    private let baseMaxRowsCount = 60
    private let baseProductName = "geekbrainsProduct"
    
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
        let responseString = generateResponse(pageNumber: pageNumber)
        print(responseString)
        
        response.appendBody(string: responseString)
        response.completed()
    }
    
    private func generateResponse(pageNumber: Int) -> String {
        return "{\"page_number\": \(pageNumber), \"max_rows_count\": \(baseMaxRowsCount), \"products\": [\(generateProducts(pageNumber: pageNumber))]}"
    }
    
    private func generateProducts(pageNumber: Int) -> String {
        
        if pageNumber < 3 {
            
            return Array(1...baseLimit)
                .reduce("") {(totalString, number) in totalString + "{\"id_product\": \(baseLimit * pageNumber + number), \"product_name\": \"\(baseProductName)\(baseLimit * pageNumber + number)\", \"price\": \(number * 100)}\(number < baseLimit ? ", " : "")"}
        }
        return ""
    }
    
}

