//
//  testViewController.swift
//  Example
//
//  Created by KS on 2023/03/02.
//


import UIKit
import PIPKit

class testViewController: UIViewController, PIPUsable {
    var pipContentView: UIView {
        return self.view
    }

    var pipFrame: CGRect {
        return CGRect(x: 0, y: 0, width: 100, height: 300)
    }

    var pipSize: CGSize { return CGSize(width: 200.0, height: 200.0) }


    var pipCornerRadius: CGFloat {
        return 30
    }

    var pipAnimationDuration: TimeInterval {
        return 0.3
    }

    var pipAnimationOption: UIView.AnimationOptions {
        return .curveEaseInOut
    }
}


class Pip2ndViewController: UIViewController, PIPUsable {

    var initialState: PIPState { return .pip }
    var pipSize: CGSize { return CGSize(width: 200.0, height: 200.0) }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.layer.borderColor = UIColor.red.cgColor
        view.layer.borderWidth = 1.0
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if PIPKit.isPIP {
            stopPIPMode()
        } else {
            startPIPMode()
        }
    }

    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIPViewController.pip")
        case .full:
            print("PIPViewController.full")
        }
    }
}

class PIPXibTestViewController: UIViewController, PIPUsable {


    @IBAction func tappedPiP(_ sender: Any) {
        if PIPKit.isPIP {
            stopPIPMode()
        } else {
            startPIPMode()
        }
    }

    @IBAction func tappedDismiss(_ sender: Any) {
        PIPKit.dismiss(animated: true) {}
    }

    var initialState: PIPState { return .full }
    var initialPosition: PIPPosition { return .topRight }
    var pipEdgeInsets: UIEdgeInsets { return UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20) }
    var pipSize: CGSize = CGSize(width: 150.0, height: 200.0)
    var pipShadow: PIPShadow? = PIPShadow(color: .gray, opacity: 0.3, offset: CGSize(width: 2, height: 2), radius: CGFloat(2))
    var pipCorner: PIPCorner? = PIPCorner(radius: CGFloat(6))
    
    class func viewController() -> PIPXibTestViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: "test") as? PIPXibTestViewController else {
            fatalError("PIPXibViewController is null")
        }
        return viewController
    }
    
    func didChangedState(_ state: PIPState) {
        switch state {
        case .pip:
            print("PIPXibViewController.pip")
        case .full:
            print("PIPXibViewController.full")
        }
    }
    
    func didChangePosition(_ position: PIPPosition) {
        switch position {
        case .topLeft:
            print("PIPXibViewController.topLeft")
        case .middleLeft:
            print("PIPXibViewController.middleLeft")
        case .bottomLeft:
            print("PIPXibViewController.bottomLeft")
        case .topRight:
            print("PIPXibViewController.topRight")
        case .middleRight:
            print("PIPXibViewController.middleRight")
        case .bottomRight:
            print("PIPXibViewController.bottomRight")
        }
    }
}
