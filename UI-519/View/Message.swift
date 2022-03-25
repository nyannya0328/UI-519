//
//  Message.swift
//  UI-519
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI
import LinkPresentation

struct Message: Identifiable {
    var id = UUID().uuidString
    var messageString : String
    var date : Date = Date()
    var preViewIsLoading : Bool = false
    var linkMetaData : LPLinkMetadata?
    var linkURL : URL?
}
