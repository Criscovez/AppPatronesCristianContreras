//
//  NetworkError.swift
//  AppPatronesCristianContreras
//
//  Created by Cristian Contreras Velásquez on 26-01-24.
//

import Foundation

enum NetworkError: Error {
    case malformedURL
    case dataFormatting
    case other
    case noData
    case errorCode(Int?)
    case tokenFormatError
    case decoding
}
