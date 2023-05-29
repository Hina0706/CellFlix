//
//  APICaller.swift
//  CellFlix
//
//  Created by Hina Feng on 2023/5/22.
//

import Foundation

struct Constants{
    static let API_KEY = "e206028265e947eede550f2318b31895"
    static let baseURL = "https://api.themoviedb.org"
}
enum APIError: Error{
    case failedTogetData
}
class APICaller{
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Title], Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTrendingTvs(completion: @escaping (Result<[Title], Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/tv/day?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)) {data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getUpcomingMovies(completion: @escaping(Result<[Title], Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){data,_,error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getPopular(completion: @escaping(Result<[Title], Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){data,_,error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
    
    func getTopRated(completion: @escaping(Result<[Title], Error>)->Void){
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)")else {return}
        let task = URLSession.shared.dataTask(with: URLRequest(url:url)){data,_,error in
            guard let data = data, error == nil else{
                return
            }
            do{
                let results = try JSONDecoder().decode(TrendingTitleResponse.self, from: data)
                completion(.success(results.results))
            }
            catch{
                completion(.failure(APIError.failedTogetData))
            }
        }
        task.resume()
    }
}
