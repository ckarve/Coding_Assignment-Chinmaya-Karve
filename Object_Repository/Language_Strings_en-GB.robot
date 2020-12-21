*** Variables ***

## Error Messages ##

${emailHelperText}       Email or phone
${emptyError}   Enter an email or phone number
${incorrectAccount}     Couldn't find your Google Account
${incorrectPassword}        Wrong password. Try again or click Forgot password to reset it.
${supportArticleHeader}     Browse Chrome as a guest
${gmailHelpPageTitle}       How can we help you?
${gmailPrivacyPageTitle}    Privacy Policy
${gmailTermsPageTitle}      Google Terms of Service


## Xpath Containing Text ###

${forgotEmailLink}      //button[contains(text(),"Forgot email?")]
${learnMoreLink}        //a[contains(text(),'Learn more')]
${createAccountLink}        //span[contains(text(),'Create account')]
${nextButtonLink}           //*[@data-primary-action-label='Next']//button

${helpLink}         //a[contains(text(),'Help')]

${privacyLink}      //a[contains(text(),'Privacy')]

${termsLink}        //a[contains(text(),'Terms')]