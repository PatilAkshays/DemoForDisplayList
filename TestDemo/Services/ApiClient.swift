//
//  ApiClient.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//

import UIKit
import Alamofire
import AlamofireObjectMapper

class ApiClient: NSObject {
    
    
     private let baseUrl = "https://itunes.apple.com"
    
    
    //MARK: Get All data
    func getContentListData(completionHandler: @escaping (ContentListResponse) -> Void){
        let urlStr = "\(baseUrl)/search?term=Michael+jackson"
        
        let url = urlStr.addingPercentEncoding(withAllowedCharacters:NSCharacterSet.urlQueryAllowed)
        
        let headers: HTTPHeaders = [
            "Accept": "application/json",
            "Content-Type": "application/json"
        ]
        
        
        Alamofire.request(url!, method:.get, encoding: JSONEncoding.default, headers: headers).responseObject(completionHandler: { (response: DataResponse<ContentListResponse>) in
            switch(response.result){
            case .success:
                completionHandler(response.result.value!)
            case .failure(let error):
                print("Error ",error)
                let apiErrorResponse = ContentListResponse()
                apiErrorResponse?.isSuccess = false
                apiErrorResponse?.msg = "Something went wrong!"
                completionHandler(apiErrorResponse!)
            }
        })
        
    }
    
    
   
    
}





