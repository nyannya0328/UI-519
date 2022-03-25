//
//  Home.swift
//  UI-519
//
//  Created by nyannyan0328 on 2022/03/25.
//

import SwiftUI

struct Home: View {
    @StateObject var model = LinkViewModel()
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false) {
                
                
                VStack{
                    
                    ForEach(model.messages){msg in
                        
                        CardView(msg: msg)
                    }
                    
                    
                }
                
                
            }
            .safeAreaInset(edge: .bottom, content: {
                
                HStack{
                    
                    
                    TextField("Enter", text: $model.text)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.none)
                        .disableAutocorrection(true)
                    
                    Button {
                        
                       
                            
                        model.sendMessage()
                  
                        
                    } label: {
                     Image(systemName: "paperplane.fill")
                            
                    }
                    .disabled(model.text == "")
            

                }
                .padding()
                .padding(.top)
                .background(.ultraThinMaterial)
                
                
                
            })
            .navigationTitle("Link Preview")
        }
    }
    @ViewBuilder
    func CardView(msg : Message)->some View{
        
        Group{
            
            
            if msg.preViewIsLoading{
                
                Group{
                    
                    
                    if let metaData = msg.linkMetaData{
                        
                        
                        LinkPreView(metaData: metaData)
                            .aspectRatio(contentMode: .fit)
                            .frame(width: getScreenBounds().width, alignment: .trailing)
                            .cornerRadius(10)
                            
                        
                        
                    }
                    else{
                        
                        
                        HStack(spacing:10){
                            
                            
                            
                            Text(msg.linkURL?.host ?? "")
                                
                            
                            ProgressView()
                            
                            
                            
                        }
                        .padding(.vertical,10)
                        .padding(.horizontal)
                        .cornerRadius(10)
                        .background(.ultraThinMaterial)
                        
                        
                    }
                    
                }
                
                
            }
            else{
                
                
                Text(msg.messageString)
                    .padding(.vertical)
                    .padding(.horizontal,10)
                    .foregroundColor(.white)
                    .background(.blue)
                    .frame(width: getScreenBounds().width - 80, alignment: .trailing)
                    .cornerRadius(10)
                  
                
                
                
            }
        }
        
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension View{
    
    func getScreenBounds()->CGRect{
        
        UIScreen.main.bounds
    }
}
