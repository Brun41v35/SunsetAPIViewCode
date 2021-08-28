//
//  SunsetView.swift
//  SunsetAPI
//
//  Created by Bruno Silva on 19/08/21.
//

import UIKit
import SnapKit

public class SunsetView: UIView {
    
    //MARK: - Variables
    lazy var stackView = makeStackView()
    lazy var imageSunrise = makeImageSunrise()
    lazy var labelSunrise = makeLabelSunrise()
    lazy var imageSunset = makeImageSunset()
    lazy var labelSunset = makeLabelSunset()
    lazy var updateButton = makeButton()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Setup
    private func setup() {
        addViews()
        addConstraints()
        background()
    }
    
    private func addViews() {
        addSubview(stackView)
        stackView.addArrangedSubview(imageSunrise)
        stackView.addArrangedSubview(labelSunrise)
        stackView.addArrangedSubview(imageSunset)
        stackView.addArrangedSubview(labelSunset)
        addSubview(updateButton)
    }
    
    private func background() {
        backgroundColor = .systemBlue
    }
    
    //MARK: - Functions
    private func makeStackView() -> UIStackView {
        let stack = UIStackView()
        stack.distribution = .fillEqually
        stack.axis = .vertical
        stack.spacing = 0
        return stack
    }
    
    private func makeImageSunrise() -> UIImageView {
        let icon = UIImageView()
        icon.image = UIImage(named: "sunrise")
        icon.contentMode = .scaleAspectFit
        return icon
    }
    
    private func makeLabelSunrise() -> UILabel {
        let label = UILabel()
        label.text = "Sunrise"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }
    
    private func makeImageSunset() -> UIImageView {
        let icon = UIImageView()
        icon.image = UIImage(named: "sunset")
        icon.contentMode = .scaleAspectFit
        return icon
    }
    
    private func makeLabelSunset() -> UILabel {
        let label = UILabel()
        label.text = "Sunset"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 30)
        return label
    }
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.setTitle("Search", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .white
        button.layer.shadowColor = #colorLiteral(red: 0.237021029, green: 0.2370274663, blue: 0.2370240092, alpha: 1)
        button.layer.shadowOffset = CGSize(width: 0, height: 3)
        button.layer.shadowOpacity = 1.0
        button.layer.shadowRadius = 8
        button.layer.masksToBounds = false
        return button
    }
    
    //MARK: - Constants
    private func addConstraints() {
        stackView.snp.makeConstraints { make in
            make.top.equalTo(safeAreaLayoutGuide)
            make.leading.trailing.equalToSuperview()
            make.bottom.equalTo(updateButton.snp.top).inset(5)
        }
        
        updateButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.bottom.equalTo(safeAreaLayoutGuide).inset(20)
            make.height.equalTo(50)
        }
    }
}
