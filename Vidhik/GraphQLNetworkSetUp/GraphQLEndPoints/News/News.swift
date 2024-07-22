//
//  News.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 10/05/24.

import Foundation
import Apollo

// MARK: =============================================== Public Class Verify Otp through the PhoneNumber ===============================================
public final class NewsFeeds: GraphQLQuery {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "getNewsFeed"
    
    public let operationDefinition = """
     query getNewsFeed {
       getNewsFeed {
        status
        message
        data
        }
   }
   """

//    query {
//      getNewsFeed {
//        status
//        message
//        data
//      }
//    }
    
 
    public var variables: GraphQLMap? {
        return [:]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Query"]
        
        public static var selections: [GraphQLSelection] {
            return [
                    GraphQLField("getNewsFeed", type: .object([
                    GraphQLField("status", type: .scalar(Int.self)),
                    GraphQLField("message", type: .scalar(String.self)),
                    GraphQLField("data", type: .object([
                        GraphQLField("results", type: .list(.object([
                            GraphQLField("title", type: .scalar(String.self)),
                            GraphQLField("description", type: .scalar(String.self)),
                            GraphQLField("image_url", type: .scalar(String.self)),
                            GraphQLField("source_url", type: .scalar(String.self)),
                            GraphQLField("content", type: .scalar(OptionalScalar<String>.self))
                        ])))
                    ]))
                ]))
            ]
        }
       
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(getNewsFeed: String? = nil) {
            self.init(unsafeResultMap: ["getNewsFeed": getNewsFeed])
        }
        
        public var getNewsFeed: String? {
            get {
                return resultMap["getNewsFeed"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "getNewsFeed")
            }
        }
        
        
    }
}

//{
//    "data": {
//        "getpostList": {
//            "status": 200,
//            "message": "",
//            "data": {
//                "data": [
//                    {
//                        "isLiked": false,
//                        "post_id": "663e038e6a65527f046c1340",
//                        "lawyerId": "663c793457aad0bce38c3315",
//                        "title": "Aditya",
//                        "description": "Test post api",
//                        "createdAt": "2024-05-10T11:22:54.267Z"
//                    },

//{
//    "data": {
//        "getNewsFeed": {
//            "status": 200,
//            "message": "News fetched successfully",
//            "data": {
//                "status": "ok",
//                "totalResults": 15236,
//                "articles": [
//                    {
//                        "source": {
//                            "id": null,
//                            "name": "Securityaffairs.com"
//                        },
//                        "author": "Pierluigi Paganini",
//                        "title": "Security Affairs newsletter Round 471 by Pierluigi Paganini – INTERNATIONAL EDITION",
//                        "description": "A new round of the weekly SecurityAffairs newsletter arrived! Every week the best security articles from Security Affairs are free for you in your email box. Enjoy a new round of the weekly SecurityAffairs newsletter, including the international press. Ohio L…",
//                        "url": "https://securityaffairs.com/163036/breaking-news/security-affairs-newsletter-round-471-by-pierluigi-paganini-international-edition.html",
//                        "urlToImage": "https://securityaffairs.com/wp-content/uploads/2015/03/newsletter.png",
//                        "publishedAt": "2024-05-12T12:46:17Z",
//                        "content": "Security Affairs newsletter Round 471 by Pierluigi Paganini INTERNATIONAL EDITION\r\n | As of May 2024, Black Basta ransomware affiliates hacked over 500 organizations worldwide\r\n | Ohio Lottery data b… [+67819 chars]"
//                    }
//                ]
//            }
//        }
//    }
//}


