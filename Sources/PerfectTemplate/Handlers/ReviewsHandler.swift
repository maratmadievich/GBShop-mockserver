//
//  ReviewsHandler.swift
//  COpenSSL
//
//  Created by Admin on 5/27/19.
//

import PerfectHTTP

class ReviewsHandler: AbstractHandler {
    
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
        let responseString = GetReviewsDefaultResponse.instance.generateResponse(idProduct: idProduct, pageNumber: pageNumber)
        
        print(responseString)
        response.appendBody(string: responseString)
        response.completed()
    }
}
