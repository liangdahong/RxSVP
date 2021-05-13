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
import NSObject_Rx
import SVProgressHUD
import RxSVP

class ViewController: UIViewController {
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var infoButton: UIButton!
    @IBOutlet weak var errorButton: UIButton!
    @IBOutlet weak var succesButton: UIButton!
    @IBOutlet weak var dismissButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.rx.text.orEmpty
            .filter { $0.count > 5 }
            .map { _ in () }
            .bind(to: SVProgressHUD.rx.info(status: "密码不可以大于 5 位"))
            .disposed(by: rx.disposeBag)
        
        loginButton.rx.tap
            .bind(to: SVProgressHUD.rx.loading(status: "登录中..."))
            .disposed(by: rx.disposeBag)
        
        infoButton.rx.tap
            .map { _ in "请登录" }
            .bind(to: SVProgressHUD.rx.info)
            .disposed(by: rx.disposeBag)
        
        errorButton.rx.tap
            .map { _ in "网络错误" }
            .bind(to: SVProgressHUD.rx.error)
            .disposed(by: rx.disposeBag)
        
        succesButton.rx.tap
            .bind(to: SVProgressHUD.rx.success(status: "登录成功"))
            .disposed(by: rx.disposeBag)
        
        dismissButton.rx.tap
            .bind(to: SVProgressHUD.rx.dismiss)
            .disposed(by: rx.disposeBag)
    }
}