/*
 {
   "data": {
     "getNewsFeed": {
       "status": 200,
       "message": "News fetched successfully",
       "data": {
         "status": "success",
         "totalResults": 737,
         "results": [
           {
             "article_id": "e108b2d7d7fb6d15b87702688b35d902",
             "title": "Millions of phishing emails sent through botnet to push LockBit ransomware",
             "link": "https://www.techradar.com/pro/security/millions-of-phishing-emails-sent-through-botnet-to-push-lockbit-ransomware",
             "keywords": [
               "security",
               "pro"
             ],
             "creator": null,
             "video_url": null,
             "description": "LockBit affiliates are opting for a different strategy this time, casting a wide net.",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:14:25",
             "image_url": "https://cdn.mos.cms.futurecdn.net/YbizeHRMkF5QLe6eeYypqc-320-80.jpg",
             "source_id": "techradar",
             "source_priority": 607,
             "source_url": "https://www.techradar.com",
             "source_icon": "https://i.bytvi.com/domain_icons/techradar.png",
             "language": "english",
             "country": [
               "united states of america"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "117c5f4d2d4877790abeae2e7a09fd52",
             "title": "Синтия Ламмис: Разработчики криптокошельков не виноваты в движении преступных активов",
             "link": "https://ru.investing.com/news/cryptocurrency-news/article-2419822",
             "keywords": null,
             "creator": [
               "Bits.media"
             ],
             "video_url": null,
             "description": null,
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:12:37",
             "image_url": "https://i-invdn-com.investing.com/news/Cryptocurrencies_800x533_L_1556444923.jpg",
             "source_id": "investing",
             "source_priority": 611,
             "source_url": "https://ru.investing.com",
             "source_icon": null,
             "language": "russian",
             "country": [
               "russia"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "0295028225d45de657e01f6e3c058e73",
             "title": "Prometheum Breaks New Ground In Crypto Custody And Compliance",
             "link": "https://www.benzinga.com/markets/cryptocurrency/24/05/38823728/prometheum-breaks-new-ground-in-crypto-custody-and-compliance",
             "keywords": [
               "aaron kaplan",
               "crypto",
               "cryptocurrency",
               "expert ideas",
               "foda",
               "prometheum",
               "stories that matter",
               "events",
               "top stories",
               "cryptocurrency",
               "events",
               "top stories",
               "benzinga"
             ],
             "creator": [
               "Abbey Higginbotham"
             ],
             "video_url": null,
             "description": "Aaron Kaplan, the co-CEO and co-founder of Prometheum, will be one of the speakers at Benzinga’s 2024 Future of Digital Assets event this November in New York City. As a seasoned securities attorney and a leader in crypto compliance, Kaplan has steered his company through the complexities of U.S. financial regulations.Under Kaplan’s leadership, Prometheum has gained recognition for its groundbreaking work in the crypto industry. It was notably the first firm approved by FINRA to offer custody of digital assets as a qualified custodian. The company also launched an SEC-registered alternative trading system earlier this year, which manages trading, clearing, settlement, and custody of digital asset securities.Developments and Recent AchievementsEarlier this year, Prometheum announced its plans to initiate Ether custody services, targeting major and liquid tokens in the market. ...Full story available on Benzinga.com",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:07:27",
             "image_url": "https://cdn.benzinga.com/files/images/story/2024/05/14/Crypto-Bitcoin-Altcoins-Shutterstock.jpeg?optimize=medium&dpr=1&auto=jpg&height=480&width=720&fit=crop",
             "source_id": "benzinga",
             "source_priority": 3903,
             "source_url": "https://www.benzinga.com",
             "source_icon": "https://i.bytvi.com/domain_icons/benzinga.png",
             "language": "english",
             "country": [
               "united states of america"
             ],
             "category": [
               "business"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "4bc2cab1dc67af6307d320cdea761aaa",
             "title": "Hackers really, really like trying to take over your food delivery apps",
             "link": "https://www.businessinsider.nl/hackers-really-really-like-trying-to-take-over-your-food-delivery-apps/",
             "keywords": [
               "internationaal"
             ],
             "creator": null,
             "video_url": null,
             "description": "One-fifth of food delivery accounts have been targets of hacking attempts, Sift found. The companies behind the apps use two-factor authentication less often than in other industries. Instacart, Walmart Spark, and other delivery services have had trouble with hackers. Your DoorDash or other food delivery apps are a prime target for hackers. About 20% of [...]",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:05:16",
             "image_url": "https://cdn.businessinsider.nl/wp-content/uploads/2024/05/6577827d7a3c8094d5dbdbc7-800x533.jpg?ver=1715709768",
             "source_id": "businessinsider_nl",
             "source_priority": 93831,
             "source_url": "https://www.businessinsider.nl",
             "source_icon": "https://i.bytvi.com/domain_icons/businessinsider_nl.png",
             "language": "english",
             "country": [
               "netherland"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "a9c5fcb079133dc8e9f4c7708e575470",
             "title": "Hackers really, really like trying to take over your food delivery apps",
             "link": "https://www.businessinsider.com/hackers-really-love-targeting-your-food-delivery-accounts-2024-5",
             "keywords": [
               "economy",
               "gig-work",
               "delivery",
               "ecommerce",
               "food",
               "restaurants",
               "retail"
             ],
             "creator": [
               "abitter@businessinsider.com (Alex Bitter)"
             ],
             "video_url": null,
             "description": "One-fifth of food delivery accounts from services like DoorDash and Uber Eats have been targeted by hackers, Sift said — more than other industries.",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:05:16",
             "image_url": null,
             "source_id": "insider",
             "source_priority": 213,
             "source_url": "https://insider.com",
             "source_icon": "https://i.bytvi.com/domain_icons/insider.png",
             "language": "english",
             "country": [
               "united states of america"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "83a443260d9c2fbf04d84bbb505a6c48",
             "title": "Hackers really, really like trying to take over your food delivery apps",
             "link": "https://www.businessinsider.in/policy/economy/news/hackers-really-really-like-trying-to-take-over-your-food-delivery-apps/articleshow/110126460.cms",
             "keywords": [
               "economy"
             ],
             "creator": null,
             "video_url": null,
             "description": "One-fifth of food delivery accounts have been targets of hacking attempts, Sift found.The companies behind the apps use two-factor authentication less often than in other industries.Your DoorDash or other food delivery apps are a prime target for hackers.About 20% of accounts for ordering and delivering restaurant food have been subject to an attempted account takeover by a hacker, according to Sift, a company that detects online fraud. That's much higher than the 2.5% average across all the industries Sift tracks, from cryptocurrency to transportation.One reason: food delivery apps use two-factor authentication — like those codes texted to you before you can log in — less often than other kinds, Sift found. Just 3.5% of log-ins on food delivery apps asked for that kind of verification, making",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:05:16",
             "image_url": null,
             "source_id": "businessinsider_in",
             "source_priority": 6525,
             "source_url": "https://www.businessinsider.in",
             "source_icon": "https://i.bytvi.com/domain_icons/businessinsider_in.png",
             "language": "english",
             "country": [
               "india"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "6e0a8578d299ef1611c5846e7550d29f",
             "title": "Top 10 Tech Skills You Need for a Secured Future in Nigeria",
             "link": "https://guardian.ng/life/top-10-tech-skills-you-need-for-a-secured-future-in-nigeria/",
             "keywords": [
               "features",
               "guardian life"
             ],
             "creator": [
               "Kareem Azeez"
             ],
             "video_url": null,
             "description": "Are you a tech enthusiast trying to survive in Nigeria or perhaps you do not know what to do? Here are the top ten tech skills you need for a secure future in Nigeria. In Nigeria, where the Techi-Brothers are making waves despite the economic tides, staying ahead means mastering the right tech skills. With [...]The post Top 10 Tech Skills You Need for a Secured Future in Nigeria appeared first on The Guardian Nigeria News - Nigeria and World News.",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:00:50",
             "image_url": "https://guardian.ng/wp-content/uploads/2024/05/Ten-Tech-Skills-100x100.jpg",
             "source_id": "guardian",
             "source_priority": 11489,
             "source_url": "https://guardian.ng",
             "source_icon": null,
             "language": "english",
             "country": [
               "nigeria"
             ],
             "category": [
               "entertainment"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "6b73f9ddbbd4ac0fd18df4882fd7a645",
             "title": "Viral Dogecoin (DOGE) Competitor Trading Under $0.02 Will Pump 50x in 2024, Says Crypto Trader Who Predicted Cardano’s (ADA) $3.10 ATH Last Cycle",
             "link": "https://techbullion.com/viral-dogecoin-doge-competitor-trading-under-0-02-will-pump-50x-in-2024-says-crypto-trader-who-predicted-cardanos-ada-3-10-ath-last-cycle/",
             "keywords": [
               "press release",
               "hump",
               "humptoken"
             ],
             "creator": [
               "David Bryan"
             ],
             "video_url": null,
             "description": "As the cryptocurrency market continues to grow, new competitors are always entering the fray to compete for market share. Among them, traders and investors are taking notice of Hump (HUMP) as a possible rival to the viral Dogecoin (DOGE). HUMP is positioned for rapid growth, with some analysts projecting a 50x increase in value by [...]The post Viral Dogecoin (DOGE) Competitor Trading Under $0.02 Will Pump 50x in 2024, Says Crypto Trader Who Predicted Cardano’s (ADA) $3.10 ATH Last Cycle appeared first on TechBullion.",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:00:24",
             "image_url": "https://techbullion.com/wp-content/uploads/2016/09/TechBullionLogo-3.png",
             "source_id": "techbullion",
             "source_priority": 56791,
             "source_url": "https://techbullion.com/cryptocurrency",
             "source_icon": "https://i.bytvi.com/domain_icons/techbullion.png",
             "language": "english",
             "country": [
               "united kingdom"
             ],
             "category": [
               "business"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "77ab20d8ba413e1ff35a7b2a15b4fe28",
             "title": "BlockDAG Steals the Spotlight: CoinMarketCap & Piccadilly Triumph Amid Ethereum and Polkadot Hurdles, Eyes 30,000x ROI",
             "link": "https://businessday.ng/sponsored/article/bdag-shines-with-30k-x-roi-amid-ethereum-dip-polkadot-hurdles/",
             "keywords": [
               "sponsored"
             ],
             "creator": [
               "Sponsored Post"
             ],
             "video_url": null,
             "description": "Amidst a drop in Ethereum’s daily ETH burn rates reaching yearly lows, the cryptocurrency landscape remains dynamic. Meanwhile, Polkadot hasread more BlockDAG Steals the Spotlight: CoinMarketCap & Piccadilly Triumph Amid Ethereum and Polkadot Hurdles, Eyes 30,000x ROI",
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:00:09",
             "image_url": "https://cdn.businessday.ng/wp-content/uploads/2024/05/Picture6-1.png",
             "source_id": "businessday",
             "source_priority": 92206,
             "source_url": "https://businessday.ng",
             "source_icon": "https://i.bytvi.com/domain_icons/businessday.jpg",
             "language": "english",
             "country": [
               "nigeria"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           },
           {
             "article_id": "5f7351686b4da60e304d3a885f7da94f",
             "title": "Из-за падения доходов майнеров в Kaiko ожидают продажи BTC",
             "link": "https://ru.investing.com/news/cryptocurrency-news/article-2419814",
             "keywords": null,
             "creator": [
               "Happy Coin News"
             ],
             "video_url": null,
             "description": null,
             "content": "ONLY AVAILABLE IN PAID PLANS",
             "pubDate": "2024-05-14 17:00:01",
             "image_url": "https://i-invdn-com.investing.com/news/LYNXMPEB3E0UM_M.jpg",
             "source_id": "investing",
             "source_priority": 611,
             "source_url": "https://ru.investing.com",
             "source_icon": null,
             "language": "russian",
             "country": [
               "russia"
             ],
             "category": [
               "top"
             ],
             "ai_tag": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "sentiment_stats": "ONLY AVAILABLE IN PROFESSIONAL AND CORPORATE PLANS",
             "ai_region": "ONLY AVAILABLE IN CORPORATE PLANS"
           }
         ],
         "nextPage": "1715706001689322609"
       }
     }
   }
 }
 */
