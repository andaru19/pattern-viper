//
//  WebViewArticlePresenter.swift
//  VIPER-pattern
//
//  Created by Andaru on 18/07/23.
//  Copyright © 2023 Tootle. All rights reserved.
//

import Foundation

class WebViewArticlePresenter:ViewToPresenterWebViewArticleProtocol{
    
    var view: PresenterToViewWebViewArticleProtocol?
    
    var interactor: PresenterToInteractorWebViewArticleProtocol?
    
    var router: PresenterToRouterWebViewArticleProtocol?
    
}

extension WebViewArticlePresenter:InteractorToPresenterWebViewArticleProtocol{
    
    
    func webViewArticleFetchSuccess(detilArticleList: DetilArticleModel) {
        view?.onWebViewArticleResponseSuccess(detilArticleModelArrayList: detilArticleList)
    }
    
    func webViewArticleFetchFailed() {
        view?.onWebViewArticleResponseFailed(error: "Some Error message from api response")
    }
    
    
}
