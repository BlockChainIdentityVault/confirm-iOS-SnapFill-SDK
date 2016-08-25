Pod::Spec.new do |s|
  s.name              = 'confirm-iOS-SnapFill-SDK'
  s.version           = '1.0.1'

  s.summary           = 'Confirm.io SnapFill SDK reads and parses data from state and federally issued identity documents for use in your application.'
  s.description       = <<-DESC
                        Simply include the SDK into your application, insert your API key (provided by Confirm.io), and allow your app's users to start scanning their IDs! Once scanned the data can be used not only to populate forms, but also to trigger automatic onboarding, user identification, marketing campaigns, and more!
                        DESC

  s.homepage          = 'https://www.confirm.io'

  s.license           = { :type => 'Appache', :file => 'LICENSE' }
  s.author            = 'Confirm.io'

  s.platform          = :ios, '8.0'
  s.requires_arc      = true
  
  s.preserve_path     = 'ConfirmSnapFill SDK/ConfirmSnapFill.framework'

  s.source = { :git => "https://github.com/confirm-io/confirm-ios-snapfill-sdk.git", :branch => "pod"}

  s.frameworks = 'AudioToolbox', 'AVFoundation'
  s.libraries = 'c++', 'objc'
  
  s.vendored_frameworks = 'ConfirmSnapFill SDK/ConfirmSnapFill.framework'
end