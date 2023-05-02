//
//  CommentItem.swift
//  Networking_TCA
//
//  Created by 이은재 on 2023/05/02.
//

import SwiftUI

struct CommentItem: View {
    var comment: Comment
    var body: some View {
        HStack {
            Image(systemName: "person.crop.circle")
                .font(.system(size: 30))
            VStack(alignment:.leading) {
                Text(comment.name)
                    .font(.system(size: 13))
                Text(comment.body)
                    .font(.system(size: 13))
            }
            Spacer()
        }
    }
}

struct CommentItem_Previews: PreviewProvider {
    static var previews: some View {
        CommentItem(comment: .mock)
    }
}
