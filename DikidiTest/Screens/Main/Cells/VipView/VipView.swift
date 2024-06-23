//
//  ContentView.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import SwiftUI

struct VipView: View {
    
    @State private var viewModel: VipViewModel
    
    init(_ viewModel: VipViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack {
            HStack(spacing: 14) {
                AsyncImage(url: URL(string: viewModel.image)) { image in
                    image.resizable()
                } placeholder: {
                    Color.white.opacity(0)
                }
                .frame(width: 60, height: 60)
                .clipShape(.rect(cornerRadius: 12))
                
                VStack(alignment: .leading, spacing: 3) {
                    Text(viewModel.name)
                        .font(.system(size: 18, weight: .medium))
																								.lineLimit(2)
                    Text(viewModel.categories.joined(separator: ", "))
                        .font(.system(size: 12, weight: .regular))
                        .foregroundStyle(.white.opacity(0.6))
																								.lineLimit(2)
                }
                
                Spacer()
                
                Button {
                    
                } label: {
                    HStack {
                        Text("Записаться")
                            .font(.system(size: 13, weight: .regular))
																												.lineLimit(1)
                    }
//																				.padding(.horizontal, 12)
                    .frame(width: 94, height: 32)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.blue, lineWidth: 1)
                    )
                }
            }
            
            if viewModel.isShowDivider {
					Divider()
					.foregroundStyle(Color.white.opacity(0.2))
            }
        }
        .padding(.horizontal, 14)
        .padding(.top, 8)
        .padding(.bottom, viewModel.isShowDivider ? 2 : 10)
    }
}

#Preview {
    VipView(
        .init(
            for: .init(
                id: "asddd",
                image: .init(
                    thumb: "",
                    origin: "https://api-beauty.test.dikidi.ru/assets/images/beauty_app/first4.png"
                ),
                name: "Ногти",
                categories: ["Ногтевой сервис", "Сауна"], 
                award: nil,
                vipTariff: false
            ),
            isShowDivider: false
        )
    )
}
