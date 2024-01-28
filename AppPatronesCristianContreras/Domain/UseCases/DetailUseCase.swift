//
//  DetailUseCase.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 27-01-24.
//

import Foundation

//MARK: - PROTOCOLO HOME USE CASE
protocol DetailUseCaseProtocol {
    func getHeroes(name: String, onSuccess: @escaping ([HeroModel]) -> Void, onError: @escaping (NetworkError) -> Void)
}

//MARK: - CLASE HOMEUSECASE que conforma el protocolo de arriba
final class DetailUseCase: DetailUseCaseProtocol {
    func getHeroes(name: String, onSuccess: @escaping ([HeroModel]) -> Void, onError: @escaping (NetworkError) -> Void) {
     
        //Comprobar URl
        guard let url = URL(string: "\(EndPoints.url.rawValue)\(EndPoints.allHeros.rawValue)") else {
            onError(.malformedURL)
            return
        }
        
        //Check token
        guard let token = UserDefaultsHelper.getToken() else {
            onError(.tokenFormatError)
            return
        }
        
        
        //Crear REQUEST
        //TODO: - Obtener el token de algun lado
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = HTTPMethods.post
        urlRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        urlRequest.setValue(HTTPMethods.contentType, forHTTPHeaderField: "Content-Type")
        
        //Body
        struct HeroRequest: Encodable {
            let name: String
        }
        
        let heroRequest = HeroRequest(name: name)
        urlRequest.httpBody = try? JSONEncoder().encode(heroRequest)
        
        //TASK
        let task = URLSession.shared.dataTask(with: urlRequest) { data, response, error in
            //Check Error
            guard error == nil else {
                onError(.other)
                return
            }
            
            //Check Data
            guard let data = data else {
                onError(.noData)
                return
            }
            
            //Check response
            guard let httpResponse = (response as? HTTPURLResponse),
                  httpResponse.statusCode == HTTPResponseCodes.SUCCESS else {
                onError(.errorCode((response as? HTTPURLResponse)?.statusCode))
                return
            }
            
            guard let heroResponse = try? JSONDecoder().decode([HeroModel].self, from: data) else {
                onError(.decoding)
                return
            }
            
            onSuccess(heroResponse)
        }
        task.resume()
    }
}

//MARK: - Fake Success
final class DetailUseCaseFakeSuccess: DetailUseCaseProtocol {
    func getHeroes(name: String, onSuccess: @escaping ([HeroModel]) -> Void, onError: @escaping (NetworkError) -> Void) {

        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            let heroes = [HeroModel(id: "1", name: "Diego", description: "Superman", photo: "", favorite: true)]
            
            onSuccess(heroes)
        }
    }
}

//MARK: - Fake Error
final class DetailUseCaseFakeError: DetailUseCaseProtocol {
    func getHeroes(name: String, onSuccess: @escaping ([HeroModel]) -> Void, onError: @escaping (NetworkError) -> Void) {
 
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            onError(.noData)
        }
    }
}
