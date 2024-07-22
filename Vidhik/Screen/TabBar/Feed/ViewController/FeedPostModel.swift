//
//  FeedPostModel.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/05/24.
//


import Foundation
struct LawyerPostModel: Decodable {
    let createdAt: String?
    let isLiked: Bool?
    let title: String?
    let description: String?
    let postId: String?
    let lawyerId: String?
    var likeCount: Float?
    let location: String?
    let lawyerName: String?
}


// Function to fetch and parse data
//func parseLawyerPostModelForResultMap(_ resultMap: [String: Any]) -> LawyerPostModel? {
//    guard let lawyerPostData = resultMap["postLawyerActivity"] as? [String: Any],
//          let message = lawyerPostData["message"] as? String,
//          message == "Post added successfully",
//          let postData = lawyerPostData["data"] as? [String: Any],
//          let posts = postData["data"] as? [String: Any],
//          let createdAt = posts["createdAt"] as? String,
//          let isLiked = posts["isLiked"] as? Bool,
//          let title = posts["title"] as? String,
//          let description = posts["description"] as? String,
//          let postId = posts["postId"] as? String,
//          let lawyerId = posts["lawyerId"] as? String else {
//        return nil
//    }
    
//    ["description": Optional("We will explore all the above methods along with their basic implementation with the help of examples."), "createdAt": Optional("2024-05-13T12:37:49.783Z"), "title": Optional("Monson On Summer"), "post_id": Optional("6642099d161583925a92b45b"), "lawyerId": Optional("663c793457aad0bce38c3315"), "isLiked": Optional(false)]
//    let lawyerPostDataObject = LawyerPostModel(createdAt: createdAt, isLiked: isLiked, title: title, description: description, postId: postId, lawyerId: lawyerId)
//    return lawyerPostDataObject
//}


//User UserData:================ Optional(["postLawyerActivity": Optional(["status": Optional(200), "message": Optional("Post added successfully"), "data": Optional(["createdAt": Optional("2024-05-09T13:11:02.752Z"), "isLiked": Optional(false), "title": Optional("Fisrt Post"), "description": Optional("Testinbhfhdbfj. Jbfukewbfuewbfc"), "_id": Optional("663ccb66d4df315e974fbc81"), "lawyerId": Optional("663c793457aad0bce38c3315")])])])
//data+++++++++++++Data(resultMap: ["postLawyerActivity": Optional(["status": Optional(200), "message": Optional("Post added successfully"), "data": Optional(["createdAt": Optional("2024-05-09T13:11:02.752Z"), "isLiked": Optional(false), "title": Optional("Fisrt Post"), "description": Optional("Testinbhfhdbfj. Jbfukewbfuewbfc"), "_id": Optional("663ccb66d4df315e974fbc81"), "lawyerId": Optional("663c793457aad0bce38c3315")])])])

struct CommentPostModel {
    let lawyerId: String?
    let lawyerName: String?
    let location: String?
    let commentText: String?
    let createdAt: String?
}

//"commentList": [
//          {
//            "lawyerId": "664c3d6247f1c381f40aac1d",
//            "lawyerName": "sid",
//            "location": "Madhya Pradesh",
//            "commentText": " Regional Transport Authority office on Wednesday announced a complete crackdown on the two aggregators",
//            "createdAt": "2024-05-22T10:54:50.524Z"
//          },
