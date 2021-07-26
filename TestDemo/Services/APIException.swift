//
//  APIException.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//


import UIKit

enum APIException: Error {
    case apiFailed(errMsg: String)
}

