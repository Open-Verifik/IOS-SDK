# biometrics-ios-sdk

# Adding an XCFramework to an iOS Project

## Prerequisites

- XCFramework: Obtain the XCFramework binary or build it yourself using Xcode's build system.
- iOS Project: Have an existing iOS project in Xcode.

## Steps

1. Open your iOS project in Xcode.

2. Locate the project navigator on the left-hand side of Xcode.

3. Drag and drop the XCFramework binary into your project's file structure within the project navigator. Make sure to choose the appropriate location, such as the project root folder or a designated "Frameworks" folder.

4. When prompted, ensure the option "Copy items if needed" is selected. This will ensure the XCFramework is copied into your project's directory.

5. Once the XCFramework is added to the project, select your app target in the project settings.

6. In the app target settings, go to the "General" tab.

7. Scroll down to the "Frameworks, Libraries, and Embedded Content" section.

8. Click the "+" button to add a new framework.

9. In the file picker dialog, locate and select the XCFramework file you added to your project.

10. Choose the appropriate framework file from the XCFramework bundle. Typically, this will be the dynamic framework file with the `.framework` extension.

11. Ensure the framework is added to the "Frameworks, Libraries, and Embedded Content" section and set the appropriate "Embed" option. Select either "Embed & Sign" or "Embed Without Signing" depending on your requirements.

12. Click "Finish" to add the XCFramework to your project.

13. Build and run your project to verify that the XCFramework is properly linked.

## Conclusion

By following these steps, you have successfully included an XCFramework in your iOS project. The XCFramework will now be available for use within your app, allowing you to utilize its functionality and features.

Remember to review the documentation provided by the XCFramework's developers for any additional instructions specific to the framework you are integrating.
