//
//  ViewModel.swift
//  TestDemo
//
//  Created by Akshay Patil on 26/07/21.
//


import UIKit

class ViewModel: NSObject {
    @IBOutlet weak var apiClient: ApiClient!
    
    var apiContentResponse: ContentListResponse?
    func getContentListData(completion: @escaping (ContentListResponse) -> Void) {
        
        apiClient?.getContentListData( completionHandler: {  (response) in
            
            DispatchQueue.main.async {
                self.apiContentResponse = response
                
                if self.getAllDataSuccess(){
                    print(self.getAllDataSuccessMessage())
                  
                }else{
                    print(self.getAllDataSuccessMessage())
                }
                completion(self.apiContentResponse!)
            }
        })
    }
    
    
    func getAllDataSuccess() -> Bool {
        return (apiContentResponse?.isSuccess ?? false)
    }
    
    func getAllDataSuccessMessage() -> String {
        return (apiContentResponse?.msg) ?? "Unknown Error"
    }
}
