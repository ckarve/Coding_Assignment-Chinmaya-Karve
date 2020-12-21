*** Settings ***
Documentation
    ...     *Technical Assessment Assignment for Chinmaya Karve*
    ...     \n*Problem Statement : Write Automation for Gmail Login*
    ...     \n*Submitted By : Chinmaya Karve*
    ...     \n*Candidate Email Address : ckarve@gmail.com*
    ...     \n*Candidate Phone Number : +91 9923423346*
    ...     \n*Date Completed : 21st December 2020*
Library     SeleniumLibrary
Library     BuiltIn
Library     String
Resource    ${CURDIR}/../Keywords/Keywords_Gmail.robot
Suite Setup     Import Resource     ${CURDIR}/../Object_Repository/Language_Strings_${languageCode}.robot
Test Setup      Open Gmail
Test Teardown   Close Browser
Suite Teardown      Close Browser

*** Variables ***


*** Keywords ***


*** Test Cases ***
Validate that All Elements are Present on Gmail Login Landing Page
    [Documentation]   Test Case to validate that all essential fields are available on the Gmail Landing Page
    [Tags]      P1      Sanity
    Element Should Be Visible   ${gmailLogo}
    Element Should be Visible   ${headingText}
    Element Should Be Visible   ${headingSubText}
    Element Should Be Visible   ${forgotEmailLink}
    Element Should Be Visible   ${helpLink}
    Element Should Be Visible   ${privacyLink}


Validate that Helper Text is displayed in Email/Phone Input Text Field
    [Documentation]   Test Case to validate that helper/prompt text is available in the Email/Phone field
    [Tags]      P2      Sanity
    Element Text Should Be      ${emailInputFieldText}      ${emailHelperText}


Validate that User is Taken to Support Page on clicking on Learn More Link
    [Documentation]   Test Case to validate that all essential fields are available on the Gmail Landing Page
    [Tags]      P3      Sanity
    Click Element   ${learnMoreLink}
    sleep   5s
    Location Should Be      ${moreInfoPage}${languageCode}
    Page Should Contain     ${supportArticleHeader}


Validate that User is Taken to Gmail Help Page on clicking on Help Link
    [Documentation]   Test Case to validate that user is taken to GMail Help page on Clicking the Help Link
    [Tags]      P3      Sanity
    Click Element   ${helpLink}
    sleep   5s
    ${tmpURL}=      Replace String      ${gmailHelpPage}    LANGUAGE    ${languageCode}
    Switch Window   New
    Location Should Be      ${tmpURL}
    Page Should Contain     ${gmailHelpPageTitle}


Validate that User is Taken to Gmail Privacy Page on clicking on Privacy Link
    [Documentation]   Test Case to validate that user is taken to GMail Privacy page on Clicking the Privacy Link
    [Tags]      P3      Sanity
    Click Element   ${privacyLink}
    sleep   5s
    ${tmpURL}=      Replace String      ${gmailPrivacyPage}    LANGUAGE    ${languageCode}
    Switch Window   New
    Location Should Be      ${tmpURL}
    ${newWindowTitle}=      Get Title
    Should Contain     ${newWindowTitle}    ${gmailPrivacyPageTitle}


Validate that User is Taken to Gmail Terms Page on clicking on Terms Link
    [Documentation]   Test Case to validate that user is taken to GMail Terms of Service page on Clicking the Terms Link
    [Tags]      P3      Sanity
    Click Element   ${termsLink}
    sleep   5s
    ${tmpURL}=      Replace String      ${gmailTermsPage}    LANGUAGE    ${languageCode}
    Switch Window   New
    Location Should Be      ${tmpURL}
    ${newWindowTitle}=      Get Title
    Should Contain     ${newWindowTitle}    ${gmailTermsPageTitle}


Validate that user is Able to Change the Language on Gmail Login Screen
    [Documentation]   Test Case to validate that user is able to change the language as per his/her preference by choosing the Language from drop-down list
    [Tags]      P2      Functional
    ${languageCode}=    Set Variable    hi
    Run Keyword If  ${languageSwitchStatus}==${1}    Switch Language     ${languageCode}    ELSE    Select Language     ${languageCode}
    sleep   5s
    ${actualLanguage}=    Get Element Attribute   ${selectedLanguage}     data-value
    Should be Equal As Strings  ${actualLanguage}   ${languageCode}
    ${currentURL}=      Get Location
    Should Contain      ${currentURL}   ${languageCode}


