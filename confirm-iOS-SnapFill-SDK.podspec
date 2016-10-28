Pod::Spec.new do |s|

  s.name        = 'confirm-iOS-SnapFill-SDK'
  s.version     = '0.2.0'
  s.author      = 'Confirm.io'
  s.homepage    = 'https://www.confirm.io'
  
  s.license     = { :type => 'Apache', :file => 'LICENSE' }
  
  s.summary     = 'Confirm.io SnapFill SDK reads and parses data from state and federally issued identity documents for use in your application.'
  
  s.description = <<-DESC
                        Simply include the SDK into your application, insert your API key (provided by Confirm.io), and allow your app's users to start scanning their IDs! Once scanned the data can be used not only to populate forms, but also to trigger automatic onboarding, user identification, marketing campaigns, and more!
                    DESC

  s.source              = { :git => 'https://github.com/confirm-io/confirm-iOS-SnapFill-SDK.git', :tag => 'v' + s.version.to_s }

  s.platform            = :ios, '8.0'
  s.requires_arc        = true
  
  s.vendored_frameworks = 'ConfirmSnapFill SDK/Debug/ConfirmSnapFill.framework'
  
  s.frameworks          = 'AudioToolbox', 'AVFoundation'
  s.libraries           = 'c++', 'objc'
  
end