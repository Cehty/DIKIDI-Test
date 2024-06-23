//
//  ContentView.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import SwiftUI

struct ShahreView: View {
    
    @State private var viewModel: ShahreViewModel
    
    init(_ viewModel: ShahreViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            VStack(alignment: .leading, spacing: 0) {
                ZStack {
                    AsyncImage(url: URL(string: viewModel.icon)) { image in
                        image.resizable()
                            .frame(width: 300, height: 148)
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Color.white.opacity(0.2)
                    }
                }
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(viewModel.name)
                            .font(.system(size: 18, weight: .medium))
                            .lineLimit(2)
                        Spacer()
                    }
                    Spacer()
                }
                .frame(height: 60)
                .padding([.horizontal, .top], 16)
                
                
                HStack(spacing: 12) {
                    AsyncImage(url: URL(string: viewModel.image)) { image in
                        image.resizable()
                    } placeholder: {
                        Color.white.opacity(0.2)
                    }
                    .frame(width: 46, height: 46)
                    .clipShape(.rect(cornerRadius: 12))
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(viewModel.companyName)
                            .font(.system(size: 18, weight: .medium))
                        Text(viewModel.comanyAddress)
                            .font(.system(size: 15, weight: .regular))
                            .foregroundStyle(.white.opacity(0.6))
                            .lineLimit(1)
                    }
                }
                .padding(.bottom, 16)
                .padding(.horizontal, 14)
            }
            
            VStack(spacing: 0) {
                HStack {
                    HStack {
                        Text("\(viewModel.discountValue) %")
                            .font(.system(size: 13, weight: .medium))
                    }
                    .frame(height: 24)
                    .padding(.horizontal, 10)
                    .background(Color.red.opacity(0.9)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    )
                    Spacer()
                }
                .padding(10)
                
                Spacer()
                
                HStack {
                    HStack {
                        Text("\(viewModel.timeStop)")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.black.opacity(0.83))
                    }
                    .frame(height: 24)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.6)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    )
                    Spacer()
                    HStack(spacing: 5) {
                        Image(systemName: "eye")
                            .foregroundColor(.black.opacity(0.6))
                        Text("\(viewModel.view)")
                            .font(.system(size: 13, weight: .medium))
                            .foregroundColor(.black.opacity(0.83))
                    }
                    .frame(height: 24)
                    .padding(.horizontal, 10)
                    .background(Color.white.opacity(0.6)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                    )
                }
                .padding(10)
            }
            .frame(height: 148)
        }
        .frame(width: 300)
        .background(.backView)
        .cornerRadius(12)
    }
}

#Preview {
    ShahreView(
        .init(
            image: "https://f1.test.dikidi.ru/c1/v11/58uetjrqvp.jpg?size=q",
            icon: "https://f1.test.dikidi.ru/c1/v11/j0lnl3mvpd.jpg",
            name: "1sdsasasdsadasdasdasdassdd",
            timeStop: "до 30 июня",
            discountValue: "50",
            companyName: "SANDLER Lab",
            comanyAddress: "Большая Филёвская, 37, стр 1",
            view: "3"
        )
    )
}
