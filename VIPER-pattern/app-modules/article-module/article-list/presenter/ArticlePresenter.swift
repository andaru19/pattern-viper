//
//  ArticlePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import Foundation
import UIKit

class ArticlePresenter:ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?
    
    var interactor: PresenterToInteractorProtocol?
    
    var router: PresenterToRouterProtocol?
    
    func startFetchingArticle(category:String) {
        interactor?.fetchArticle(category: category)
    }
    
    func showDetilArticleController(navigationController: UINavigationController, detilArticleModel:ArticleModel) {
        router?.pushToDetilArticleScreen(navigationConroller:navigationController, detilArticleModel:detilArticleModel)
    }

}

extension ArticlePresenter: InteractorToPresenterProtocol{
    
    func articleFetchedSuccess(articleModelArray: Array<ArticleModel>) {
        view?.showArticle(articleArray: articleModelArray)
    }
    
    func articleFetchFailed() {
        view?.showError()
    }
    
    
}
