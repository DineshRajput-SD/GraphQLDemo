//
//  API.swift
//  Vidhik
//
//  Created by Dinesh Rajput on 09/04/24.
//

import Foundation
import Apollo

public class VidhikBaseURL {
    
    static let shared = VidhikBaseURL()
    
    private(set) lazy var apollo: ApolloClient = {
        let token = UserDefaults.standard.string(forKey: "accessToken") ?? ""
        //let url = URL(string: "http://192.168.29.161:3000/graphql")!// Roshani
        let url = URL(string: "http://192.168.29.114:3000/graphql")!// Aditya
      //  let url = URL(string: "http://192.168.29.74:3000/graphql")!//Shivank
        // let url = URL(string: "http://192.168.10.29:5001/graphql")!// Dummy
        
        let configuration = URLSessionConfiguration.default
        
        configuration.httpAdditionalHeaders = ["authorization": "Bearer \(APIKeys.accessToken)"]
        configuration.httpAdditionalHeaders = ["diviceType": APIKeys.deviceType]
        configuration.httpAdditionalHeaders = ["timezone": APIKeys.timezone]
        configuration.httpAdditionalHeaders = ["appVersion": APIKeys.appVersion]
        
        let client = URLSessionClient(sessionConfiguration: configuration)
        let store = ApolloStore(cache: InMemoryNormalizedCache())
        let provider = LegacyInterceptorProvider(client: client, store: store)
        print("APIKeys.accessToken:\(APIKeys.accessToken)")
        print("APIKeys.appVersion:\(APIKeys.appVersion)")
        print("APIKeys.userLoggedIn:\(APIKeys.userLoggedIn)")
        
        let networkTransport = RequestChainNetworkTransport(interceptorProvider: provider, endpointURL: url)
        return ApolloClient(networkTransport: networkTransport, store: store)
    }()
    
}
