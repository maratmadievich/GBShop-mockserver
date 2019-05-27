//
//  ReviewsHandler.swift
//  COpenSSL
//
//  Created by Admin on 5/27/19.
//

import PerfectHTTP

class ReviewsHandler: AbstractHandler {
    
    private let baseLimit = 20
    private let baseMaxRowsCount = 60
    private let baseUserName = "defaultUser"
    private let baseReview = "default review about product"
    
    func process(request: HTTPRequest, response: HTTPResponse) {
        
        guard let idProduct = Int(request.params(named: "id_product").first ?? "") else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive id product"))
            return
        }
        
        guard let pageNumber = Int(request.params(named: "page_number").first ?? "") else {
            response.completed(status: HTTPResponseStatus.custom(code: 500, message: "Not receive page number"))
            return
        }
        
        response.setHeader(.contentType, value: "text/html")
        let responseString = generateResponse(idProduct: idProduct, pageNumber: pageNumber)
        
        print(responseString)
        response.appendBody(string: responseString)
        response.completed()
    }
    
    private func generateResponse(idProduct: Int, pageNumber: Int) -> String {
        
        return "{\"page_number\": \(pageNumber), \"max_rows_count\": \(baseMaxRowsCount), \"reviews\": [\(generateReviews(idProduct: idProduct, pageNumber: pageNumber))]}"
    }
    
    private func generateReviews(idProduct: Int, pageNumber: Int) -> String {
        if pageNumber < 3 {
            return Array(1...baseLimit)
                .reduce("") {(totalString, number) in totalString + "{\"id_product\": \(idProduct), \"id_user\": \(number), \"user_name\": \"\(baseUserName)\(baseLimit * pageNumber + number)\", \"text\": \"\(baseReview)\(baseLimit * pageNumber + number)\"}\(number < baseLimit ? ", " : "")"}
        }
        return ""
    }
}
