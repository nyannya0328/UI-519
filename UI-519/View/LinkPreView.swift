//
//  LinkPreView.swift
//  UI-519
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI
import LinkPresentation

struct LinkPreView: UIViewRepresentable {
    
    var metaData : LPLinkMetadata
   
    
    func makeUIView(context: Context) -> LPLinkView {
        
        let view = LPLinkView(metadata: metaData)
        
        return view
        
        
    }
    
    func updateUIView(_ uiView: LPLinkView, context: Context) {
        
        
        uiView.metadata = metaData
        
    }
}

