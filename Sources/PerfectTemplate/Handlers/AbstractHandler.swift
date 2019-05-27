//
//  AbstractHandler.swift
//  PerfectTemplate
//
//  Created by Admin on 5/21/19.
//

import PerfectHTTP

protocol AbstractHandler {
    
    func process(request: HTTPRequest, response: HTTPResponse)
}

