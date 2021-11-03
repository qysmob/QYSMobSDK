#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint QYSMobSDK.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
s.name             = 'QYSMobSDK'
s.version          = '1.2.0'
s.summary          = '广告插件'
s.description      = <<-DESC
QYSMobSDK 广告插件
                     DESC
s.homepage         = 'https://github.com/qysmob/QYSMobSDK'
s.license          =  { :type => 'MIT', :file => 'LICENSE' }
s.author           = { 'QYSMob' => 'qysmob@163.com' }
s.platform = :ios, '9.0'

s.requires_arc = true
s.user_target_xcconfig =   {'OTHER_LDFLAGS' => ['-lObjC']}
s.pod_target_xcconfig = { 'VALID_ARCHS' => 'x86_64 armv7 arm64' }
#s.pod_target_xcconfig = {  'VALID_ARCHS' => '$(ARCHS_STANDARD_64_BIT) armv7', 'ENABLE_BITCODE' => 'NO','DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }

# 后续调整为读取远端压缩包 tag 为版本号
s.source = { :git => "https://github.com/qysmob/QYSMobSDK.git", :tag => s.version.to_s }
#s.source_files = 'QYSMob/**/*'
s.vendored_frameworks = 'QYSMob/QYSMobSDK.framework'
s.resources = 'QYSMob/QYSBundle.bundle'

# 需要的系统库
s.frameworks= 'AppTrackingTransparency','Accelerate','AddressBook','AdSupport','AssetsLibrary' , 'AudioToolbox','AVFoundation','AVKit','CoreData','CoreGraphics','CoreImage','CoreLocation','CoreMedia','CoreMotion','CoreServices','CoreTelephony','CoreText','Foundation','ImageIO','JavaScriptCore','MapKit','MediaPlayer','MessageUI','MobileCoreServices','Photos','QuartzCore','QuickLook','SafariServices','Security','StoreKit','SystemConfiguration','UIKit','WebKit'
s.libraries = 'bz2','c++','c++abi','iconv','resolv.9','resolv','sqlite3','z','xml2'




end

