//
//  ButtonConfigureViewController.swift
//  NetworkTutorial
//
//  Created by 이병훈 on 1/11/25.
//

import UIKit

class ButtonConfigureViewController: UIViewController {
    
    private lazy var testButton: UIButton = {
        var config = UIButton.Configuration.bordered()
        
        // MARK: 버튼 기본 구성 (title, subtitle, image)
        
//        config.title = "title"
//        config.subtitle = "subtitle"
//        config.image = UIImage(systemName: "paperplane.fill")
        
        // MARK: 색상 조절
        
        // 배경색
        config.baseBackgroundColor = .white
        // 글씨색
        config.baseForegroundColor = .systemGray
        // 테두리
//        config.background.strokeWidth = 2
//        config.background.strokeColor = .red
        
        // MARK: inset
        config.contentInsets = NSDirectionalEdgeInsets(top: 16, leading: 8, bottom: 16, trailing: 8)
        
        // padding
        // title, subtitle 간의 거리
//        config.titlePadding = 10
        
        // image와 (title, subtitle) 간의 거리
//        config.imagePadding = 10
        
        // MARK: 위치
        
        // 글씨 위치 (.leading, .trailing, .center)
        config.titleAlignment = .center
        
        // image 위치
//        config.imagePlacement = .leading
        
        // MARK: 버튼 사이즈(자동)
        /// 수동 설정은 다른걸 사용해야할듯
//        config.buttonSize = .large
        
        // MARK: CornerStyle
        
//        config.cornerStyle = .large
        
        var attributedString: AttributedString = .init("복사하기")
        attributedString.font = .system(size: 30, weight: .bold)
        config.attributedTitle = attributedString
        
        let v = UIButton(configuration: config)
        v.translatesAutoresizingMaskIntoConstraints = false
        v.layer.cornerRadius = 16
        v.layer.borderColor = UIColor.systemGray.cgColor
        v.layer.borderWidth = 1
        return v
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
        self.setupLayout()
    }

    private func setupUI() {
        self.view.addSubview(self.testButton)
        
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            self.testButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.testButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor),
//            self.testButton.widthAnchor.constraint(equalToConstant: 200),
//            self.testButton.heightAnchor.constraint(equalToConstant: 100),
        ])
    }
}


#Preview {
    ButtonConfigureViewController()
}
