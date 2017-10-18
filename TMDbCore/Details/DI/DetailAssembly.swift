//
//  DetailAssembly.swift
//  TMDbCore
//
//  Created by Guille Gonzalez on 30/09/2017.
//  Copyright © 2017 Guille Gonzalez. All rights reserved.
//

import Foundation

final class DetailAssembly {
	private let imageLoadingAssembly: ImageLoadingAssembly
	private let navigationController: UINavigationController
	private let webServiceAssembly: WebServiceAssembly

	init(imageLoadingAssembly: ImageLoadingAssembly,
	     navigationController: UINavigationController,
	     webServiceAssembly: WebServiceAssembly) {
		self.imageLoadingAssembly = imageLoadingAssembly
		self.navigationController = navigationController
		self.webServiceAssembly = webServiceAssembly
	}

	func detailHeaderPresenter() -> DetailHeaderPresenter {
		return DetailHeaderPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func posterStripPresenter() -> PosterStripPresenter {
		return PosterStripPresenter(imageRepository: imageLoadingAssembly.imageRepository)
	}

	func detailNavigator() -> DetailNavigator {
		return PhoneDetailNavigator(navigationController: navigationController,
		                            viewControllerProvider: self)
	}

	func moviePresenter(identifier: Int64) -> DetailPresenter {
		return MoviePresenter(repository: movieRepository(),
		                      dateFormatter: webServiceAssembly.dateFormatter,
		                      identifier: identifier,
                              navigator: detailNavigator())
	}

	func movieRepository() -> MovieRepositoryProtocol {
		return MovieRepository(webService: webServiceAssembly.webService)
	}
    
    func showPresenter(identifier: Int64) -> DetailPresenter {
        return ShowPresenter(repository: showRepository(),
                              dateFormatter: webServiceAssembly.dateFormatter,
                              identifier: identifier,
                              navigator: detailNavigator())
    }
    
    func showRepository() -> ShowRepositoryProtocol {
        return ShowRepository(webService: webServiceAssembly.webService)
    }
    
    func personPresenter(identifier: Int64) -> DetailPresenter {
        return PersonPresenter(repository: personRepository(),
                               dateFormatter: webServiceAssembly.dateFormatter,
                               identifier: identifier,
                               navigator: detailNavigator())
    }
    
    func personRepository() -> PersonRepositoryProtocol {
        return PersonRepository(webService: webServiceAssembly.webService)
    }
}

extension DetailAssembly: DetailViewControllerProvider {
	func detailViewController(identifier: Int64, mediaType: MediaType) -> UIViewController {
		let presenter: DetailPresenter

		switch mediaType {
		case .movie:
			presenter = moviePresenter(identifier: identifier)
        case .show:
            presenter = showPresenter(identifier: identifier)
        case .person:
            presenter = personPresenter(identifier: identifier)
		}
        
		return DetailViewController(presenter: presenter,
		                            headerPresenter: detailHeaderPresenter(),
		                            posterStripPresenter: posterStripPresenter())
	}
}
