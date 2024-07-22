//
//  Feeds.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/05/24.
//

import Foundation
import Apollo

// MARK: =============================================== Public Class Post Lawyer ===============================================
public final class LawyerPostActivityMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "PostLawyerActivity"
    
    public let operationDefinition: String =
             """
             mutation PostLawyerActivity($lawyerId: String!, $title: String!, $description: String!, $likeCount: Float!) {
                     postLawyerActivity(input: { lawyerId: $lawyerId, title: $title, description: $description,  likeCount: $likeCount }) {
                                         status
                                         message
             data
                                     }
                                 }
             """
     
    public var lawyerId: String
    public var title: String
    public var description: String
    public var likeCount: Float
    
    public init(lawyerId: String, title: String, description: String, likeCount: Float) {
        self.lawyerId = lawyerId
        self.title = title
        self.description = description
        self.likeCount = likeCount
    }
    
    
    public var variables: GraphQLMap? {
        return ["lawyerId": lawyerId, "title": title, "description": description, "likeCount": likeCount]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
//        public static var selections: [GraphQLSelection] {
//            return [
//                GraphQLField("postLawyerActivity",arguments: ["lawyerId": GraphQLVariable("lawyerId"), "title": GraphQLVariable("title"), "description": GraphQLVariable("description"), "likeCount": GraphQLVariable("likeCount")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)),
//                       GraphQLField("data", type: .object([
//                       GraphQLField("isLiked", type: .scalar(Bool.self)),
//                       GraphQLField("lawyerId", type: .scalar(String.self)),
//                       GraphQLField("title", type: .scalar(String.self)),
//                       GraphQLField("description", type: .scalar(String.self)),
//                       GraphQLField("createdAt", type: .scalar(String.self)),
//                       GraphQLField("postId", type: .scalar(String.self))]))]))
//            ]
//        }
        
        public static var selections: [GraphQLSelection] {
                    return [
                        GraphQLField("postLawyerActivity",arguments: ["lawyerId": GraphQLVariable("lawyerId"), "title": GraphQLVariable("title"), "description": GraphQLVariable("description"), "likeCount": GraphQLVariable("likeCount")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self))]))
                    ]
                }
                
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(postLawyerActivity: String? = nil) {
            self.init(unsafeResultMap: ["postLawyerActivity": postLawyerActivity])
        }
        
        
        public var PostLawyerActivity: String? {
            get {
                return resultMap["postLawyerActivity"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "postLawyerActivity")
            }
        }
    }
}

/*
 mutation {
   postLawyerActivity(input: {
    lawyerId:"663c793457aad0bce38c3315"
    title:"Monson On Summer"
    description:"We will explore all the above methods along with their basic implementation with the help of examples."
    likeCount:"0"
   }) {
     status
     message
     data
   }
 }
 
 {
     "data": {
         "postLawyerActivity": {
             "status": 200,
             "message": "Post added successfully",
             "data": {
                 "isLiked": false,
                 "lawyerId": "663dfc927e235ff2a33b8f98",
                 "lawyerName": "John Doe",
                 "title": "Redtaper",
                 "description": "We will explore all the above methods along with their basic implementation with the help of examples.",
                 "likeCount": "0",
                 "location": "456 Lawyer St",
                 "comments": [
                     ""
                 ],
                 "createdAt": "2024-05-14T08:59:44.421Z",
                 "postId": "66432800af4de49a839f1018"
             }
         }
     }
 }
 */


//// MARK: =============================================== Public Class Verify Otp through the PhoneNumber ===============================================
public final class GetFeedPostListQuery: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public var operationName: String = "getpostList"
    
    public let operationDefinition: String = """
    mutation getpostList {
        getpostList {
            status
            message
            data
        }
    }
    """

//    query {
//      getpostList {
//        status
//        message
//        data
//      }
//    }

    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("getpostList", type: .object([
                    GraphQLField("status", type: .scalar(Int.self)),
                    GraphQLField("message", type: .scalar(String.self)),
                    GraphQLField("data", type: .object([
                        GraphQLField("postList", type: .list(.object([
                            GraphQLField("isLiked", type: .scalar(Bool.self)),
                            GraphQLField("_id", type: .scalar(String.self)),
                            GraphQLField("lawyerId", type: .scalar(String.self)),
                            GraphQLField("title", type: .scalar(String.self)),
                            GraphQLField("description", type: .scalar(String.self)),
                            GraphQLField("likeCount", type: .scalar(Float.self)),
                            GraphQLField("location", type: .scalar(String.self)),
                            GraphQLField("lawyerName", type: .scalar(String.self)),
                            GraphQLField("createdAt", type: .scalar(String.self))
                        ])))
                    ]))
                ]))
            ]
        }

        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(getpostList: String? = nil) {
            self.init(unsafeResultMap: ["getpostList": getpostList])
        }
        
        public var getpostList: String? {
            get {
                return resultMap["getpostList"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "getpostList")
            }
        }

    }
}

//MARK: =========================== Public Class Like and Unlike Post Mutation ================================
public final class LikeAndUnlikePostMutation: GraphQLMutation {
    public let operationName: String = "postLike"
    
    public let operationDefinition: String =
             """
             mutation postLike($postId: String!, $isLiked: Boolean!, $userId: String!) {
                         postLike(input: { postId: $postId, isLiked: $isLiked, userId: $userId}) {
                                         status
                                         message
                                         data
                                     }
                                 }
             """
    
    public var postId: String
    public var isLiked: Bool
    public var userId: String
    
    public init(postId: String, isLiked: Bool, userId: String) {
        self.postId = postId
        self.isLiked = isLiked
        self.userId = userId
    }
    
