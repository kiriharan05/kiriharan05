//
//  WebServiceResponse.swift
//  SampleApp
//
//  Created by Kiri Haran on 2/17/22.
//

import Foundation
import ObjectMapper

class StatusResponse: Mappable {
    var status: Int?
    var data: [DataResponse]?

    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        data <- map["data"]
        status <- map["status"]
    }
}

class DataResponse: Mappable {
    var id: Int?
    var title:String?
    var description:String?
    var address:String?
    var postcode: String?
    var phoneNumber: String?
    var latitude: String?
    var longitude: String?
    var image:ImageDataResponse?
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        description <- map["description"]
        address <- map["address"]
        postcode <- map["postcode"]
        phoneNumber <- map["phoneNumber"]
        latitude <- map["latitude"]
        longitude <- map["longitude"]
        image <- map["image"]
    }
}

class ImageDataResponse: Mappable {

    var small:String?
    var medium:String?
    var large:String?
  
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        small <- map["small"]
        medium <- map["medium"]
        large <- map["large"]

    }
}
