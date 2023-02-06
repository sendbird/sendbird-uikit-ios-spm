//
//  SBUQuotedFileMessageView.swift
//  SendbirdUIKit
//
//  Created by Jaesung Lee on 2021/07/28.
//  Copyright © 2021 Sendbird, Inc. All rights reserved.
//

import UIKit


open class SBUQuotedFileMessageView: SBUQuotedBaseMessageView {
    /// The string value of file URL.
    /// - Since: 2.2.0
    public var urlString: String?
    
    /// The value of `MessageFileType`.
    /// - Since: 2.2.0
    public var fileType: MessageFileType {
        SBUUtils.getFileType(by: urlString!)
    }
    
    public private(set) lazy var messageFileView: UIView = {
        return UIView()
    }()
    
    public var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    public var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .center
        return imageView
    }()
    
    open override func setupViews() {
        
        // + --------------- +
        // | messageFileView |
        // + --------------- +
        
        self.mainContainerView.setStack([
            self.messageFileView
        ])
        
        super.setupViews()
    }
    
    open override func setupLayouts() {
        super.setupLayouts()
        
        self.mainContainerView
            .sbu_constraint_lessThan(width: SBUGlobals.messageCellConfiguration.groupChannel.thumbnailSize.width)
    }
    
    open override func configure(with configuration: SBUQuotedBaseMessageViewParams) {
        guard configuration.useQuotedMessage else { return }
        guard configuration.isFileType,
                let urlString = configuration.urlString,
                let name = configuration.fileName,
                let type = configuration.fileType
        else { return }
        
        self.urlString = urlString
        super.configure(with: configuration)
        
        switch SBUUtils.getFileType(by: type) {
        case .image, .video:
            if !(self.messageFileView is QuotedFileImageContentView) {
                self.messageFileView.removeFromSuperview()
                self.messageFileView = QuotedFileImageContentView()
                self.mainContainerView.insertArrangedSubview(self.messageFileView, at: 0)
            }
            self.mainContainerView
                .roundCorners(corners: .allCorners, radius: 8)
            (self.messageFileView as? QuotedFileImageContentView)?.configure(with: configuration)
        case .audio, .pdf, .etc:
            if !(self.messageFileView is QuotedFileCommonContentView) {
                self.messageFileView.removeFromSuperview()
                self.messageFileView = QuotedFileCommonContentView()
                self.mainContainerView.insertArrangedSubview(self.messageFileView, at: 0)
            }
            (self.messageFileView as? QuotedFileCommonContentView)?
                .configure(
                    with: type,
                    fileName: name,
                    position: configuration.messagePosition,
                    highlightKeyword: nil
                )
        }
        self.updateConstraintsIfNeeded()
    }
}
