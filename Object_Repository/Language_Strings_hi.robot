*** Variables ***

## Error Messages ##

${emailHelperText}       ईमेल या फ़ोन
${emptyError}   मान्य ईमेल या फ़ोन नंबर डालें
${incorrectAccount}     आपका Google खाता नहीं मिल सका
${incorrectPassword}        पासवर्ड गलत है. फिर से कोशिश करें या उसे रीसेट करने के लिए पासवर्ड भूल गए पर क्लिक करें.
${supportArticleHeader}     मेहमान के तौर पर Chrome ब्राउज़ करना
${gmailHelpPageTitle}       हम आपकी सहायता कैसे कर सकते हैं?
${gmailPrivacyPageTitle}    निजता नीति
${gmailTermsPageTitle}      सेवा की शर्तें


## Xpath Containing Text ###

${forgotEmailLink}      //button[contains(text(),"ईमेल भूल गए?")]
${learnMoreLink}        //a[contains(text(),'ज़्यादा जानें')]
${createAccountLink}        //span[contains(text(),'खाता बनाएं')]
${nextButtonLink}           //*[@data-primary-action-label='आगे']//button
${helpLink}         //a[contains(text(),'सहायता')]
${privacyLink}      //a[contains(text(),'निजता')]
${termsLink}        //a[contains(text(),'नियम')]