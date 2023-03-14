//
//  SBUGlobals.swift
//  SendbirdUIKit
//
//  Created by Tez Park on 27/02/2020.
//  Copyright © 2020 Sendbird, Inc. All rights reserved.
//

import UIKit
import Photos

public class SBUGlobals {
    
    /// The application ID from Sendbird dashboard.
    /// - Since: 3.0.0
    public static var applicationId: String?
    
    /// The access token of the user
    /// - Since: 3.0.0
    public static var accessToken: String?
    
    /// The current user that is type of `SBUUser`
    /// - Since: 3.0.0
    public static var currentUser: SBUUser?
    
    
    // MARK: - Channel List
    /// If this value is enabled, the channel list shows the typing indicator. The defaut value is `false`.
    /// - Since: 3.0.0
    public static var isChannelListTypingIndicatorEnabled: Bool = false
    
    /// If this value is enabled, the channel list provides receipt state of the sent message. The defaut value is `false`.
    /// - Since: 3.0.0
    public static var isChannelListMessageReceiptStateEnabled: Bool = false
    

    // MARK: - Message Grouping
    /// If this value is enabled, messages sent at similar times are grouped.
    /// - Since: 3.0.0
    public static var isMessageGroupingEnabled: Bool = true
    
    
    // MARK: - Reply
    /// The configuration for reply.
    /// - Since: 3.3.0
    public static var reply: SBUReplyConfiguration = SBUReplyConfiguration()
    
    
    // MARK: - PHPickerViewController
    /// If it's `true`, uses `PHPickerViewController` instead of `UIImagePickerController` when access to the photo library for sending file message.
    /// - Since: 3.0.0
    @available(iOS 14, *)
    public static var isPHPickerEnabled: Bool = false
    
    /// The level of access to the photo library. The default value is `.readWrite`.
    /// - Since: 2.2.4
    @available(iOS 14, *)
    public static var photoLibraryAccessLevel: SBUPhotoAccessLevel = .readWrite

    
    // MARK: - User Profile
    /// If this value is enabled, when you click on a user image, the user profile screen is displayed.
    /// - Since: 3.0.0
    public static var isUserProfileEnabled: Bool = false

    /// If this value is enabled, when you click on a user image in open channel, the user profile screen is displayed.
    /// - Since: 3.0.0
    public static var isOpenChannelUserProfileEnabled: Bool = false

    
    // MARK: - Image Process
    /// if this value is enabled, image compression and resizing will be applied when sending a file message
    ///
    /// - Note: If this option is enabled, use `imageResizingSize` to resize the image, then compress it based on the`imageCompressionRate` value.
    /// - Since: 3.0.0
    public static var isImageCompressionEnabled: Bool = true
    
    /// Image compression rate value that will be used when sending image. Default value is `0.7`.
    ///  - NOTE: Typically this value will be used in `jpegData(compressionQuality:)`
    ///  - NOTE: You can set a value between `0.0` and `1.0`.
    /// - Since: 2.0.0
    public static var imageCompressionRate: CGFloat = 0.7
    
    /// Image resizing size value that will be used when sending image. Default value is a device screen size.
    /// - Since: 2.0.0
    public static var imageResizingSize: CGSize = UIScreen.main.bounds.size;
    
    
    // MARK: - Mention
    /// The configuration for user mention.
    /// - NOTE: If `userMentionConfig` is set to `SBUUserMentionConfiguration` instance, user mention feature is enabled.
    /// - NOTE: If `userMentionConfig` is set to `nil` instance, user mention feature is disabled.
    /// - Since: 3.0.0
    public static var userMentionConfig: SBUUserMentionConfiguration?
    
    /// The boolean value that indicates whether the user mention feature is enabled or not.
    /// - NOTE: If set to `true`, it sets `userMentionConfig` to default value when it was `nil`.
    /// - Since: 3.0.0
    public static var isUserMentionEnabled: Bool {
        get { SBUGlobals.userMentionConfig != nil }
        set {
            switch newValue {
            case true:
                if userMentionConfig == nil {
                    SBUGlobals.userMentionConfig = .init()
                }
            case false:
                SBUGlobals.userMentionConfig = nil
            }
        }
    }
    
    
    // MARK: - Message configuration
    
    /// The configuration for message cell.
    /// - Since: 3.2.2
    ///
    /// See the example below for configuration setting.
    /// ```
    /// SBUGlobals.messageCellConfiguration.groupChannel.thumbnailSize = {SIZE}
    /// ```
    public internal(set) static var messageCellConfiguration = SBUMessageCellConfiguration()
    
    
    /// Sets whether a nickname uses a user ID when there is no user nickname based on the user ID.
    ///
    /// - Note: If this value will set to `true`, nickname uses a user ID when nickname is empty.
    /// - Since: 3.3.1
    public static var isUserIdUsedForNickname: Bool = true
    
    
    // MARK: - Voice Message
    
    /// The configuration for voice message.
    ///
    /// See the example below for configuration setting.
    /// ```
    /// SBUGlobals.voiceMessageConfig.isVoiceMessageEnabled = true // Turn on the voice message feature
    /// SBUGlobals.voiceMessageConfig.recorder.maxRecordingTime = 30000 // ms
    /// ```
    /// - Since: 3.4.0
    public internal(set) static var voiceMessageConfig = SBUVoiceMessageConfiguration()
    
    /// The default value is `false`. If it's `true`,`AVPlayerViewController` is presented when it needs to play the audio/video of file message. If it's `false`, `UIDocumentInteractionController` is presented.
    ///
    /// ```
    /// SBUGlobals.isAVPlayerAlwaysEnabled = false // shows `UIDocumentInteractionController` when plays audio/video message.
    /// SBUGlobals.isAVPlayerAlwaysEnabled = trye // shows `AVPlayerViewController` when plays audio/video message.
    /// ```
    public static var isAVPlayerAlwaysEnabled: Bool = false
}