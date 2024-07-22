//
//  FeedVM.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/05/24.
//

import Foundation

class FeedVM {
    var lawyerPostModel: [LawyerPostModel] = []
    var commentPostModel: [CommentPostModel] = []
    var isLiked: Int?
}

// MARK: =========== Lawyer Post API Call ========
extension FeedVM {
    
    func validationForPost(title: String, description: String) -> Bool {
        guard !title.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please enter the title.")
        }
        
        guard !description.isEmpty else{
            return AlertView.show(title: alertTitle, message: "Please enter the description.")
        }
        return true
    }
    
    func lawyerPostActivity(lawyerId: String, title: String, description: String, likeCount: Float, callback: @escaping(ResponseType, String) -> ()) {
        let lawyerPostMutation = LawyerPostActivityMutation(lawyerId: lawyerId, title: title, description: description, likeCount: likeCount)
        VidhikBaseURL.shared.apollo.perform(mutation: lawyerPostMutation) { result in
            switch result {
            case .success(let lawyerPostResponse):
                guard let data = try? result.get().data else { return }
                if let lawyerPost = data.resultMap["postLawyerActivity"] as? [String: Any] {
                    guard let status = lawyerPost["status"] as? Int else { return }
                    guard let message = lawyerPost["message"] as? String else { return }
                    
                    if status == 200 {
                        callback(.success, message)
                    } else {
                        callback(.success, message)
                    }
                } else if let errors = lawyerPostResponse.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
            
        }
    }
    // MARK: ============= IsLikeUnLike API =============
    func isLikedUnlikedAPI(lawyerId: String, title: String, description: String, likeCount: String, callback: @escaping(ResponseType, String) -> ()) {
        
    }
}

// MARK: =============== Get Post List API ==============
extension FeedVM {
    func getPostListApi(callback: @escaping (ResponseType, String) -> ()) {
        let getPosts = GetFeedPostListQuery()
        VidhikBaseURL.shared.apollo.perform(mutation: getPosts) { result in
        //fetch(query: getPosts, cachePolicy: .returnCacheDataElseFetch) { result in
            print(result)
            switch result {
            case .success(let graphQLResult):
                guard let data = try? result.get().data else { return }
                self.lawyerPostModel.removeAll()
                print("data+++++++++++++\(data)")
                if let getPostList = data.resultMap["getpostList"] as? [String: Any] {
                    if let status = getPostList["status"] as? Int,
                       let message = getPostList["message"] as? String,
                       let postData = getPostList["data"] as? [String: Any],  
                        let postList = postData["postList"] as? [[String: Any]] {
                        for dict in postList {
                            let likeCount = dict["likeCount"] as? Float
                            let isLiked = dict["isLiked"] as? Bool
                            let title = dict["title"] as? String
                            let description = dict["description"] as? String
                            let lawyerId = dict["lawyerId"] as? String
                            let createdAt = dict["createdAt"] as? String
                            let postId = dict["_id"] as? String
                            let location = dict["location"] as? String  ?? "Indore"
                            let lawyerName = dict["lawyerName"] as? String  ?? "Steev Jobs"
                            let post = LawyerPostModel(createdAt: createdAt, isLiked: isLiked, title: title, description: description, postId: postId, lawyerId: lawyerId, likeCount: likeCount, location: location, lawyerName: lawyerName)
                                // Append the post to the posts array
                                self.lawyerPostModel.append(post)
                        }
                        print("postData\(String(describing: postData))")
                        if status == 200 {
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                    }
                    
                } else if let errors = graphQLResult.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                print(graphQLResult)
                //                if let posts = graphQLResult.data?.getPostList {
                //                    // Handle posts
                //                } else if let errors = graphQLResult.errors {
                //                    // Handle errors
                //                }
            case .failure(let error):
                // Handle failure
                print("Error: \(error.localizedDescription)")
                print(error.localizedDescription)
                callback(.failure, error.localizedDescription)
            }
        }
    }
}


//MARK: ====================== Post like and unlike API call =============================
extension FeedVM {
    
