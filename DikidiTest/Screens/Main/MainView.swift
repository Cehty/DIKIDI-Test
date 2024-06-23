//
//  ContentView.swift
//  DikidiTest
//
//  Created by Poet on 20.06.2024.
//

import SwiftUI

struct MainView: View {
  
	@State private var viewModel: MainViewModel
	@State private var searchText = ""
	
	init(for viewModel: MainViewModel) {
		self.viewModel = viewModel
	}
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 12) {
				setupCategoriesSection()
                setupVipSection()
                setupSharesSection()
				setupPopularSection()
				setupCertificatesSection()
				setupExamplesSection()
				setupNewsSection()
            }
        }
        .task {
			await viewModel.loadView()
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            minHeight: 0,
            maxHeight: .infinity,
            alignment: .center
        )
		.safeAreaInset(edge: .top) {
			setupTopView()
}
        .background(.backMain)
        .coordinateSpace(name: "SCROLL")
    }
	
	@ViewBuilder
	func setupTopView() -> some View {
		VStack(alignment: .center, spacing: 12) {
			Text("Главная")
				.foregroundStyle(.white)
				.font(.system(size: 18, weight: .regular))
			
			HStack(alignment: .center, spacing: 5) {
				Spacer()
				Text("Москва")
					.foregroundStyle(.white)
					.font(.system(size: 16, weight: .regular))
				
				Image(systemName: "chevron.right")
					.resizable()
					.frame(width: 5, height: 10)
				Spacer()
			}
		}
		.frame(height: 50)
		.padding(.vertical, 16)
		.background(.backTopView)
	}
	
	@ViewBuilder
	func setupCategoriesSection() -> some View {
		VStack(alignment: .center, spacing: 16) {
			HStack {
				Text("Категории")
					.foregroundStyle(.white)
					.font(.system(size: 20, weight: .bold))
				
				Text("?")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 20, weight: .medium))
				
				Spacer()
			}
			
			VStack {
				Text("Недостаточно данных")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 16, weight: .medium))
			}
		}
		.padding([.top, .leading], 16)
	}
    
    @ViewBuilder
    func setupVipSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Премиум")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                Text("\(viewModel.vipViewModels.count)")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 20, weight: .medium))
            }
            
            VStack(spacing: 0) {
                VStack(spacing: 0) {
                    ForEach(viewModel.vipViewModels) { viewModel in
                        VipView(viewModel)
                    }
                }
                .padding(.vertical, 2)
                .background(Color.backView
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                )
            }
        }
		.padding(.top, 10)
        .padding(.horizontal, 16)
        
    }
    
    @ViewBuilder
    func setupSharesSection() -> some View {
        VStack(alignment: .leading, spacing: 16) {
            HStack {
                Text("Акции")
                    .foregroundStyle(.white)
                    .font(.system(size: 20, weight: .bold))
                
                Text("\(viewModel.shareViewModels.count)")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.system(size: 20, weight: .medium))
                
                Spacer()
                
                Button {
                    
                } label: {
                    Text("См. все")
                        .padding(.trailing, 16)
                        .font(.system(size: 18, weight: .medium))
                }
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ForEach(viewModel.shareViewModels) { viewModel in
                        ShahreView(viewModel)
                            .frame(width: 300)
                    }
                }
            }
        }
        .padding([.top, .leading], 16)
    }
	
	@ViewBuilder
	func setupPopularSection() -> some View {
		VStack(alignment: .center, spacing: 16) {
			HStack {
				Text("Популярные")
					.foregroundStyle(.white)
					.font(.system(size: 20, weight: .bold))
				
				Text("?")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 20, weight: .medium))
				
				Spacer()
			}
			
			VStack {
				Text("Недостаточно данных")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 16, weight: .medium))
			}
		}
		.padding([.top, .leading], 16)
	}
	
	@ViewBuilder
	func setupCertificatesSection() -> some View {
		VStack(alignment: .center, spacing: 16) {
			HStack {
				Text("Сертификаты")
					.foregroundStyle(.white)
					.font(.system(size: 20, weight: .bold))
				
				Spacer()
			}
			
			VStack {
				Text("Недостаточно данных")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 16, weight: .medium))
			}
			
			Button {
				
			} label: {
				HStack {
					Spacer()
					Text("Выбрать сертификат")
						.font(.system(size: 18, weight: .regular))
						.lineLimit(1)
					Spacer()
				}
			}
			.frame(height: 44)
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(.blue, lineWidth: 1)
			)
			.padding(.trailing, 16)
		}
		.padding([.top, .leading], 16)
	}
	
	@ViewBuilder
	func setupExamplesSection() -> some View {
		VStack(alignment: .center, spacing: 16) {
			HStack {
				Text("Примеры робот")
					.foregroundStyle(.white)
					.font(.system(size: 20, weight: .bold))
				
				Spacer()
			}
			
			AsyncImage(url: URL(string: viewModel.example)) { image in
				image.resizable()
					.scaledToFit()
			} placeholder: {
				Color.white.opacity(0)
			}
			.clipShape(.rect(cornerRadius: 12))
			
			Button {
				
			} label: {
				HStack {
					Spacer()
					Text("Выбрать фото")
						.font(.system(size: 18, weight: .regular))
						.lineLimit(1)
					Spacer()
				}
			}
			.frame(height: 44)
			.overlay(
				RoundedRectangle(cornerRadius: 10)
					.stroke(.blue, lineWidth: 1)
			)
			.padding(.trailing, 16)
		}
		.padding([.top, .leading], 16)
	}
	
	@ViewBuilder
	func setupNewsSection() -> some View {
		VStack(alignment: .center, spacing: 16) {
			HStack {
				Text("Новые")
					.foregroundStyle(.white)
					.font(.system(size: 20, weight: .bold))
				
				Text("?")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 20, weight: .medium))
				
				Spacer()
			}
			
			VStack {
				Text("Недостаточно данных")
					.foregroundStyle(.white.opacity(0.5))
					.font(.system(size: 16, weight: .medium))
			}
		}
		.padding([.top, .leading], 16)
	}
}

#Preview {
	MainView(for: .init())
}
