//
//  Extensions.swift
//  prueba camilo lillo
//
//  Created by Camilo Lillo on 24-05-21.
//

import Foundation
import UIKit
import Alamofire

// MARK: -  Typealias
typealias CompletionHandler = (()->Void)?
typealias SuccessHandler<T> = ((T) -> Void)?

// MARK: - Storyboardable
protocol Storyboardable: AnyObject {
    static var defaultStoryboardName: String { get }
}

extension Storyboardable where Self: UIViewController {
    static var defaultStoryboardName: String {
        let selfName = String(describing: self)
        return selfName.replacingOccurrences(of: "ViewController", with: "")
    }
    
    static func storyboardViewController() -> Self {
        let storyboard = UIStoryboard(name: defaultStoryboardName, bundle: nil)
        
        guard let vc = storyboard.instantiateInitialViewController() as? Self else {
            fatalError("Could not instantiate initial storyboard with name: \(defaultStoryboardName)")
        }
        
        return vc
    }
}

extension UIViewController: Storyboardable { }

extension UIViewController {
    
    var safeAreaHeight: CGFloat { return view.safeAreaLayoutGuide.layoutFrame.size.height }
    var screenHeight: CGFloat { return UIScreen.main.bounds.height }
    var screenWidth: CGFloat { return UIScreen.main.bounds.width }
    
    func displayOneButtonAlert(title: String, message: String, handler: CompletionHandler = nil) {
        let alertController = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let alertAction = UIAlertAction(
            title : "Aceptar",
            style : .destructive
        ) {
            action in
            handler?()
        }
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true)
    }
    
    func setNavigationBar(tintColor: UIColor? = nil, titleColor: UIColor? = nil, titleFont: UIFont? = nil, leftBarButtomItemTintColor: UIColor? = nil, rightBarButtomItemTintColor: UIColor? = nil, barButtonItemFont: UIFont? = nil, hasShadow: Bool = true, isTranslucent: Bool = true) {

        guard let navigationBar = navigationController?.navigationBar else { return }

        navigationBar.isTranslucent = isTranslucent
        
        if !hasShadow {
            navigationBar.setBackgroundImage(UIImage(), for: .default)
            navigationBar.shadowImage = UIImage()
        }
        
        if let barTintColor = tintColor { navigationBar.barTintColor = barTintColor }
        
        if let titleColor = titleColor {
            if navigationBar.titleTextAttributes != nil { navigationBar.titleTextAttributes?[.foregroundColor] = titleColor }
            else { navigationBar.titleTextAttributes = [.foregroundColor: titleColor] }
        }

        if let titleFont = titleFont {
            if navigationBar.titleTextAttributes != nil { navigationBar.titleTextAttributes?[.font] = titleFont }
            else { navigationBar.titleTextAttributes = [.font: titleFont] }
        }
        
        if let leftItem = navigationItem.leftBarButtonItem {
            if let leftBarButtomItemTintColor = leftBarButtomItemTintColor { leftItem.tintColor = leftBarButtomItemTintColor }
            
            if let barButtonItemFont = barButtonItemFont {
                leftItem.setTitleTextAttributes(
                    [.font: barButtonItemFont],
                    for: .normal
                )
            }
        }

        if let rightItem = navigationItem.rightBarButtonItem {
            if let rightBarButtomItemTintColor = rightBarButtomItemTintColor { rightItem.tintColor = rightBarButtomItemTintColor }

            if let barButtonItemFont = barButtonItemFont {
                rightItem.setTitleTextAttributes(
                    [.font: barButtonItemFont],
                    for: .normal
                )
            }
        }
    }
}

//MARK:- IS RUT

extension String {
    
    static let empty = ""
    
    func getRutDv(value: String) -> (run: String, dv: String) {
        if (value.isEmpty || value.count < 2) { return (.empty, .empty) }
        
        var rut = value.replacingOccurrences(of: ".", with: "", options: NSString.CompareOptions.literal, range: nil)
        rut = rut.replacingOccurrences(of: "-", with: "", options: NSString.CompareOptions.literal, range: nil)
        
        let dv = String(rut.last!)
        let run = String(rut.dropLast())
        
        return (run, dv)
    }
    
    func validateDV(rut: String) -> String? {
        var acumulated = 0
        var ti = 2
        
        stride(from: rut.count - 1, through: 0, by: -1).forEach {
            index in
            
            let n = Array(rut)[index]
            let nl = String(n)
            
            guard let vl = Int(nl) else { return }
            
            acumulated += vl * ti
            
            if ti == 7 { ti = 1 }
            
            ti += 1
        }
        
        let resto: Int = acumulated % 11
        let numericDigit = 11 - resto
        var digit = ""
        
        if (numericDigit <= 9) { digit = String(numericDigit) }
        else if (numericDigit == 10) { digit = "K" }
        else { digit = "0" }
        
        return digit
    }
    
    func isRut() -> Bool {
        var rut = self.replacingOccurrences(of: ".", with: "", options: .literal, range : nil)
        rut = rut.replacingOccurrences(of: "-", with: "", options: .literal, range : nil)
        rut = rut.uppercased()
        
        if (rut.count < 8 || rut.count > 10) { return false }
        
        let rutRegex = "^(\\d{1,3}(\\.?\\d{3}){2})\\-?([\\dkK])$"
        let rutTest = NSPredicate(format: "SELF MATCHES %@", rutRegex)
        
        if !rutTest.evaluate(with: rut) { return false }
        
        let runTovalidate = getRutDv(value: self)
        
        let rutNumber = runTovalidate.run
        let rutDV = runTovalidate.dv
        
        let calculatedDV = validateDV(rut: rutNumber)
        
        return rutDV.uppercased() == calculatedDV
    }
}

// MARK: - Parameterizable
protocol Parameterizable {
    var asParameters: Parameters {get}
}
