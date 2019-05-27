//
//  HandlerFactory.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

class HandlerFactory {
    
    public func handlerFor(request: HTTPRequest, response: HTTPResponse) -> AbstractHandler {
        
        switch request.method {
            
        case .get:
            return returnGetHandler(request: request)
            
        case .post:
            return returnPostHandler(request: request)

        default:
            return ErrorHandler()
        }
    }
    
    private func returnGetHandler(request: HTTPRequest) -> AbstractHandler {
        switch request.path {
            
        case "/catalog":
            return GetCatalogHandler()
            
        case "/reviews":
            return ReviewsHandler()
            
        case "/basket":
            return GetBasketHandler()
            
        default:
            return ErrorHandler()
        }
    }
    
    private func returnPostHandler(request: HTTPRequest) -> AbstractHandler {
        
        switch request.path {
            
        case "/registration":
            return RegistrationHandler()
            
        case "/login":
            return LoginHandler()
            
        case "/logout":
            return LogoutHandler()
            
        case "/change_profile":
            return ChangeProfileHandler()
            
        case "/basket/add":
            return AddToBasketHandler()
            
        case "/basket/remove":
            return RemoveFromBasketHandler()
            
        case "/payment":
            return PaymentHandler()
            
        default:
            return ErrorHandler()
        }
    }
    
}
