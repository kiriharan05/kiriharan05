//
//  BaseService.swift
//  SampleApp
//
//  Created by Kiri Haran on 2/17/22.
//

import Foundation
import Alamofire

struct AlamofireRequestModal {
    var method: Alamofire.HTTPMethod
    var path: String
    var parameters: [String: Any]?
    var encoding: ParameterEncoding
    var headers: [String: String]?
    
    init() {
        method = .get
        path = ""
        parameters = nil
        encoding = JSONEncoding() as ParameterEncoding
        headers = ["Content-Type": "application/json",
                   "X-Requested-With": "XMLHttpRequest",
                   "Cache-Control": "no-cache"]
    }
}

class BaseService: NSObject {
    
    func callWebServiceAlamofire(_ alamoReq: AlamofireRequestModal, success: @escaping ((_ responseObject: AnyObject?) -> Void), failure: @escaping ((_ error: NSError?) -> Void)) {
        
        // Create alamofire request
        // "alamoReq" is overridden in services, which will create a request here
        let req = Alamofire.request(alamoReq.path, method: alamoReq.method, parameters: alamoReq.parameters, encoding: alamoReq.encoding, headers: alamoReq.headers)
        
        // Call response handler method of alamofire
        req.validate(statusCode: 200..<600).responseJSON(completionHandler: { response in
            let statusCode = response.response?.statusCode
            
            switch response.result {
            case .success(let data):
                
                if statusCode == 200 {
                    success(data as AnyObject?)
                } else {
//TODO
                }
            case .failure(let error):
                failure(error as NSError?)
            }
        })
        
    }
    
}
