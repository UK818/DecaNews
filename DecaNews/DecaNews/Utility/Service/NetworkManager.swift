//
//  NetworkCall.swift
//  DecaNews
//
//  Created by mac on 09/02/2022.
//

import UIKit

typealias SuccessBlock = ((Base) -> Void)?
typealias ErrorBlock = ((String) -> Void)?

protocol NetworkManagerRepository {
    func networkRequest(url: String, successCompletion: SuccessBlock, errorCompletion: ErrorBlock)
    func getRapidNews(request: NSMutableURLRequest, successCompletion: ((Rapid) -> Void)?, errorCompletion: ((String) -> Void)?)
}

class NetworkManager: NetworkManagerRepository {
    
    //	static var shared = NetworkManager()
    
    var successResponse: SuccessBlock!
    var errorResponse: ErrorBlock!
    
    init() { }
    
    public func getRapidNews(request: NSMutableURLRequest, successCompletion: ((Rapid) -> Void)?, errorCompletion: ((String) -> Void)?) {
        URLSession.shared.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if let error = error {
                errorCompletion?(error.localizedDescription)
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Rapid.self, from: data)
                    successCompletion?(response)
                } catch let error {
                    errorCompletion?(error.localizedDescription)
                }
            }
        }).resume()
    }
    
    public func networkRequest(url: String, successCompletion: SuccessBlock, errorCompletion: ErrorBlock) {
        guard let urlMain = URL(string: url) else {
            return
        }
        URLSession.shared.dataTask(with: urlMain) { data, _, error in
            if let error = error {
                errorCompletion?(error.localizedDescription)
            }
            if let data = data {
                do {
                    let response = try JSONDecoder().decode(Base.self, from: data)
                    successCompletion?(response)
                } catch let error {
                    errorCompletion?(error.localizedDescription)
                }
            }
        }.resume()
    }
}