Validate that User Is taken to Forgot Password Flow upon clicking on Forgot Email Link
    [Documentation]   Test Case to validate that user is taken to Forgot Email flow upon clicking of Forgot Email Link
    [Tags]      P2      Sanity
    Click Element   ${forgotEmailLink}
    sleep   5s
    Element Should Not Be Visible   ${forgotEmailLink}
    Element Should Not Be Visible   ${learnMoreLink}
    Element Should Be Visible   ${nextButtonLink}


Validate that appropriate error message is shown when user clicks on Next button without entering Email/Phone on Forgot Password Screen
    [Documentation]   Test Case to Validate that appropriate error message is shown when user clicks on Next button without entering Email/Phone on Forgot Password Screen
    [Tags]      P1      Functional
    Click Element   ${forgotEmailLink}
    sleep   5s
    Click Element       ${nextButtonLink}
    sleep   2s
    Page Should Contain     ${emptyError}


Validate that appropriate error message is shown when user provides invalid Username, First Name and Last Name during Forgot Password Flow
    [Documentation]   Test Case to Validate that appropriate error message is shown when user provides invalid Username, First Name and Last Name during Forgot Password Flow
    [Tags]      P1      Functional
    Click Element   ${forgotEmailLink}
    sleep   5s
    Input Text      ${forgotPasswordEmail}  invalid.user
    Click Element       ${nextButtonLink}
    sleep   2s
    Input Text      ${forgotPasswordFName}      invalid
    Input Text      ${forgotPasswordLName}      user
    Click Element   ${nextButtonLink}
    sleep   5s
    Page Should Contain     ${emptyError}


Validate that appropriate error message is shown when user clicks on Next button without entering Email/Phone
    [Documentation]   Test Case to Validate that appropriate error message is shown when user clicks on Next button without entering Email/Phone
    [Tags]      P1      Functional
    Click Element       ${nextButtonLink}
    sleep   2s
    Page Should Contain     ${emptyError}


Validate that appropriate error message is shown when user provides Incorrect Email
    [Documentation]   Test Case to Validate that appropriate error message is shown when user provides Incorrect Email
    [Tags]      P1      Functional
    Input Text      ${emailInputField}      ${invalidEmail}
    Click Element       ${nextButtonLink}
    sleep   2s
    Page Should Contain     ${incorrectAccount}


Validate that appropriate error message is shown when user provides Incorrect Phone
    [Documentation]   Test Case to Validate that appropriate error message is shown when user provides Incorrect Phone
    [Tags]      P1      Functional
    Input Text      ${emailInputField}      ${invalidPhone}
    Click Element       ${nextButtonLink}
    sleep   2s
    Page Should Contain     ${incorrectAccount}


Validate that user can change the Username upon clicking Email/Phone field on Enter Password Window
    [Documentation]   Test Case to Validate that user can change the Username upon clicking Email/Phone field on Enter Password Window
    [Tags]      P2      Functional
    Input Text      ${emailInputField}      ${username}
    Click Element       ${nextButtonLink}
    sleep   2s
    Click Element   ${switchUserName}
    sleep   2s
    Element Attribute Value Should Be   ${emailInputField}  data-initial-value  ${username}


Validate that appropriate error message is shown when user provides incorrect Password
    [Documentation]   Test Case to Validate that appropriate error message is shown when user provides incorrect Password
    [Tags]      P2      Functional
    Input Text      ${emailInputField}      ${username}
    Click Element       ${nextButtonLink}
    sleep   2s
    Input Text      ${passwordField}     ${invalidPassword}
    Click Element       ${nextButtonLink}
    sleep   2s
    Page Should Contain     ${incorrectPassword}


Validate that user is able to login with valid username and password
    [Documentation]   Test Case to Validate that user is able to login with valid username and password
    [Tags]      P1      Functional
    Input Text      ${emailInputField}      ${username}
    Click Element       ${nextButtonLink}
    sleep   2s
    Input Text      ${passwordField}     ${password}
    Click Element       ${nextButtonLink}
    sleep   2s
    Wait Until Element is Visible       ${accountIcon}
    Click Element       ${accountIcon}
    Click Element       ${signOutLink}
    Wait Until Element Is Visible   ${gmailLogo}
    Page Should Contain        Choose an account