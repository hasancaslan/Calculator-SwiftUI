//
//  PasscodeSignButton.swift
//  Photo Vault
//
//  Created by HASAN CAN on 10/8/20.
//  Copyright © 2020 pbstudio. All rights reserved.
//

import UIKit

@IBDesignable
open class PasscodeSignButton: UIButton {
    @IBInspectable
    open var passcodeSign: String = "1"

    @IBInspectable
    open var borderColor: UIColor = .clear {
        didSet {
            setupView()
        }
    }

    @IBInspectable
    open var borderRadius: CGFloat = 37 {
        didSet {
            setupView()
        }
    }

    @IBInspectable
    open var highlightBackgroundColor: UIColor = .clear {
        didSet {
            setupView()
        }
    }

    override public init(frame: CGRect) {
        super.init(frame: frame)

        setupView()
        setupActions()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        setupActions()
    }

    override open var intrinsicContentSize: CGSize {
        return CGSize(width: 74, height: 74)
    }

    private var defaultBackgroundColor: UIColor = .clear

    private func setupView() {
        layer.borderWidth = 1
        layer.cornerRadius = borderRadius
        layer.borderColor = borderColor.cgColor
//        let blur = UIVisualEffectView(effect: UIBlurEffect(style:
//            UIBlurEffect.Style.regular))
//        blur.frame = layer.bounds
//        blur.isUserInteractionEnabled = false
//        self.insertSubview(blur, at: 0)
//        self.clipsToBounds = true
        if let backgroundColor = backgroundColor {
            defaultBackgroundColor = backgroundColor
        }
    }

    private func setupActions() {
        addTarget(self, action: #selector(PasscodeSignButton.handleTouchDown), for: .touchDown)
        addTarget(self, action: #selector(PasscodeSignButton.handleTouchUp), for: [.touchUpInside, .touchDragOutside, .touchCancel])
    }

    @objc func handleTouchDown() {
        animateBackgroundColor(highlightBackgroundColor)
    }

    @objc func handleTouchUp() {
        animateBackgroundColor(defaultBackgroundColor)
    }

    private func animateBackgroundColor(_ color: UIColor) {
        UIView.animate(
            withDuration: 0.5,
            delay: 0.0,
            usingSpringWithDamping: 1,
            initialSpringVelocity: 0.0,
            options: [.allowUserInteraction, .beginFromCurrentState],
            animations: {
                self.backgroundColor = color
            },
            completion: nil
        )
    }
}
