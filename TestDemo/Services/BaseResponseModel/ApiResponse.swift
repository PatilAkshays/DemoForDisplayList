//
//  ApiResponse.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//


import Foundation
import ObjectMapper

open class BaseApiResponse: Mappable {
    var msg : String?
    var errCode : Int?
    var isSuccess : Bool?
    
    required public init?(){}
    
    required public init?(map: Map) {
        
    }
    
    public func mapping(map: Map) {
        msg <- map["message"]
        errCode <- map["errorCode"]
        isSuccess <- map["success"]
    }

}
