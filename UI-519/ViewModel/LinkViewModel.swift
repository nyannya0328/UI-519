//
//  LinkViewModel.swift
//  UI-519
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI
import LinkPresentation

class LinkViewModel: ObservableObject {
    
    @Published var text : String = ""
    
    @Published var messages : [Message] = []
        
        
    func sendMessage(){
        
        if !isMessage(){
            
            
            addToMessage()
            return
        }
        
        guard let url = URL(string: text) else{return}
        
        let urlMessage = Message(messageString: text,preViewIsLoading: true, linkURL: url)
        
        
        messages.append(urlMessage)
        
        
        let proVider = LPMetadataProvider()
        
        proVider.startFetchingMetadata(for: url) { meta, err in
            
            
            DispatchQueue.main.async {
                
                
                self.text = ""
                
                if let _ = err{
                    
                    self.addToMessage()
                    return
                    
                }
                
                guard let meta = meta else {
                    self.addToMessage()
                    return
                }
                
                
                if let index = self.messages.firstIndex(where: { message in
                    
                    
                    return urlMessage.id == message.id
                }){
                    
                    
                    self.messages[index].linkMetaData = meta
                }

                
            }
        }
        
        
    }
    
    
    
    func isMessage()->Bool{
        
        if let url = URL(string: text){
            
            UIApplication.shared.canOpenURL(url)
            
        }
        return false
    }
    
    
    func addToMessage(){
        
        messages.append(Message(messageString: text))
        text = ""
    }
        
}


