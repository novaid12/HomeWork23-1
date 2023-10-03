//
//  FirstVCViewController.swift
//  HomeWork23-1
//
//  Created by  NovA on 3.10.23.
//

import Lottie
import UIKit

class FirstVCViewController: UIViewController {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var myView: UIView!
    private var lottieAnimationView: LottieAnimationView!
    private var active = true
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func coreAnimationBtn(_ sender: Any) {
        UIView.animate(withDuration: 3,
                       delay: 0,
                       options: [.autoreverse, .repeat])
        {
            self.myView.layer.borderWidth += 5
            self.myView.backgroundColor = .blue
            self.myView.layer.cornerRadius += 100
            self.myView.frame.origin.y += 40
        } completion: { complete in
            print(complete)
        }
    }

    @IBAction func lottieAnimationBtn(_ sender: Any) {
        if active {
            lottieAnimationViewSetup()
            lottieAnimationView.play()
            active = false
        } else {
            lottieAnimationView.stop()
            lottieAnimationView.isHidden = true
            stackView.removeArrangedSubview(lottieAnimationView)
            active = true
        }
    }

    private func lottieAnimationViewSetup() {
        let animationsArray = ["avatar", "eye", "rounded", "avatar-man", "security", "consultation", "speakers", "confetti", "down"]
        lottieAnimationView = .init(name: animationsArray[Int.random(in: 0 ... animationsArray.count - 1)])
        lottieAnimationView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        lottieAnimationView.contentMode = .scaleAspectFit
        lottieAnimationView.loopMode = .playOnce
        lottieAnimationView.animationSpeed = 0.5
        stackView.addArrangedSubview(lottieAnimationView)
    }
}