    func PostLikeAndUnlikeApi(postId: String, isliked: Bool, userID: String, callback: @escaping (ResponseType, String) -> ()) {
        let postLikeAndUnlikeMutation = LikeAndUnlikePostMutation(postId: postId, isLiked: isliked, userId: userID)
        VidhikBaseURL.shared.apollo.perform(mutation: postLikeAndUnlikeMutation) { result in
            switch result {
                
            case .success(let likeResponse):
                guard let data = try? result.get().data else { return }
                if let postLike = data.resultMap["postLike"] as? [String: Any] {
                    guard let status = postLike["status"] as? Int else { return }
                    guard let message = postLike["message"] as? String else { return }
                    
                    if status == 200 {
                        callback(.success, message)
                    } else {
                        callback(.failure, message)
                    }
                } else if let errors = likeResponse.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
            
        }
    }
}
//MARK: ======== Post Comment API Calling ========
extension FeedVM {
    func postCommentApi(postID: String, lawyerID: String, textComment: String, callback: @escaping (ResponseType, String) -> ()) {
        let postComment = LawyerPostCommentMutation(lawyerId: lawyerID, postId: postID, commentText: textComment)
        VidhikBaseURL.shared.apollo.perform(mutation: postComment) { result in
            switch result {
                
            case .success(let postCommentResponse):
                guard let data = try? result.get().data else { return }
                if let postLike = data.resultMap["postComment"] as? [String: Any] {
                    guard let status = postLike["status"] as? Int else { return }
                    guard let message = postLike["message"] as? String else { return }
                   
                    if status == 200 {
                        print("--------------\(message)")
                        print("----------------\(status)")
                        callback(.success, message)
                    } else {
                        callback(.failure, message)
                    }
                } else if let errors = postCommentResponse.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
                
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
            
        }
        
    }
}

//MARK: ==================== Get Post Comment Api Call =================================
extension FeedVM {
    func getCommentPostApi(postID: String, callback: @escaping (ResponseType, String) -> ()) {
        let getPostComment = GetPostCommentMutation(postId: postID)
        VidhikBaseURL.shared.apollo.perform(mutation: getPostComment) { result in
            switch result {
                
            case .success(let getPostCommentResponse):
                guard let data = try? result.get().data else { return }
                if let getPostList = data.resultMap["getPostComment"] as? [String: Any] {
                    if let status = getPostList["status"] as? String,
                       let message = getPostList["message"] as? String,
                       let postData = getPostList["data"] as? [String: Any],
                        let postList = postData["commentList"] as? [[String: Any]] {
                        for dict in postList {
                            let lawyerId = dict["lawyerId"] as? String
                            let lawyerName = dict["lawyerName"] as? String
                            let location = dict["location"] as? String  ?? "Indore"
                            let commentText = dict["commentText"] as? String
                            let createdAt = dict["createdAt"] as? String
            
                            let post = CommentPostModel(lawyerId: lawyerId, lawyerName: lawyerName, location: location, commentText: commentText, createdAt: createdAt)
                                // Append the post to the posts array
                                self.commentPostModel.append(post)
                        }
                        print("postData\(String(describing: postData))")
                        if status == "200" {
                            callback(.success, message)
                        } else {
                            callback(.failure, message)
                        }
                    }
                    
                } else if let errors = getPostCommentResponse.errors {
                    print("GraphQL errors:", errors)
                } else {
                    print("Unexpected response format")
                }
               
            case .failure(let error):
                print("Error occurred: \(error.localizedDescription)")
                callback(.failure, error.localizedDescription)
            }
            
        }
    }
}

//mutation {
//  getPostComment(input:{
//
//    postId:"664dbee3776a77fe4d80d037"
//  }) {
//    status
//    message
//    data
//  }
//}

//"commentList": [
//          {
//            "lawyerId": "664c3d6247f1c381f40aac1d",
//            "lawyerName": "sid",
//            "location": "Madhya Pradesh",
//            "commentText": " Regional Transport Authority office on Wednesday announced a complete crackdown on the two aggregators",
//            "createdAt": "2024-05-22T10:54:50.524Z"
//          },
