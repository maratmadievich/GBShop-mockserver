//
//  GetReviewsDefaultResponse.swift
//  COpenSSL
//
//  Created by Admin on 5/27/19.
//

import Foundation

class GetReviewsDefaultResponse {
    
    static let instance = GetReviewsDefaultResponse()
    private init(){}
    
    private static let baseMaxRowsCount = 60
    
    
    func generateResponse(idProduct: Int, pageNumber: Int) -> String {
        
        return "{\"page_number\": \(pageNumber), \"max_rows_count\": \(GetReviewsDefaultResponse.baseMaxRowsCount), \"reviews\": [\(generateReviews(idProduct: idProduct, pageNumber: pageNumber))]}"
    }
    
    private func generateReviews(idProduct: Int, pageNumber: Int) -> String {
        
        let baseReview = "default review about product"
        let baseLimit = 20
        if pageNumber < 3 {
            
            return Array(1...baseLimit)
                .reduce("") {(totalString, number) in totalString + "{\"id_product\": \(idProduct), \"id_user\": \(number), \"text\": \"\(baseReview)\(baseLimit * pageNumber + number)\"}\(number < baseLimit ? ", " : "")"}
        }
        return ""
        
    }
    
}

