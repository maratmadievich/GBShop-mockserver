//
//  main.swift
//  PerfectTemplate
//
//  Created by Kyle Jessup on 2015-11-05.
//	Copyright (C) 2015 PerfectlySoft, Inc.
//
//===----------------------------------------------------------------------===//
//
// This source file is part of the Perfect.org open source project
//
// Copyright (c) 2015 - 2016 PerfectlySoft Inc. and the Perfect project authors
// Licensed under Apache License v2.0
//
// See http://perfect.org/licensing.html for license information
//
//===----------------------------------------------------------------------===//
//

import PerfectHTTP
import PerfectHTTPServer


func handler(request: HTTPRequest, response: HTTPResponse) {
    
    let facrory = HandlerFactory()
    
    let handler = facrory.handlerFor(request: request, response: response)
    
    handler.process(request: request, response: response)
}

let server = HTTPServer()

var routes = Routes()

routes.add(method: .post, uri: "/**", handler: handler)

routes.add(method: .get, uri: "/**", handler: handler)

server.addRoutes(routes)

server.serverPort = 8181

//server.serverAddress = "192.168.1.72"
server.serverAddress = "10.12.2.82"
//server.serverAddress = "127.0.0.1"
do {
    
    try server.start()
}
catch {
    
    fatalError("Network error - \(error)")
}
