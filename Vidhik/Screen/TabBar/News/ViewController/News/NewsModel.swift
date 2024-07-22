//
//  NewsModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 13/05/24.
//

import Foundation

struct NewsDataModel: Decodable {
    let title: String?
    let description: String?
    let newURl: String?
    let imageURL: String?
    let content: String?
}


//Data(resultMap: ["getNewsFeed": Optional(["status": Optional(200), "message": Optional("News fetched successfully"), "data": Optional(["articles": Optional([Optional(["title": Optional("Solstorm kan leda till högre elpriser"), "publishedAt": Optional("2024-05-12T13:00:00Z"), "url": Optional("https://feber.se/samhalle/solstorm-kan-leda-till-hogre-elpriser/467530/"), "urlToImage": Optional("https://static.feber.se/article_images/58/86/06/588606.jpg"), "author": Optional("Frode Wikesjö"), "description": Optional("Mindre el i nätet = högre priser\n\n\n\n\n\n\nI fredags nådde den kraftigaste solstormen på över 20 år jorden, vilket resulterade i ett spektakulärt norrsken som kunde ses i stora delar av världen. Solstormar, som uppstår när solen släpper ut stora mängder energi, k…"), "content": Optional("+\r\nLäs artiklar före alla andra\r\nKommentera före alla andra\r\nVälj periodJu längre period, desto bättre pris. Du bestämmer! \r\nMånad\r\n39 kr/mån\r\nKvartal\r\n33 kr/mån\r\nÅr\r\n25 kr/mån\r\nVälj hur du vill beta… [+11854 chars]")])
/*
 {
     "data": {
         "getNewsFeed": {
             "status": 200,
             "message": "News fetched successfully",
             "data": {
                 "status": "ok",
                 "totalResults": 15236,
                 "articles": [
                     {
                         "source": {
                             "id": null,
                             "name": "Securityaffairs.com"
                         },
                         "author": "Pierluigi Paganini",
                         "title": "Security Affairs newsletter Round 471 by Pierluigi Paganini – INTERNATIONAL EDITION",
                         "description": "A new round of the weekly SecurityAffairs newsletter arrived! Every week the best security articles from Security Affairs are free for you in your email box. Enjoy a new round of the weekly SecurityAffairs newsletter, including the international press. Ohio L…",
                         "url": "https://securityaffairs.com/163036/breaking-news/security-affairs-newsletter-round-471-by-pierluigi-paganini-international-edition.html",
                         "urlToImage": "https://securityaffairs.com/wp-content/uploads/2015/03/newsletter.png",
                         "publishedAt": "2024-05-12T12:46:17Z",
                         "content": "Security Affairs newsletter Round 471 by Pierluigi Paganini INTERNATIONAL EDITION\r\n | As of May 2024, Black Basta ransomware affiliates hacked over 500 organizations worldwide\r\n | Ohio Lottery data b… [+67819 chars]"
                     }
                 ]
             }
         }
     }
 }
 */
