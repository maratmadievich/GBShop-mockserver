//
//  GetCatalogDefaultResponse.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import Foundation

class GetCatalogDefaultResponse {
    
    static let instance = GetCatalogDefaultResponse()
    
    private init(){}
    
    private static let baseMaxRowsCount = 60
    
    private static let baseLimit = 20
    
    
    func generateResponse(pageNumber: Int) -> String {
        
        return "{\"page_number\": \(pageNumber), \"max_rows_count\": \(GetCatalogDefaultResponse.baseMaxRowsCount), \"products\": [\(generateProducts(pageNumber: pageNumber))]}"
    }
    
    
    private func generateProducts(pageNumber: Int) -> String {
        
        let baseProductName = "geekbrainsProduct"
        
        let baseLimit = 20
        
        if pageNumber < 3 {

            
            return Array(1...baseLimit)
                .reduce("") {(totalString, number) in totalString + "{\"id_product\": \(baseLimit * pageNumber + number), \"product_name\": \"\(baseProductName)\(baseLimit * pageNumber + number)\", \"price\": \(number * 100)}\(number < baseLimit ? ", " : "")"}
            
        }
        
        return ""
        
    }
    
}