    public var variables: GraphQLMap? {
        return ["postId": postId, "isLiked": isLiked, "userId": userId]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("postLike", arguments: ["postId": GraphQLVariable("postId"), "isLiked": GraphQLVariable("isLiked"), "userId": GraphQLVariable("userId")], type: .object([GraphQLField("status", type: .scalar(Int.self)),
                    GraphQLField("message", type: .scalar(String.self)),
                    GraphQLField("data", type: .object([GraphQLField("isLiked", type: .scalar(Bool.self)),
                                                        GraphQLField("likeCount", type: .scalar(Int.self))
                                                      //  GraphQLField("userLikeBy", type: .scalar([String].self))
                                                       ]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(postLike: String? = nil) {
            self.init(unsafeResultMap: ["postLike": postLike])
        }
        
        public var createLawyers: String? {
            get {
                return resultMap["postLike"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "postLike")
            }
        }
    }
    
   
    
}


//mutation {
//  postLike(input:{
//    postId:"66460363395e8c57597f29f8"
//    isLiked:true
//    userId:"66432cd258826e1ed989eb1c"
//  }) {
//    status
//    message
//    data
//  }
//}


//{
//  "data": {
//    "postLike": {
//      "status": 200,
//      "message": "Post liked successfully",
//      "data": {
//        "isLiked": true,
//        "likeCount": 5,
//        "userLikeBy": [
//          "66432cd258826e1ed989eb1c",
//          "66432cd258826e1ed989eb1c",
//          "66432cd258826e1ed989eb1c"
//        ]
//      }
//    }
//  }
//}


/*
 mutation {
   postComment(input:{
     postId:"664c7ecbf191f5e7083b48d0"
     lawyerId:"664c3d6247f1c381f40aac1d"
     commentText:" Regional Transport Authority office on Wednesday announced a complete crackdown on the two aggregators"
   }) {
     status
     message
     data
   }
 }

 */

// MARK: =============================================== Public Class Post Lawyer ===============================================// MARK:
public final class LawyerPostCommentMutation: GraphQLMutation {
    // The raw GraphQL definition of this operation.
    public let operationName: String = "postComment"
    
    public let operationDefinition: String =
             """
             mutation postComment($postId: String!, $lawyerId: String!, $commentText: String!) {
                        postComment(input: { postId: $postId, lawyerId: $lawyerId, commentText: $commentText }) {
                                         status
                                         message
             data
                                     }
                                 }
             """
     
    public var lawyerId: String
    public var postId: String
    public var commentText: String
    
    public init(lawyerId: String, postId: String, commentText: String) {
        self.lawyerId = lawyerId
        self.postId = postId
        self.commentText = commentText
    }
    
    
    public var variables: GraphQLMap? {
        return ["postId": postId, "lawyerId": lawyerId, "commentText": commentText]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("postComment",arguments: ["postId": GraphQLVariable("postId"),"lawyerId": GraphQLVariable("lawyerId"), "commentText": GraphQLVariable("commentText")], type: .object([GraphQLField("status", type: .scalar(Int.self)),GraphQLField("message", type: .scalar(String.self)),
                       GraphQLField("data", type: .object([
//                       GraphQLField("isLiked", type: .scalar(Bool.self)),
//                       GraphQLField("lawyerId", type: .scalar(String.self)),
//                       GraphQLField("title", type: .scalar(String.self)),
//                       GraphQLField("description", type: .scalar(String.self)),
//                       GraphQLField("createdAt", type: .scalar(String.self)),
//                       GraphQLField("postId", type: .scalar(String.self)),
                        GraphQLField("comments", type: .list(.object([
                        GraphQLField("lawyerId", type: .scalar(String.self)),
                        GraphQLField("lawyerName", type: .scalar(String.self)),
                        GraphQLField("commentText", type: .scalar(String.self)),
                        GraphQLField("location", type: .scalar(String.self)),
                        GraphQLField("createdAt", type: .scalar(String.self))
                    ])))]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(postComment: String? = nil) {
            self.init(unsafeResultMap: ["postComment": postComment])
        }
        
        
        public var PostLawyerActivity: String? {
            get {
                return resultMap["postComment"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "postComment")
            }
        }
    }
}

//MARK: ============================= Get Post Comment Mutation =========================
public final class GetPostCommentMutation: GraphQLMutation {
    public var operationName: String = "getPostComment"
    
    public let operationDefinition: String =
    """
    mutation getPostComment($postId: String!) {
            getPostComment(input: { postId: $postId}) {
            status
            message
            data
        }
    }
    """
    
    public var postId: String
    
    public init(postId: String) {
        self.postId = postId
    }
    
    public var variables: GraphQLMap? {
        return ["postId": postId]
    }
    
    public struct Data: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Mutation"]
        
        public static var selections: [GraphQLSelection] {
            return [
                GraphQLField("getPostComment", arguments: ["postId": GraphQLVariable("postId")], type: .object([GraphQLField("status", type: .scalar(String.self)),GraphQLField("message", type: .scalar(String.self)),GraphQLField("data", type: .object([GraphQLField("commentList", type: .list(.object([GraphQLField("lawyerId", type: .scalar(String.self)),GraphQLField("lawyerName", type: .scalar(String.self)),GraphQLField("location", type: .scalar(String.self)),                                                                                 GraphQLField("commentText", type: .scalar(String.self)),GraphQLField("createdAt", type: .scalar(String.self))])))]))]))
            ]
        }
        
        public private(set) var resultMap: ResultMap
        
        public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
        }
        
        public init(postLike: String? = nil) {
            self.init(unsafeResultMap: ["getPostComment": postLike])
        }
        
        public var createLawyers: String? {
            get {
                return resultMap["getPostComment"] as? String
            }
            set {
                resultMap.updateValue(newValue, forKey: "getPostComment")
            }
        }
    }
    
}


