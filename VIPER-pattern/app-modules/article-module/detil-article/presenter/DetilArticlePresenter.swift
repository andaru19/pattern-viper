//
//  DetilArticlePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import Foundation
import UIKit

class DetilArticlePresenter:ViewToPresenterDetilArticleProtocol{
    
    var view: PresenterToViewDetilArticleProtocol?
    
    var interactor: PresenterToInteractorDetilArticleProtocol?
    
    var router: PresenterToRouterDetilArticleProtocol?
    
    
    func showWebViewArticleController(navigationController: UINavigationController, detilArticleModel:ArticleModel) {
        router?.pushToWebViewArticleScreen(navigationConroller:navigationController, detilArticleModel:detilArticleModel)
    }
    
}

extension DetilArticlePresenter:InteractorToPresenterDetilArticleProtocol{
    
    func detilArticleFetchSuccess(detilArticleList: Array<DetilArticleModel>) {
        view?.onDetilArticleResponseSuccess(detilArticleModelArrayList: detilArticleList)
    }
    
    func detilArticleFetchFailed() {
        view?.onDetilArticleResponseFailed(error: "Some Error message from api response")
    }
    
    
}
