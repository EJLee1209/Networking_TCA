//
//  ContentView.swift
//  Alamofire_TCA
//
//  Created by 이은재 on 2023/04/30.
//

import SwiftUI
import ComposableArchitecture

struct ContentView: View {
    let store: StoreOf<PostFeature>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            NavigationView {
                ZStack{
                    List {
                        ForEach(viewStore.posts , id:\.id) { post in
                            NavigationLink {
                                PostDetailView(
                                    post: post,
                                    store: viewStore
                                )
                            } label: {
                                Text(post.title)
                            }
                        }
                    }
                    .onAppear{
                        viewStore.send(.attachPosts)
                    }
                    .refreshable {
                        viewStore.send(.attachPosts)
                    }
                    .navigationTitle("TCA 통신 예제")
                    
                    if viewStore.isLoading {
                        ProgressView()
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(
            store: Store(
                initialState: PostFeature.State(),
                reducer: PostFeature()
            )
        )
    }
}
