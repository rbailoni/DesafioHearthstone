//
//  ResponseError.swift
//  DesafioHearthstone
//
//  Created by Ricardo Bailoni on 09/04/20.
//  Copyright © 2020 Ricardo Bailoni. All rights reserved.
//

import UIKit

enum ResponseError: Error {
    case noAvailableData
    case invalidJSONDecoder
    case invalidURL
    case emptyCards
}

extension ResponseError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noAvailableData:
            return NSLocalizedString("Dados Indisponíveis", comment: "No Available Data")
        case .invalidJSONDecoder:
            return NSLocalizedString("As informações retornadas estão incorretas", comment: "Invalid JSON Decode")
        case .invalidURL:
            return NSLocalizedString("URL Inválida", comment: "Invalid URL")
        case .emptyCards:
            return NSLocalizedString("Cards indisponíveis para esse Deck", comment: "Empty Cards")
        }
    }
}
