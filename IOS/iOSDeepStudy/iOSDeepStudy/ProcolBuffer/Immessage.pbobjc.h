// Generated by the protocol buffer compiler.  DO NOT EDIT!
// source: IMMessage.proto

// This CPP symbol can be defined to use imports that match up to the framework
// imports needed when using CocoaPods.
#if !defined(GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS)
 #define GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS 0
#endif

#if GPB_USE_PROTOBUF_FRAMEWORK_IMPORTS
 #import <Protobuf/GPBProtocolBuffers.h>
#else
 #import "GPBProtocolBuffers.h"
#endif

#if GOOGLE_PROTOBUF_OBJC_VERSION < 30002
#error This file was generated by a newer version of protoc which is incompatible with your Protocol Buffer library sources.
#endif
#if 30002 < GOOGLE_PROTOBUF_OBJC_MIN_SUPPORTED_VERSION
#error This file was generated by an older version of protoc which is incompatible with your Protocol Buffer library sources.
#endif

// @@protoc_insertion_point(imports)

#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"

CF_EXTERN_C_BEGIN

@class UserInfo;

NS_ASSUME_NONNULL_BEGIN

#pragma mark - ImmessageRoot

/**
 * Exposes the extension registry for this file.
 *
 * The base class provides:
 * @code
 *   + (GPBExtensionRegistry *)extensionRegistry;
 * @endcode
 * which is a @c GPBExtensionRegistry that includes all the extensions defined by
 * this file and all files that it depends on.
 **/
@interface ImmessageRoot : GPBRootObject
@end

#pragma mark - UserInfo

typedef GPB_ENUM(UserInfo_FieldNumber) {
  UserInfo_FieldNumber_Name = 1,
  UserInfo_FieldNumber_Level = 2,
};

@interface UserInfo : GPBMessage

@property(nonatomic, readwrite, copy, null_resettable) NSString *name;
/** Test to see if @c name has been set. */
@property(nonatomic, readwrite) BOOL hasName;

@property(nonatomic, readwrite) int64_t level;

@property(nonatomic, readwrite) BOOL hasLevel;
@end

#pragma mark - TextMessage

typedef GPB_ENUM(TextMessage_FieldNumber) {
  TextMessage_FieldNumber_User = 1,
  TextMessage_FieldNumber_Text = 2,
};

@interface TextMessage : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) UserInfo *user;
/** Test to see if @c user has been set. */
@property(nonatomic, readwrite) BOOL hasUser;

@property(nonatomic, readwrite, copy, null_resettable) NSString *text;
/** Test to see if @c text has been set. */
@property(nonatomic, readwrite) BOOL hasText;

@end

#pragma mark - GiftMessage

typedef GPB_ENUM(GiftMessage_FieldNumber) {
  GiftMessage_FieldNumber_User = 1,
  GiftMessage_FieldNumber_Giftname = 2,
  GiftMessage_FieldNumber_GiftURL = 3,
  GiftMessage_FieldNumber_GiftCount = 4,
};

@interface GiftMessage : GPBMessage

@property(nonatomic, readwrite, strong, null_resettable) UserInfo *user;
/** Test to see if @c user has been set. */
@property(nonatomic, readwrite) BOOL hasUser;

@property(nonatomic, readwrite, copy, null_resettable) NSString *giftname;
/** Test to see if @c giftname has been set. */
@property(nonatomic, readwrite) BOOL hasGiftname;

@property(nonatomic, readwrite, copy, null_resettable) NSString *giftURL;
/** Test to see if @c giftURL has been set. */
@property(nonatomic, readwrite) BOOL hasGiftURL;

@property(nonatomic, readwrite, copy, null_resettable) NSString *giftCount;
/** Test to see if @c giftCount has been set. */
@property(nonatomic, readwrite) BOOL hasGiftCount;

@end

NS_ASSUME_NONNULL_END

CF_EXTERN_C_END

#pragma clang diagnostic pop

// @@protoc_insertion_point(global_scope)
