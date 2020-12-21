Project Implementation Details:
-------------------------------
Framework Used : Robot Framework (https://robotframework.org/)
Version : 3.2.2
Base Language : Python v3.8

Libraries Used:
Selenium Library (https://github.com/robotframework/SeleniumLibrary/)
BuiltIn Library


Project Structure:
------------------
Documentation : To store all Keyword and Test Cases Documentation
Keywords : Keyword files (typically 1 per module/functionlity)
Object_Repository : Variable files to store all element locators and common variables (typically 1 per module/functionlity)
Reports : To store all execution reports
Runner : Common libraries, executables, drivers. Typically the execution is initiated from this folder.
Test_Cases : To store all Test Case/Suite files (typically 1 per module/functionlity)
Test_Data : To store all relevant test data (typically structured in sub-folders per module/functionlity)



Installation & Execution Instructions:
---------------------------------------
PRE-REQUISITES : 
1. Python v3.8 installed on system, pip added in Path variable
2. Project folder downloaded and unzipped to appropriate folder on same system (say Project_Gmail_Login)
3. Google Chrome selenium web driver for version 87 downloaded (in case deleted by anti-virus upon unizipping)(https://chromedriver.storage.googleapis.com/index.html?path=87.0.4280.20/). Once downloaded, it must be copied under the Runner folder.

1. Open a command prompt and navigate to the Project folder.
2. On command prompt, navigate to the Runner folder, and execute install.bat. This will install Robot Framework and Selenium Library
3. On command prompt, enter the following command to start execution:
robot -d ..\Reports\ ..\Test_Cases\TestCases_Gmail.robot

Variables that can be changes on command line by providing in the format -v variablename:value


Command Line Options:
----------------------
1. To change Browser from Chrome to Edge (*requires appropriate drivers to be available in Runner folder)
robot -v browser:Edge -d ..\Reports\ ..\Test_Cases\TestCases_Gmail.robot

2. To execute only P1 Test Cases:
robot -i P1 -d ..\Reports\ ..\Test_Cases\TestCases_Gmail.robot

3. To execute Sanity test Cases Only:
robot -i Sanity -d ..\Reports\ ..\Test_Cases\TestCases_Gmail.robot


This should start the test execution. There are 16 test cases in the project and should take approximately 6 minutes to complete.






