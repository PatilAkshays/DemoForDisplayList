//
//  ApiResponse.swift
//  TestDemo
//
//  Created by Manish Ingale on 26/07/21.
//

import UIKit
import ObjectMapper

class ContentListResponse: BaseApiResponse {
    var contentListArray = [ContentList]()
    var resultCount: Int = 0
    override func mapping(map: Map) {
        
        contentListArray <- map["results"]
        resultCount <- map["resultCount"]
        
        msg <- map["message"]
        errCode <- map["errorCode"]
        isSuccess = true
    }
    
    
}


class ContentList: Mappable{
   
    var wrapperType: String?
    var kind: String?
    var trackId: Int?
    var artistName: String?
    var trackName: String?
    var trackCensoredName: String?
    var trackViewUrl: String?
    var previewUrl: String?
    var artworkUrl30: String?
    var artworkUrl60: String?
    var artworkUrl100: String?
    var trackRentalPrice: Int?
    var trackHdRentalPrice: Int?
    var releaseDate: String?
    var collectionExplicitness: String?
    var trackExplicitness: String?
    var trackTimeMillis: Int?
    var country: String?
    var currency: String?
    var primaryGenreName: String?
    var contentAdvisoryRating: String?
    var shortDescription: String?
    var longDescription: String?

    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        wrapperType <- map["wrapperType"]
        kind <- map["kind"]
        trackId <- map["trackId"]
        artistName <- map["artistName"]
        trackName <- map["trackName"]
        trackCensoredName <- map["trackCensoredName"]
        trackViewUrl <- map["trackViewUrl"]
        previewUrl <- map["previewUrl"]
        artworkUrl30 <- map["artworkUrl30"]
        artworkUrl60 <- map["artworkUrl60"]
        artworkUrl100 <- map["artworkUrl100"]
        trackRentalPrice <- map["trackRentalPrice"]
        trackHdRentalPrice <- map["trackHdRentalPrice"]
        releaseDate <- map["releaseDate"]
        collectionExplicitness <- map["collectionExplicitness"]
        trackExplicitness <- map["trackExplicitness"]
        trackTimeMillis <- map["trackTimeMillis"]
        country <- map["country"]
        currency <- map["currency"]
        primaryGenreName <- map["primaryGenreName"]
        contentAdvisoryRating <- map["contentAdvisoryRating"]
        shortDescription <- map["shortDescription"]
        longDescription <- map["longDescription"]

    }
    
    
}
/*
 
 "wrapperType": "track",
 "kind": "feature-movie",
 "trackId": 1569921798,
 "artistName": "Josh Ruben",
 "trackName": "Werewolves Within",
 "trackCensoredName": "Werewolves Within",
 "trackViewUrl": "https://itunes.apple.com/us/movie/werewolves-within/id1569921798?uo=4",
 "previewUrl": "https://video-ssl.itunes.apple.com/itunes-assets/Video115/v4/f4/54/50/f454508e-01ad-fa06-d7f3-3e7831902eeb/mzvf_6757919512117207831.640x356.h264lc.U.p.m4v",
 "artworkUrl30": "https://is3-ssl.mzstatic.com/image/thumb/Video125/v4/68/74/4e/68744e7f-4de9-58b9-67c2-aa7522c79fdd/source/30x30bb.jpg",
 "artworkUrl60": "https://is3-ssl.mzstatic.com/image/thumb/Video125/v4/68/74/4e/68744e7f-4de9-58b9-67c2-aa7522c79fdd/source/60x60bb.jpg",
 "artworkUrl100": "https://is3-ssl.mzstatic.com/image/thumb/Video125/v4/68/74/4e/68744e7f-4de9-58b9-67c2-aa7522c79fdd/source/100x100bb.jpg",
 "trackRentalPrice": 6.99,
 "trackHdRentalPrice": 6.99,
 "releaseDate": "2021-06-25T07:00:00Z",
 "collectionExplicitness": "notExplicit",
 "trackExplicitness": "notExplicit",
 "trackTimeMillis": 5781600,
 "country": "USA",
 "currency": "USD",
 "primaryGenreName": "Comedy",
 "contentAdvisoryRating": "R",
 "shortDescription": "When a killer terrorizes the snowed-in residents of a small town, it falls to the new forest ranger",
 "longDescription": "When a killer terrorizes the snowed-in residents of a small town, it falls to the new forest ranger to find out who - or what - lurks among them in this hilarious horror whodunnit."

 */
