source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '7.1'

xcodeproj 'ZLITodo', 'Local_Release' => :release, 'Mock_Debug' => :debug, 'Local_Debug' => :debug

if FileTest::directory?('../ios_utils')
    pod 'ZLIUtils', :path => '../ios_utils'
else
    pod 'ZLIUtils', :git => 'https://github.com/zhoulijoe/ios_utils.git', :branch => 'develop'
end

if FileTest::directory?('../AFOAuth2Client')
    pod 'AFOAuth2Client', :path => '../AFOAuth2Client'
else
    pod 'AFOAuth2Client', :git => 'https://github.com/zhoulijoe/AFOAuth2Client.git', :branch => 'develop'
end

pod 'Overcoat/ReactiveCocoa'

target :ZLITodoTests, :exclusive => true do
    pod 'Kiwi'
end
