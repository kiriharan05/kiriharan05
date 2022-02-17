//
//  CallServices.swift
//  SampleApp
//
//  Created by Kiri Haran on 2/17/22.
//

import Foundation
import Alamofire
import ObjectMapper

class CallServices: BaseService {
    
    func getApiResponce( success: @escaping ((_ status: Int?) -> Void), faliure: (@escaping(_ error: String?) -> Void)){
        
        let url = ("https://dl.dropboxusercontent.com/s/6nt7fkdt7ck0lue/hotels.json").addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        
        var request: AlamofireRequestModal = AlamofireRequestModal()
        request.method = .get
        request.path = url!
        request.encoding = JSONEncoding.default
        
        BaseService().callWebServiceAlamofire(request, success: { response in
            let data = Mapper<StatusResponse>().map(JSONObject: response)
            success(data!.status)
        }, failure: { error in
            faliure(error?.localizedDescription)
        })
    }
    }
