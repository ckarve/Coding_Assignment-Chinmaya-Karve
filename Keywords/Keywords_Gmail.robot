*** Settings ***
    [Documentation]   Technical Assessment Assignment for Chinmaya Karve
    ...     \nProblem Statement : Write Automation for Gmail Login
    ...     \n Submitted By : Chinmaya Karve
    ...     \nCandidate Email Address : ckarve@gmail.com
    ...     \nCandidate Phone Number : +91 9923423346
    ...     \nDate Completed : 21st December 2020
Library     SeleniumLibrary
Library     BuiltIn
Library     String
Resource    ../Object_Repository/Object_Repository.robot

*** Variables ***
${browser}      gc
${url}      https://mail.google.com/
${googleAccountURL}=    https://accounts.google.com/signin/v2/identifier?hl=
${username}     ckarve.automation.assignment
${invalidPassword}      invalidPassword
${invalidEmail}     wrong.user
${invalidPhone}     99090
${password}     Automation#1234$
${languageCode}       en-GB
${moreInfoPage}      https://support.google.com/chrome/answer/6130773?hl=
${gmailAboutLink}       https://www.google.com/intl/LANGUAGE/gmail/about/
${gmailHelpPage}        https://support.google.com/accounts?hl=LANGUAGE#topic=3382296
${gmailPrivacyPage}     https://policies.google.com/privacy?gl=IN&hl=LANGUAGE
${gmailTermsPage}       https://policies.google.com/terms?gl=IN&hl=LANGUAGE
${languageSwitchStatus}     ${0}

*** Keywords ***
Open Gmail
    [Documentation]   *Keyword to Open Gmail Website on desktop (does not require any parameters)*
    ...     \n*1.Opens a new instance of browser (browser - default Google Chrome, can be changed via command line before execution)*
    ...     \n*2.Maximize the browser Window*
    ...     \n*3.Validate that the Gmail site is opened properly by validating the central login frame.*
    ...     \n*4.Get the value of current language of Gmail site*
    ...     \n*5.Compare Current Language with User Expected Language (expected language - default English (United Kingdom), can be overridden on command line)*
    ...     \n*5.a-No action if the language is same*
    ...     \n*5.b-Set the appropriate language as set for execution*
    ...     ---
    ...     \n_Submitted By : Chinmaya Karve_
    ...     \n_Candidate Email Address : ckarve@gmail.com_
    ...     \n_Candidate Phone Number : +91 9923423346_
    ...     \n_Date Completed : 21st December 2020_
    Open Browser   ${url}      ${browser}
    Maximize Browser Window
    Element Should Be Visible   ${initialView}
    sleep   2s
    ${currentLanguage}=    Get Element Attribute   ${selectedLanguage}     data-value
    Run Keyword If      "${currentLanguage}"=="${languageCode}"     Log     GMail Login locale same as expected; skipping language selection.   ELSE    Select Language     ${languageCode}
    sleep   2s


Select Language
    [Documentation]   *Keyword to Select user preferred language on Gmail Website. Needs language code as input.*
    ...     \n*1.Selects the given language from the Language option on the Gmail login screen*
    ...     \n*2.Checks if the user is taken to Google About page, or if the user is still on the Gmail Login screen (this happens when the first time user tries to change the language)*
    ...     \n*2.a If the user is on About site, choose Sign In option again to come back to Gmail Login screen (this actually a Google Account site with redirect parameters to Gmail). No action needed if on Gmail screen.*
    ...     \n*3.Select the desired language from the drop dwn list.*
    ...     \n*4.Set Status flag to 1, indicating that the language option has been done once (this is to handle redirection to About Site)*
    ...     ---
    ...     \n_Submitted By : Chinmaya Karve_
    ...     \n_Candidate Email Address : ckarve@gmail.com_
    ...     \n_Candidate Phone Number : +91 9923423346_
    ...     \n_Date Completed : 21st December 2020_
    [Arguments]     ${newLanguageCode}
    ${tmpXpath}=    Replace String      ${languageOption}    LANGUAGE    ${newLanguageCode}
    Click Element   ${languageSelection}
    sleep   5s
    Click Element   ${tmpXpath}
    sleep   5s
    ${currentURL}=      Get Location
    ${tmpGmailAboutURL}=    Replace String      ${gmailAboutLink}    LANGUAGE    ${newLanguageCode}
    ${isOnGmailAboutPage}=   Run Keyword and Return Status      Should be Equal    ${currentURL}   ${tmpGmailAboutURL}
    Run Keyword If  "${isOnGmailAboutPage}"=="True"    Click Element        (//*[@class="h-c-header__nav-li g-mail-nav-links"]//a)[2]
    sleep   5s
    Switch Window   New
    sleep   5s
    Click Element   ${languageSelection}
    sleep   5s
    Click Element   ${tmpXpath}
    ${languageSwitchStatus}=    Set Variable    ${1}


Switch Language
    [Documentation]   *Keyword to Switch user preferred language on Gmail Website. Needs language code as input.*
    ...     \n*1.Selects the given language from the Language option on the Gmail login screen*
    ...     ---
    ...     \n_Submitted By : Chinmaya Karve_
    ...     \n_Candidate Email Address : ckarve@gmail.com_
    ...     \n_Candidate Phone Number : +91 9923423346_
    ...     \n_Date Completed : 21st December 2020_
    [Arguments]     ${newLanguageCode}
    ${tmpXpath}=    Replace String      ${languageOption}    LANGUAGE    ${newLanguageCode}
    Click Element   ${languageSelection}
    sleep   5s
    Click Element   ${tmpXpath}
    sleep   5s