//
//  PostDetailView.swift
//  Networking_TCA
//
//  Created by 이은재 on 2023/05/02.
//

import SwiftUI
import ComposableArchitecture

struct PostDetailView: View {
    var post: Post // 게시물
    var store: ViewStore<PostFeature.State, PostFeature.Action>
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Image(systemName: "person.crop.circle")
                        .font(.system(size: 30))
                    VStack(alignment: .leading) {
                        Text(store.user?.name ?? "")
                        Text(store.user?.email ?? "")
                            .font(.system(size: 12))
                    }
                }
                Divider()
                Text(post.body)
                    .font(.system(size: 16))
                Divider()
                
                Text("Comments")
                    .font(.system(size: 12))
                
                List {
                    ForEach(store.comments, id: \.id) { comment in
                        CommentItem(comment: comment)
                    }
                }.listStyle(.plain)
                
                Divider().frame(height: 0).opacity(0)
            }
            .onAppear {
                store.send(.attachUser(post.userId))
                store.send(.attachComments(post.id))
            }
            if store.isLoading {
                ProgressView()
            }
        }
    }
}

struct PostDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PostDetailView(
            post: .mock,
            store: ViewStore(Store(initialState: PostFeature.State(), reducer: PostFeature()))
        )
    }
}
