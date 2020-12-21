*** Variables ***

${initialView}      //*[@id="initialView"]
${gmailLogo}        //*[@id='logo']
${headingText}      //*[@id='headingText']
${headingSubText}       //*[@id='headingSubtext']
${signOnLink}      (//*[@class="h-c-header__nav-li g-mail-nav-links"]//a)[2]

${languageOption}           //*[@id="lang-chooser"]/div[not(@aria-hidden)]/div[@data-value="LANGUAGE"]
${selectedLanguage}         //*[@id="lang-chooser"]//div[@aria-selected="true"]

${emailInputField}      //*[@id='identifierId']
${emailInputFieldText}      //*[@id='identifierId']//..//div

${passwordField}        //*[@id='password']//input

${languageSelection}        //*[@id='lang-chooser']

${forgotPasswordEmail}      //*[@id='recoveryIdentifierId']
${forgotPasswordFName}      //*[@id='firstName']
${forgotPasswordLName}      //*[@id='lastName']

${showPassword}         //*[@id="selectioni1"]

${passwordType}         //*[@id="password"]//input
${switchUserName}       //*[contains(@aria-label,"${username}@gmail.com")]



${accountIcon}      //*[contains(@aria-label,'Google Account:')]

${signOutLink}      //*[contains(@aria-label,'Account Information')]//a[contains(text(),'Sign out')]
