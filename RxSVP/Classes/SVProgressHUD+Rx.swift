//    MIT License
//
//    Copyright (c) 2021 梁大红
//
//    Permission is hereby granted, free of charge, to any person obtaining a copy
//    of this software and associated documentation files (the "Software"), to deal
//    in the Software without restriction, including without limitation the rights
//    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//    copies of the Software, and to permit persons to whom the Software is
//    furnished to do so, subject to the following conditions:
//
//    The above copyright notice and this permission notice shall be included in all
//    copies or substantial portions of the Software.
//
//    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//    SOFTWARE.

import UIKit
import RxSwift
import RxCocoa
import class SVProgressHUD.SVProgressHUD

extension Reactive where Base: SVProgressHUD {
    
    // MARK: loding
    
    public static var loading: Binder<String> {
        .init(UIApplication.shared) { Base.show(withStatus: $1) }
    }
    
    public static func loading(status: String? = nil) -> Binder<()> {
        .init(UIApplication.shared, binding: { _, _ in Base.show(withStatus: status) })
    }
    
    // MARK: toast
    
    public static var info: Binder<String> {
        .init(UIApplication.shared) { Base.showInfo(withStatus: $1) }
    }
    
    public static func info(status: String? = nil) -> Binder<()> {
        .init(UIApplication.shared, binding: { _, _ in Base.showInfo(withStatus: status) })
    }
    
    public static var error: Binder<String> {
        .init(UIApplication.shared) { Base.showError(withStatus: $1) }
    }
    
    public static func error(status: String? = nil) -> Binder<()> {
        .init(UIApplication.shared, binding: { _, _ in Base.showError(withStatus: status) })
    }
    
    public static var success: Binder<String> {
        .init(UIApplication.shared) { Base.showSuccess(withStatus: $1) }
    }
    
    public static func success(status: String? = nil) -> Binder<()> {
        .init(UIApplication.shared, binding: { _, _ in Base.showSuccess(withStatus: status) })
    }
    
    // MARK: progress
    
    public static var progress: Binder<Float> {
        .init(UIApplication.shared) { Base.showProgress($1) }
    }
    
    public static func progress(progress: Float, status: String? = nil) -> Binder<()> {
        .init(UIApplication.shared) { _,_ in Base.showProgress(progress, status: status) }
    }
    
    // MARK: dismiss
    
    public static var dismiss: Binder<()> {
        .init(UIApplication.shared) { _,_ in Base.dismiss() }
    }
}
