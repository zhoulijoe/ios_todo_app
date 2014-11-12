platform :ios, '7.1'

xcodeproj 'ZLITodo', 'Release' => :release, 'Debug' => :debug

if FileTest::directory?('../ios_utils')
    pod 'ZLIUtils', :path => '../ios_utils'
else
    pod 'ZLIUtils', :git => 'https://github.com/zhoulijoe/ios_utils.git', :branch => ‘develop’
end

target :ZLITodoTests, :exclusive => true do
    pod 'Kiwi/XCTest'
end
