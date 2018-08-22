*** Setting ***

Library  String
Library  DateTime
Library  uatenders_service.py

*** Variables ***

${locator.title}                                                xpath=(//div[@class='col-md-12']/h2)[1]
${locator.description}                                          xpath=(//div[@class='col-md-12']/p)[1]
${locator.auctionPeriod.endDate}                                xpath=(//td[@class='auctionEndDate'])
${locator.auctionPeriod.startDate}                              xpath=(//td[@class='enquiryPeriod']/span)
${locator.status}                                               xpath=(//table[@class="clean-table"]//span)[1]
${locator.minimalStep.amount}                                   xpath=(//*[contains(text(),'Розмір мінімального кроку')])/../*[position() mod 2 = 0]
${locator.value.amount}                                         xpath=(//*[contains(text(),'Очікувана вартість:') or contains(text(),'Початкова ціна:')]/..//*[position() mod 2 = 0]/span)[1]
${locator.value.currency}                                       xpath=(//*[@class='auct_currency'])[1]
${locator.value.valueAddedTaxIncluded}                          xpath=(//span[@class='valueAddedTaxIncluded'])
${locator.auctionID}                                            xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])[1]
${locator.procuringEntity.name}                                 xpath=(//td[@class='item-procuringEntity.name'])
${locator.enquiryPeriod.startDate}                              xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[1]
${locator.enquiryPeriod.endDate}                                xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[2]
${locator.tenderPeriod.startDate}                               xpath=(//span[@class='startDate'])
${locator.tenderPeriod.endDate}                                 xpath=(//span[@class='endDate'])
${locator.dgf}                                                  xpath=(//*[contains(text(),'Номер лоту')]/..//*[position() mod 2 = 0])
${locator.cancellations[0].status}                              xpath=(//*[contains(text(),'Статус')]/..//*[position() mod 2 = 0])[1]
${locator.cancellations[0].reason}                              xpath=(//*[contains(text(),'Причина відміни')]/..//*[position() mod 2 = 0])[2]
${locator.cancellations[0].documents[0].description}            xpath=(//*[contains(@class,'doc-download')])[1]
${locator.eligibilityCriteria}                                  xpath=(//td[@class='eligibilityCriteria'])
${locator.procurementMethodType}                                xpath=(//*[contains(text(),'Тип процедури:')]/..//*[position() mod 2 = 0])
${locator.dgfDecisionDate}                                      xpath=(//span[@class='dgf_decision_date'])
${locator.dgfDecisionID}                                        xpath=(//span[@class='dgf_decision_id'])
${locator.tenderAttempts}                                       xpath=(//*[@class='lotDescription']/span)[1]
${locator.awards[0].status}                                     xpath=(//*[@class='col-md-12']//span[contains(@class,'label')])[1]
${locator.awards[1].status}                                     xpath=(//*[@class='col-md-12']//span[contains(@class,'label')])[2]
${locator.guarantee.amount}                                     xpath=(//*[contains(text(),'Розмiр гарантiйного внеску')])/../*[position() mod 2 = 0]
${locator.minNumberOfQualifiedBids}                             xpath=(//*[contains(text(),'Мінімальна кількість учасників')])/../*[position() mod 2 = 0]
${locator.registrationFee.amount}                               xpath=(//*[contains(text(),'Реєстраційний внесок:')]/..//*[position() mod 2 = 0]//span)[1]


*** Keywords ***

Підготувати клієнт для користувача
  [Arguments]  ${username}
  [Documentation]  Відкрити брaузер, створити обєкт api wrapper, тощо
  Open Browser   ${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${username}
  Set Window Size       @{USERS.users['${username}'].size}
  Set Window Position   @{USERS.users['${username}'].position}
  Maximize Browser Window
#Login
  Wait Until Element Is Visible      xpath=(//*[text()[contains(.,'Вхід')]])    10
  Click Element                      xpath=(//*[text()[contains(.,'Вхід')]])
  Wait Until Page Contains Element   name=email                   10
  Input text                         name=email                   ${USERS.users['${username}'].login}
  Input text                         name=password                ${USERS.users['${username}'].password}
  Wait Until Page Contains Element   xpath=//*[@value='Увійти']   25
  Click Element                      xpath=//*[@value='Увійти']

Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${dates}=                    get_all_uatenders_dates        ${ARGUMENTS[1]}
  ${start_day_auction}=      convert_datetime_for_delivery    ${dates['StartDate']}
  ${title}=                      Get From Dictionary          ${ARGUMENTS[1].data}                   title
  ${description}=                Get From Dictionary          ${ARGUMENTS[1].data}                   description
  ${dgf}=                        Get From Dictionary          ${ARGUMENTS[1].data}                   dgfID
  ${guaranteeAmount}=            Get From Dictionary          ${ARGUMENTS[1].data.guarantee}         amount
  # items_0
  ${items}=                      Get From Dictionary          ${ARGUMENTS[1].data}                   items
  ${item0}=                      Get From List                ${items}                               0
  ${cpvs_id}=                    Get From Dictionary          ${items[0].additionalClassifications[0]}             id
  ${minNumberOfQualifiedBids}=   Get From Dictionary          ${ARGUMENTS[1].data}                   minNumberOfQualifiedBids
  ${minNumberOfQualifiedBids}=   Convert To String            ${minNumberOfQualifiedBids}
  ${step_rate}=                  Get From Dictionary          ${ARGUMENTS[1].data.minimalStep}       amount
  ${step_rate}=                  Convert To String            ${step_rate}
  ${procurementMethodType}=      Get From Dictionary          ${ARGUMENTS[1].data}                   procurementMethodType
  #procuringEntity
  ${proc_name}=                  Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity}              name
  ${proc_ID}=                    Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.identifier}   id
  ${proc_countryName}=           Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.address}      countryName
  ${proc_locality}=              Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.address}      locality
  ${proc_postalCode}=            Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.address}      postalCode
  ${proc_region}=                Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.address}      region
  ${proc_streetAddress}=         Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.address}      streetAddress
  ${cont_name}=                  Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.contactPoint}    name
  ${cont_telephone}=             Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.contactPoint}    telephone
  ${cont_faxNumber}=             Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.contactPoint}    faxNumber
  ${cont_url}=                   Get From Dictionary          ${ARGUMENTS[1].data.procuringEntity.contactPoint}    url
  ${tenderAttempts}=             Get From Dictionary          ${ARGUMENTS[1].data}                   tenderAttempts
  ${tenderAttempts}=             Convert To String            ${tenderAttempts}
  # value
  ${budget}=                     Get From Dictionary          ${ARGUMENTS[1].data.value}             amount
  ${budget}=                     Convert To String            ${budget}
  ${currency}=                   Get From Dictionary          ${ARGUMENTS[1].data.value}             currency
  ${valueAddedTaxIncluded}=      Get From Dictionary          ${ARGUMENTS[1].data.value}             valueAddedTaxIncluded
  ${filepyth}=                              get_file_path
  #Редагування "Дані організації"
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a    25
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/ul/li[2]/a
  Input Text                          name=name               ${proc_name}
  Input Text                          name=identifier         ${proc_ID}
  Input Text                          name=country            ${proc_countryName}
  Input Text                          name=region             ${proc_region}
  Input Text                          name=postal_code        ${proc_postalCode}
  Input Text                          name=locality           ${proc_locality}
  Input Text                          name=address            ${proc_streetAddress}
  Input Text                          name=contact_name       ${cont_name}
  Input Text                          name=contact_fax        ${cont_faxNumber}
  Input Text                          name=contact_url        ${cont_url}
  Click Element                       xpath=//*[@type='submit']
  # "Додати аукціон"
  # Інформація
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a    25
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/ul/li[1]/a
  # CAV or CPV
  Run Keyword IF  '${cpvs_id}' == 'PA01-7'
  ...  Select From List By Value         id=procedure_types_id   2
  ...  ELSE  Select From List By Value   id=procedure_types_id   1
  Run Keyword If   '${procurementMethodType}' == 'dgfOtherAssets'    Run Keyword
  ...   Select From List        xpath=//select[@name='min_bids']        ${minNumberOfQualifiedBids}
  Input Text                          name=dgfID              ${dgf}
  Input Text                          name=title              ${title}
  Input Text                          xpath=(//*[contains(text(),'Загальний опис аукціону')])/../*[position() mod 2 = 0]/textarea         ${description}
  Select From List                    xpath=//select[@name='attempts']       ${tenderAttempts}
  Run Keyword IF    '${valueAddedTaxIncluded}' == 'True'        Click Element            name=tax
  Input Text                          name=amount             ${budget}
  Input Text                          name=min_step_amount    ${step_rate}
  # Дати
  Input Text                          name=should_start_after            ${start_day_auction}
  # Документація
  Choose File                         id=tender-1             ${filepyth}
  # Активи
  Додати багато предметів   ${ARGUMENTS[1]}
  Wait Until Element Is Visible       xpath=//*[text()='Опублікувати']    25
  Click Element                       xpath=//*[text()='Опублікувати']
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Run Keyword IF      '${ARGUMENTS[0]}' == 'PASS'     Element Should Be Visible       xpath=(//*[contains(text(),'ID:')])[1]      ID:
  ...   AND   Reload Page
  ...   AND   Wait Until Page Does Not Contain  Аукціон на публікації  5 s
  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   auctionID
  [Return]  ${tender_UAid}

Додати багато предметів
  [Arguments]  ${tender_data}
  ${items}=           Get From Dictionary   ${tender_data.data}   items
  ${Items_length}=        Get Length        ${items}
  :FOR   ${index}   IN RANGE   ${Items_length}
  \   Додати предмет   ${items[${index}]}  ${index}

Додати предмет
  [Arguments]  ${item}  ${index}
  ${quantity}=                     Get From Dictionary                 ${item}                            quantity
  ${quantity}=                     Convert To String                   ${quantity}
  ${unit_id}=                      get_unit_id                         ${item.unit.name}
  ${contractPeriod_startDate}=     convert_datetime_for_delivery       ${item.contractPeriod.startDate}
  ${contractPeriod_endDate}=       convert_datetime_for_delivery       ${item.contractPeriod.endDate}
  ${filepyth}=                              get_file_path
  Run Keyword And Ignore Error         Click Element     xpath=//*[text()='Редагувати']
  Run Keyword IF    ${index} != 0
  ...    Click Element                 xpath=//a[@class="btn btn-success add-item-section"]
  Wait Until Element Is Visible        name=items[${index}][description]      25
  Input Text                           name=items[${index}][description]      ${item.description}
  Input Text                           name=items[${index}][quantity]         ${quantity}
  Wait Until Page Contains Element     name=items[${index}][unit_id]
  Click Element                        name=items[${index}][unit_id]
  Select From List                     xpath=//select[@name='items[${index}][unit_id]']   ${unit_id}
  # CAV
  Input Text                           name=items[${index}][cav]              ${item.classification.id}
  Sleep  2
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[1]
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[2]
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[3]
  Input Text                           name=items[${index}][delivery_date_start]        ${contractPeriod_startDate}
  Input Text                           name=items[${index}][delivery_date_end]          ${contractPeriod_endDate}
  # Адреса місцезнаходження майна/активу
  Input Text                           name=items[${index}][country]          ${item.deliveryAddress.countryName}
  Input Text                           name=items[${index}][region]           ${item.deliveryAddress.region}
  Input Text                           name=items[${index}][postal_code]      ${item.deliveryAddress.postalCode}
  Input Text                           name=items[${index}][locality]         ${item.deliveryAddress.locality}
  Input Text                           name=items[${index}][address]          ${item.deliveryAddress.streetAddress}
  Execute Javascript  window.document.evaluate("//*[@type='submit']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                        xpath=//*[@type='submit']

Отримати інформацію про auctionID
  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   auctionID
  [Return]  ${tender_UAid}

Задати питання
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  ${title}=           Get From Dictionary  ${question.data}  title
  ${description}=     Get From Dictionary  ${question.data}  description
  Wait Until Element Is Visible     xpath=//*[text()='Задати запитання'][1]      10
  Click Element                     xpath=//*[text()='Задати запитання'][1]
  Wait Until Element Is Visible     name=title          10
  Input text                        name=title                     ${title}
  Input Text                        name=question                  ${description}
  Wait Until Element Is Visible     xpath=//*[@type='submit']      10
  Click Element                     xpath=//*[@type='submit']

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  ${title}=           Get From Dictionary    ${question.data}    title
  ${description}=     Get From Dictionary    ${question.data}    description
  uatenders.Пошук тендера по ідентифікатору  ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Element Is Visible    xpath=(//a[@class='btn btn-success auctionQuestion'])[1]    15
  Wait Until Element Is Visible                xpath=(//a[@class='btn btn-success auctionQuestion'])[1]    15
  Click Element                                xpath=(//a[@class='btn btn-success auctionQuestion'])[1]
  Wait Until Element Is Visible                name=title      10
  Input Text                                   name=title                                 ${title}
  Input Text                                   name=question                              ${description}
  Wait Until Element Is Visible     xpath=(//input[@class='btn btn-xs btn-default'])      10
  Click Element                     xpath=(//input[@class='btn btn-xs btn-default'])

Подати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${test_bid_data}
  ${amount}=           Get From Dictionary    ${test_bid_data.data.value}    amount
  ${amount}=            Convert To String     ${amount}
  uatenders.Пошук тендера по ідентифікатору  ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Element Is Visible     xpath=//*[text()='Подати пропозицію'][1]    5
  Wait Until Element Is Visible       xpath=//*[text()='Подати пропозицію'][1]    10
  Click Element                       xpath=//*[text()='Подати пропозицію'][1]
  Wait Until Element Is Visible       xpath=//*[@id="self_eligible"]      10
  Click Element                       xpath=//*[@id="self_eligible"]
  Run Keyword If     'Неможливість' in '${TEST_NAME}'       Click Element                xpath=//*[@type='submit']//
  Run Keyword If     '${MODE}' == 'dgfFinancialAssets'      Run Keyword
  ...   Input Text                   name=amount       ${amount}
  ...      ELSE IF   '${MODE}' == 'dgfOtherAssets'          Run Keywords
  ...   Input Text                   name=amount       ${amount}
  ...   AND   uatenders.Завантажити документ в ставку  ${username}  ${tender_uaid}  ${test_bid_data}
  ...      ELSE IF   '${MODE}' == 'auctions'                Run Keywords
  ...   Input Text                   name=amount       ${amount}
  ...   AND   uatenders.Завантажити документ в ставку  ${username}  ${tender_uaid}  ${test_bid_data}
  ...   AND   Sleep  10
  ...   AND   Wait Until Element Is Visible   xpath=(//*[text()='Опублікувати'])[1]      5
  ...   AND   Click Element                   xpath=(//*[text()='Опублікувати'])[1]
  ...      ELSE IF   '${MODE}' == 'dgfInsider' or '${MODE}' == 'dgfFinancialAssets'          Run Keyword
  ...   Click Element                 xpath=(//*[@type='submit'])[1]
  Wait Until Element Is Visible       xpath=(//h2[contains(text(),'Мої пропозиції')])[1]    10
  Run Keyword If   'без кваліфікації' in '${TEST_NAME}'
  ...  Fail  "Неможливо подати пропозицію без кваліфікації"

Скасувати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                       xpath=(//*[text()='Редагувати пропозицію'])[1]
  Wait Until Element Is Visible       xpath=//*[text()='Відмінити']    25
  Click Element                       xpath=//*[text()='Відмінити']
  Sleep  5
  Focus            xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]
  Sleep  2
  Press Key        xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]     \\13

Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${amount}  ${amount.value}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${amount} =          Convert To String      ${amount.value}
  Click Element               xpath=//*[text()='Редагувати пропозицію']
  Clear Element Text          name=amount
  Input Text                  name=amount                   ${amount}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    15
  Click Element                     xpath=//*[@type='submit']

Завантажити документ в ставку
  [Arguments]  ${username}  ${filePath}  ${tender_uaid}
  ${filepyth}=                              get_file_path
  Run Keyword IF   'Неможливість' in '${TEST_NAME}'      Run Keywords
  ...   uatenders.Пошук тендера по ідентифікатору  ${username}   ${tender_uaid}
  ...   AND     uatenders.Оновити сторінку з тендером
  Sleep  2
  Choose File                 id=bid-1            ${filepyth}
  Sleep  2
  Wait Until Element Is Visible     xpath=(//*[@type='submit'])[1]    15
  Click Element                     xpath=(//*[@type='submit'])[1]

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  tenderId
  ${filepyth}=                get_file_path
  Sleep  5
  Choose File                 id=bid-1            ${filepyth}
  Sleep  2
  Wait Until Element Is Visible     xpath=//*[@type='submit']    15
  Click Element                     xpath=//*[@type='submit']

Відповісти на питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=        Get From Dictionary        ${ARGUMENTS[3].data}   answer
  Run Keyword IF   'запитання на лот' in '${TEST_NAME}'               Click Element       xpath=//a[@class="questionItem"]
  Run Keyword IF   'запитання на всі предмети' in '${TEST_NAME}'      Click Element       xpath=//a[@class="auctionQuestionList"]
  Wait Until Element Is Visible     xpath=//*[text()='Відповісти']    15
  Click Element                     xpath=//*[text()='Відповісти']
  Input Text                        name=answer                             ${answer}
  Click Element                     xpath=//*[@type='submit']
  Sleep  2

Завантажити документ
  [Arguments]  ${username}  ${filepath}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element               xpath=//*[text()='Редагувати']
  Choose File                 name=tender[files][]                   ${filepath}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    15
  Click Element                     xpath=//*[@type='submit']

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  tender_uaid
  ...    ${ARGUMENTS[2]} =  fieldname
  ...    ${ARGUMENTS[3]} =  fieldvalue
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${amount}=          Convert To String      ${ARGUMENTS[3]}
  Click Element               xpath=//*[text()='Редагувати']
  ${minimalStep_value}=      Run Keyword IF    '${ARGUMENTS[2]}' == 'value.amount'
  ...   uatenders.Зберегти дані minimalStep поля
  ${guarantee_value}=      Run Keyword IF    '${ARGUMENTS[2]}' == 'value.amount'
  ...   uatenders.Зберегти дані guarantee поля
  Run Keyword IF    '${ARGUMENTS[2]}' == 'value.amount'             Run Keywords
  ...   Clear Element Text            name=amount
  ...   AND   Input Text              name=amount                  ${amount}
  ...   AND   Click Element           xpath=(//*[@class='input-group']/input)
  ...   AND   Click Element           xpath=(//*[contains(text(),'Контактні дані')])[1]
  ...   AND   Sleep  2
  ...   AND   Clear Element Text      name=min_step_amount
  ...   AND   Clear Element Text      name=guarantee_amount
  ...   AND   Clear Element Text      xpath=(//*[@class='input-group']/*)[1]
  ...   AND   Sleep  2
  ...   AND   Input Text              name=min_step_amount         ${minimalStep_value}
  ...   AND   Input Text              name=guarantee_amount        ${guarantee_value}
  ...     ELSE IF   '${ARGUMENTS[2]}' == 'minimalStep.amount'       Run Keywords
  ...   Clear Element Text            name=min_step_amount
  ...   AND   Clear Element Text      xpath=(//*[@class='input-group']/*)[1]
  ...   AND   Sleep  2
  ...   AND   Input Text              name=min_step_amount         ${amount}
  ...   AND   Click Element           xpath=(//*[contains(text(),'Контактні дані')])[1]
  ...     ELSE IF   '${ARGUMENTS[2]}' == 'guarantee.amount'         Run Keywords
  ...   Clear Element Text            name=guarantee_amount
  ...   AND   Input Text              name=guarantee_amount        ${amount}
  ...     ELSE IF   '${ARGUMENTS[2]}' == 'tenderPeriod.startDate'   Run Keyword
  ...   Input Text                    name=should_start_after      ${amount}
  Wait Until Element Is Visible       xpath=//*[@id="submit-edit-btn"]    10
  Click Element                       xpath=//*[@id="submit-edit-btn"]

Зберегти дані minimalStep поля
  ${minimalStep_get_value}=        Get Value        name=min_step_amount
  Run Keyword And Return   Set Variable         ${minimalStep_get_value}

Зберегти дані guarantee поля
  ${guarantee_get_value}=          Get Value        name=guarantee_amount
  Run Keyword And Return   Set Variable         ${guarantee_get_value}

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  Run Keyword IF    '${MODE}' == 'dgfOtherAssets'
  ...   Switch Browser     1
  ${test_name_value}=                Convert To String                                  ${TEST_NAME.replace('\'', '')}
  Run Keyword IF    'відповісти на запитання на всі предмети' in '${test_name_value}'   Run Keywords
  ...   Execute Javascript  window.document.evaluate("(//*[contains(text(),'Аукціон')])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(false);
  ...   AND   Click Element           xpath=(//*[contains(text(),'Аукціон')])[1]
  Run Keyword And Ignore Error         Click Element      xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])
  Sleep  5
  Reload Page
  Sleep  2

Подати скаргу
  [Arguments]  @{ARGUMENTS}
  Fail  Немає такого поля при перегляді

Порівняти скаргу
  [Arguments]  @{ARGUMENTS}
  Fail  Немає такого поля при перегляді

Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  Run Keyword IF    '${MODE}' == 'dgfInsider'
  ...   Switch Browser     1
  Go To  ${USERS.users['${ARGUMENTS[0]}'].homepage}
  Run Keyword IF    '${MODE}' == 'assets' or '${MODE}' == 'lots'        Run Keywords
  ...   Wait Until Element Is Visible                xpath=(//*[@id='allTab'])[2]      10
  ...   AND    Click Element                         xpath=(//*[@id='allTab'])[2]
  ...     ELSE IF   '${MODE}' == 'contracts'           Run Keywords
  ...   Wait Until Element Is Visible                xpath=(//*[@id='allTab'])[3]      10
  ...   AND    Click Element                         xpath=(//*[@id='allTab'])[3]
  Wait Until Keyword Succeeds   15 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Input Text                                   name=search[s]                    ${ARGUMENTS[1]}
  ...   AND   Click Element                                xpath=(//*[contains(@type,'submit') and contains(text(),'Знайти')])
  ...   AND   Element Should Be Visible                    xpath=(//*[text()[contains(.,'Загальна інформація') or contains(.,'Статус:')]])[1]
  Log To Console  tenderID_${MODE} --> ${ARGUMENTS[1]}

Отримати інформацію про dgfID
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   dgf

Отримати інформацію про title
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   title

Отримати інформацію про value.currency
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   value.currency

Отримати інформацію про status
  Run Keyword IF   'статусу неуспішного лоту' in '${TEST_NAME}'                   Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  ...     ELSE IF   'статусу скасованого лоту' in '${TEST_NAME}'                  Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  ...     ELSE IF   'Неможливість завантажити' in '${TEST_NAME}'                  Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  ...     ELSE IF   'посилання на аукціон для глядача' in '${TEST_NAME}'          Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  ...     ELSE IF   'статусу скасованої процедури' in '${TEST_NAME}'              Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  ...     ELSE IF   'статус процедури в період кваліфікації' in '${TEST_NAME}'    Run Keyword
  ...   Click Element           xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  Sleep  2
  ${return_value}=   Отримати текст із поля і показати на сторінці   status
  Run Keyword And Return   convert_uatenders_string_to_common_string   ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про minNumberOfQualifiedBids
  ${return_value}=   Отримати текст із поля і показати на сторінці   minNumberOfQualifiedBids
  Run Keyword And Return        Convert To Number        ${return_value}

Отримати інформацію про description
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   description

Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.amount
  ${return_value}=            Get Line             ${return_value}    0
  ${return_value}=         Fetch From Left         ${return_value}   UAH
  Run Keyword And Return        Convert To Number        ${return_value.split(' ')[0]}

Отримати інформацію про guarantee.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   guarantee.amount
  ${return_value}=            Get Line             ${return_value}    0
  Run Keyword And Return        Convert To Number        ${return_value.split(' ')[0]}

Отримати інформацію про tenderId
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   tenderId

Отримати інформацію про auctionPeriod.startDate
  Wait Until Keyword Succeeds   15 x   60 s   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(//*[@class='enquiryPeriod'])/span
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.startDate
  Run Keyword And Return            convert_auction_date     ${return_value}

Отримати інформацію про auctionPeriod.endDate
  Wait Until Keyword Succeeds   25 x   60 s   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(//*[contains(text(),'Дата закінчення аукціону')])[1]
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.endDate
  Run Keyword And Return            convert_auction_date    ${return_value}

Отримати інформацію про procuringEntity.name
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   procuringEntity.name

Change_date_to_month
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]}  ==  date
  ${day}=            Get Substring          ${ARGUMENTS[0]}    0   2
  ${month}=          Get Substring          ${ARGUMENTS[0]}    3   6
  ${year}=           Get Substring          ${ARGUMENTS[0]}    5
  ${return_value}=   Convert To String      ${month}${day}${year}
  [Return]  ${return_value}

Отримати інформацію про enquiryPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   enquiryPeriod.startDate
  Run Keyword And Return   Change_date_to_month   ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   enquiryPeriod.endDate
  Run Keyword And Return   convert_auction_date   ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  Run Keyword And Return   convert_auction_date   ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  Run Keyword And Return   convert_auction_date   ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  Run Keyword And Return   Convert To Number   ${return_value.split(' ')[0]}

Отримати інформацію про registrationFee.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   registrationFee.amount
  Run Keyword And Return   Convert To Number   ${return_value.split(' ')[0]}

Додати предмети закупівлі
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} =  3
  ${period_interval}=       Get Broker Property By Username    ${ARGUMENTS[0]}              period_interval
  ${tender_data}=           prepare_test_tender_data           ${period_interval}           multi
  ${items}=                 Get From Dictionary                ${tender_data.data}          items
  ${description}=           Get From Dictionary                ${tender_data.data}          description
  ${quantity}=              Get From Dictionary                ${items[0]}                  quantity
  ${cpv}=                   Convert To String                  Картонки
  ${cpv_id}=                Get From Dictionary                ${items[0].classification}   id
  ${cpv_id1}=               Replace String                     ${cpv_id}   -   _
  ${dkpp_id1}=              Replace String                     ${dkpp_id}   -   _
  Run keyword if   '${TEST NAME}' == 'Можливість додати позицію закупівлі в тендер'         додати позицію
  Run keyword if   '${TEST NAME}' != 'Можливість додати позицію закупівлі в тендер'         видалити позиції

додати позицію
  Click Element                      xpath=//*[text()='Мои тендеры']
  Sleep  2
  Click Element                      xpath=(//a[@class='btn btn-xs btn-info']/span)[1]
  Sleep  2
  : FOR    ${INDEX}    IN RANGE    1    ${ARGUMENTS[2]} +1
  \   Click Element                  xpath=//button[@class='btn btn-info pull-right add-item-section']
  \   Додати предмет   ${items[${INDEX}]}   ${INDEX}
  Sleep  2
  Click Element                      xpath=//input[@class='btn btn-lg btn-danger']
  Wait Until Page Contains    [ТЕСТУВАННЯ]   25

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains Element         xpath=//a[@class="auctionUrl"]
  ${url}=        Get Element Attribute     xpath=//a[@class="auctionUrl"]@href
  Run Keyword And Return        Convert To String         ${url}

Отримати посилання на аукціон для учасника
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${url}=    Run Keyword If    '${MODE}' == 'dgfInsider'   Run Keyword
  ...   uatenders.Отримати посилання на аукціон dgfInsider   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ...        ELSE IF           '${MODE}' != 'dgfInsider'   Run Keyword
  ...   uatenders.Отримати посилання на аукціон              ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${participationUrl}=      Convert To String                ${url}
  [Return]  ${participationUrl}

Отримати посилання на аукціон
  [Arguments]   @{ARGUMENTS}
  Wait Until Page Contains Element                     xpath=//a[@class="auctionUrl"]
  Run Keyword And Return    Get Element Attribute      xpath=//a[@class="auctionUrl"]@href

Отримати посилання на аукціон dgfInsider
  [Arguments]   @{ARGUMENTS}
  Wait Until Element Is Visible         xpath=//*[text()='Мої пропозиції']    25
  Click Element                         xpath=//*[text()='Мої пропозиції']
  Wait Until Element Is Visible         xpath=((//*[contains(text(),'${ARGUMENTS[1]}')]//..//*)[contains(@class,"auctionUrl")])    60
  ${url}=     Get Element Attribute     xpath=((//*[contains(text(),'${ARGUMENTS[1]}')]//..//*)[contains(@class,"auctionUrl")])@href
  Click Element                         xpath=(//*[contains(text(),'${ARGUMENTS[1]}')]//..//a)[1]
  [Return]   ${url}

# ==========================
#          Запитання
# ==========================
Отримати інформацію із запитання
  [Arguments]   ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  uatenders.Оновити сторінку з тендером
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible    xpath=(//*[contains(@class,'auctionQuestionList') and contains(.,'Запитання')])    Запитання
  Click Element                            xpath=(//*[contains(@class,'auctionQuestionList') and contains(.,'Запитання')])
  Run Keyword And Return       Отримати інформацію із запитання про questions[0].${field_name}   ${username}   ${question_id}

Отримати інформацію із запитання про questions[0].title
  [Arguments]  ${username}  ${question_id}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible    xpath=(//*[contains(text(),'${question_id}')]/..//*)[1]         ${question_id}
  Run Keyword And Return    Get Text       xpath=(//*[contains(text(),'${question_id}')]/..//*)[1]

Отримати інформацію із запитання про questions[0].description
  [Arguments]  ${username}  ${question_id}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${question_id}')]/..//following::*)[2]

Отримати інформацію із запитання про questions[0].answer
  [Arguments]  ${username}  ${question_id}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Contains Element    xpath=(//*[contains(text(),'${question_id}')]/..//following::*[contains(@class,'${question_id}')]//p)[1]           5
  Run Keyword And Return    Get Text              xpath=(//*[contains(text(),'${question_id}')]/..//following::*[contains(@class,'${question_id}')]//p)[1]

Підготувати дані для оголошення тендера
  [Arguments]  ${username}   ${tender_data}    ${role_name}
  ${tender_data}=    adapt_procuringEntity     ${tender_data}
  ${tender_data}=        adapt_item            ${tender_data}  ${role_name}
  [Return]  ${tender_data}

Отримати інформацію із тендера
  [Arguments]  ${username}   ${tender_uaid}   ${fieldname}
  Run Keyword And Return      Отримати інформацію про ${fieldname}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  Wait Until Page Contains Element             ${locator.${fieldname}}    20
  Run Keyword And Return      Get Text         ${locator.${fieldname}}

Отримати інформацію із предмету
  [Arguments]   ${username}  ${tender_uaid}  ${item_id}  ${field_name}
  Log     MODE ---> ${MODE}
  Run Keyword IF     '${MODE}' == 'lots'
  ...   Run Keyword And Return    uatenders.Отримати інформацію із лоту   ${username}   ${tender_uaid}   ${field_name}
  ...      ELSE IF   '${MODE}' != 'lots'
  ...   Run Keyword And Return    uatenders.Отримати значення поля items[0].${field_name}   ${item_id}   ${username}   ${tender_uaid}

Отримати значення поля items[0].description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${item_id}')]/..//*)[2]
Отримати значення поля items[1].description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${item_id}')]/..//*)[2]

Отримати значення поля items[0].deliveryDate.endDate
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=//*[@id="lot-0-item-0"]/table/tbody/tr[4]/td
  Run Keyword And Return   Change_date_to_month   ${return_value}

Отримати значення поля items[0].deliveryLocation.latitude
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Fail  Немає такого поля при перегляді

Отримати значення поля items[0].deliveryLocation.longitude
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Fail  Немає такого поля при перегляді

Отримати значення поля items[0].deliveryAddress.countryName
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.countryName'])

Отримати значення поля items[0].deliveryAddress.postalCode
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.postalCode'])

Отримати значення поля items[0].deliveryAddress.region
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${region_name}=   Run Keyword And Return Status
  ...   Get Text      xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[contains(text(),'Київ') or contains(text(),'м. Київ')])[1]
  ${return_value}=      Run Keyword IF     'True' == '${region_name}'
  ...   Convert To String   місто Київ
  ...        ELSE IF    'False' == '${region_name}'
  ...   Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.region'])
  [Return]    ${return_value}

Отримати значення поля items[0].deliveryAddress.locality
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.locality'])

Отримати значення поля items[0].deliveryAddress.streetAddress
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.streetAddress'])

Отримати значення поля items[0].classification.scheme
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='scheme'])[2]
  [Return]  ${return_value.replace(' -', '')}

Отримати значення поля items[0].classification.id
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='id'])[2]

Отримати значення поля items[0].classification.description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='description'])[2]

Отримати значення поля items[0].additionalClassifications[0].description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='description'])[1]

Отримати значення поля items[0].quantity
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-amount'])/span[1]
  Run Keyword And Return   Convert To Number                            ${return_value.split(' ')[0]}

Отримати значення поля items[1].quantity
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-amount'])/span[1]
  Run Keyword And Return   Convert To Number                            ${return_value.split(' ')[0]}

Отримати значення поля items[0].unit.name
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-amount'])/span[2]
  ${return_value}=    Convert To String                                 ${return_value}
  Run Keyword And Return   convert_uatenders_string_to_common_string    ${return_value}
Отримати значення поля items[1].unit.name
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-amount'])/span[2]
  ${return_value}=    Convert To String                                 ${return_value}
  Run Keyword And Return   convert_uatenders_string_to_common_string    ${return_value}

Отримати значення поля items[0].unit.code
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-amount'])/span[3]
  Run Keyword And Return   Convert To String                            ${return_value}

Отримати значення поля items[0].contractPeriod.startDate
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-delivery_period'])/span[1]
  Run Keyword And Return   convert_contractPeriod_date                  ${return_value}

Отримати значення поля items[0].contractPeriod.endDate
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=          Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-delivery_period'])/span[2]
  Run Keyword And Return   convert_contractPeriod_date                  ${return_value}

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  Click Element                        xpath=//*[text()='Мої пропозиції']
  Run Keyword And Ignore Error     Click Element        xpath=(//*[contains(text(),'Прочитано')])[1]
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'${tender_uaid}')]/..//span)[3]      30
  Click Element                        xpath=(//*[contains(text(),'${tender_uaid}')]/..//span)[3]
  ${value}=     Get Value              name=amount
  ${value}=     Convert To String      ${value.split('.')[0]}
  ${value}=     Convert To Number      ${value}
  [Return]    ${value}

Скасувати закупівлю
  [Arguments]  ${username}  ${tender_uaid}  ${cancellation_reason}  ${document}  ${new_description}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//a[@class='btn btn-danger'])      15
  Click Element                      xpath=(//a[@class='btn btn-danger'])
  Wait Until Element Is Visible      name=reason      15
  Input Text                         name=reason                                 ${cancellation_reason}
  Sleep  2
  Choose File                        id=cancel-1                                 ${document}
  Sleep  3
  Input Text                         name=cancel[descriptions][]                 ${new_description}
  Sleep  3
  Click Element                      xpath=//*[@type='submit']
  Sleep  5
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Активувати заявку')])[1]       15
  Click Element                      xpath=(//*[contains(text(),'Активувати заявку')])[1]
  Sleep  10
  uatenders.Оновити сторінку з тендером

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  ${option}=               Get Matching Xpath Count       //*[@class='table']//tr
  ${index}=                  get_minus_Index                     ${option}
  Run Keyword IF   'title' == '${field}'
  ...     Run Keyword And Return    Get Text    xpath=(//*[@class='table'])[1]//*[contains(text(),'${doc_id}')]
  Run Keyword And Return IF    'description' == '${field}'   Отримати інформацію про cancellations[0].documents[${index}].description

Отримати інформацію про cancellations[0].status
  uatenders.Оновити сторінку з тендером
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Sleep  2
  ${return_value}=   Отримати текст із поля і показати на сторінці    cancellations[0].status
  Run Keyword And Return       convert_uatenders_string_to_common_string   ${return_value}

Отримати інформацію про cancellations[0].reason
  uatenders.Оновити сторінку з тендером
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Sleep  2
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].reason

Отримати інформацію про cancellations[0].documents[${index}].description
  uatenders.Оновити сторінку з тендером
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Sleep  2
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].documents[0].description

Додати Virtual Data Room
  [Arguments]  ${username}  ${tender_uaid}  ${vdr_url}  ${title}=Sample Virtual Data Room
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Wait Until Element Is Visible      xpath=//*[text()='Додати гіперпосилання']     15
  Click Element                      xpath=//*[text()='Додати гіперпосилання']
  Input Text                         name=vdr[]             ${vdr_url}
  Click Element                      xpath=//*[@type='submit']

Завантажити ілюстрацію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  ${filepath}=   local_path_to_file   TestDocument.docx
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Choose File                        name=tender[files][]       ${filepath}
  Select From List                   xpath=//select[@name="tender[docTypes][]"]      19
  Wait Until Element Is Visible      xpath=//*[@type='submit']                     15
  Click Element                      xpath=//*[@type='submit']

Додати публічний паспорт активу
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  ${filepath}=   local_path_to_file   TestDocument.docx
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Choose File                        name=tender[files][]       ${filepath}
  Select From List                   xpath=//select[@name="tender[docTypes][]"]      15
  Wait Until Element Is Visible      xpath=//*[@type='submit']                     15
  Click Element                      xpath=//*[@type='submit']

Отримати інформацію про eligibilityCriteria
  ${return_value}=   Отримати текст із поля і показати на сторінці   eligibilityCriteria
  [Return]  ${return_value}

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//*[contains(@type,'${item_id}') and contains(.,'Задати запитання')])     15
  Click Element                      xpath=(//*[contains(@type,'${item_id}') and contains(.,'Задати запитання')])
  Wait Until Element Is Visible      name=title     15
  Input Text                         name=title                                      ${question.data.title}
  Input Text                         name=question                                   ${question.data.description}
  Wait Until Element Is Visible      xpath=(//input[@value='Опублікувати запитання'])[1]     15
  Click Element                      xpath=(//input[@value='Опублікувати запитання'])[1]
  Sleep  3
  Click Element                      xpath=(//*[contains(@class,'auctionQuestionList') and contains(.,'Запитання')])

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//*[contains(@class,'auctionQuestionList') and contains(.,'Запитання')])     15
  Click Element                      xpath=(//*[contains(@class,'auctionQuestionList') and contains(.,'Запитання')])
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'${question_id}')]//..//..)//*[contains(text(),'Відповісти')]     15
  Click Element                      xpath=(//*[contains(text(),'${question_id}')]//..//..)//*[contains(text(),'Відповісти')]
  Sleep  2
  Execute Javascript  window.document.evaluate("((//*[contains(text(),'${question_id}')]//..//..)//*[@value='Відправити'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(false);
  Wait Until Element Is Visible      xpath=((//*[contains(text(),'${question_id}')]//..//..)//*[@name='answer'])[1]         15
  Input Text                         xpath=((//*[contains(text(),'${question_id}')]//..//..)//*[@name='answer'])[1]         ${answer_data.data.answer}
  Wait Until Element Is Visible      xpath=((//*[contains(text(),'${question_id}')]//..//..)//*[@value='Відправити'])[1]    15
  Click Element                      xpath=((//*[contains(text(),'${question_id}')]//..//..)//*[@value='Відправити'])[1]

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  uatenders.Оновити сторінку з лотом    ${username}    ${tender_uaid}
  ${file_name}=          Get Text         xpath=//*[contains(text(),'${doc_id}')]
  ${url}=         Get Element Attribute   xpath=//*[contains(text(),'${doc_id}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}

Завантажити фінансову ліцензію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  Click Element                      xpath=//*[text()='Редагувати пропозицію']
  Choose File                        name=bid[files][]            ${filepath}
  Select From List                   name=bid[docTypes][]         14
  Wait Until Element Is Visible      xpath=(//*[contains(@type,'submit') and contains(@value,'Оновити')])     15
  Click Element                      xpath=(//*[contains(@type,'submit') and contains(@value,'Оновити')])

Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=(//a[@class='btn btn-warning'])
  Choose File                        id=award-0-1           ${document}
  Wait Until Element Is Visible      xpath=//*[@type='submit']        15
  Click Element                      xpath=//*[@type='submit']

Отримати кількість документів в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${bid_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=(//*[contains(text(),'Пропозиції')])[1]
  ${return_value}=      Get Text     xpath=(//span[@class='bidDocCount'])
  [Return]  ${return_value}

Завантажити протокол аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}  ${award_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати пропозицію']
  Sleep  4
  Choose File                        name=bid[files][]            ${filepath}
  Sleep  2
  Select From List                   name=bid[docTypes][]               15
  Wait Until Element Is Visible      xpath=//*[@type='submit']        15
  Click Element                      xpath=//*[@type='submit']

Отримати дані із документу пропозиції
  [Arguments]  ${user_name}  ${tender_id}  ${bid_index}  ${document_index}  ${field}
  Run Keyword And Return      Get Text     xpath=(//span[@id=${document_index}])

Отримати інформацію про procurementMethodType
  ${return_value}=   Отримати текст із поля і показати на сторінці   procurementMethodType
  Run Keyword And Return       convert_uatenders_string_to_common_string   ${return_value}

Отримати інформацію про dgfDecisionDate
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   dgfDecisionDate

Отримати інформацію про dgfDecisionID
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   dgfDecisionID

Отримати інформацію про tenderAttempts
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderAttempts
  Run Keyword And Return                  Convert To Integer               ${return_value}

Отримати кількість документів в тендері
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Run Keyword And Return              Get Matching Xpath Count            //*[@class='table']//tr

Отримати інформацію із документа по індексу
  [Arguments]  ${user_name}   ${tender_id}   ${document_index}   ${field}
  Run Keyword And Return              Get Text                           xpath=(//*[@class='table']//*[@index='${document_index}'])//span

Завантажити документ в тендер з типом
  [Arguments]  ${username}  ${tender_uaid}  ${doc}  ${doc_type}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${option}=      convert_uatenders_string_to_common_string     ${doc_type}
  Click Element                            xpath=//*[text()='Редагувати']
  Wait Until Page Contains Element         name=tender[files][]                          10
  Choose File                              name=tender[files][]                          ${doc}
  Select From List                         xpath=//select[@name="tender[docTypes][]"]    ${option}
  Wait Until Element Is Visible            xpath=//*[@type='submit']        15
  Click Element                            xpath=//*[@type='submit']

Додати офлайн документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                            xpath=//*[text()='Редагувати']
  Input Text                               name=x_dgfAssetFamiliarization       ${doc}
  Wait Until Element Is Visible            xpath=//*[@type='submit']        15
  Click Element                            xpath=//*[@type='submit']
  uatenders.Оновити сторінку з тендером
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}

Отримати кількість предметів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element                       xpath=(//span[@class='item-classification.scheme'])
  Run Keyword And Return       Get Matching Xpath Count           (//span[@class='item-classification.scheme'])

Додати предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Ignore Error    Додати предмет          ${item}   0

Видалити предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${lot_id}=${Empty}
  Run Keyword And Ignore Error    Click Element           xpath=//*[text()='Редагувати']

Підтвердити наявність протоколу аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${award_index}
  uatenders.Оновити сторінку з тендером
  Sleep  3
  Maximize Browser Window
  Sleep  3
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]    15
  Click Element                      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]
  Run Keyword IF   'Неможливість' in '${TEST_NAME}'        Run Keyword
  ...   Wait Until Element Is Not Visible           xpath=//a[text()[contains(.,'Підтвердити протокол')]]   120
  Sleep  5
  Wait Until Element Is Visible                     xpath=//a[text()[contains(.,'Підтвердити протокол')]]   30
  Click Element                                     xpath=//a[text()[contains(.,'Підтвердити протокол')]]
  Sleep  5
  uatenders.Оновити сторінку з тендером

Отримати інформацію про awards[0].status
  uatenders.Оновити сторінку з тендером
  Wait Until Keyword Succeeds   10 x   10 s   Run Keywords
  ...   Click Element                            xpath=(//*[contains(text(),'Пропозиції')])[1]
  ...   AND   Wait Until Page Contains Element   xpath=(//*[contains(text(),'Запропонована ціна')])[1]
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ${test_name_value}=                Convert To String                                         ${TEST_NAME.replace('\'', '')}
  Run Keyword IF   'оплачено, очікується підписання договору' in '${test_name_value}'
  ...   Wait Until Keyword Succeeds   10 x   10 s   Run Keywords
  ...   Wait Until Page Contains  Оплачено, очікується підписання договору
  ...   AND   Reload Page
  ${return_value}=    Отримати текст із поля і показати на сторінці    awards[0].status
  Run Keyword And Return      convert_uatenders_string_to_common_string      ${return_value}

Отримати інформацію про awards[1].status
  uatenders.Оновити сторінку з тендером
  Wait Until Keyword Succeeds   10 x   10 s   Run Keywords
  ...   Click Element                            xpath=(//*[contains(text(),'Пропозиції')])[1]
  ...   AND   Wait Until Page Contains Element   xpath=(//*[contains(text(),'Запропонована ціна')])[1]
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ${test_name_value}=                Convert To String                                         ${TEST_NAME.replace('\'', '')}
  Run Keyword IF   'оплачено, очікується підписання договору' in '${test_name_value}'
  ...   Wait Until Keyword Succeeds   15 x   15 s   Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Page Contains  Оплачено, очікується підписання договору
  Run Keyword IF   'статусу cancelled' in '${test_name_value}'
  ...   Wait Until Keyword Succeeds   15 x   15 s   Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Page Contains  Відмінено
  ${return_value}=    Отримати текст із поля і показати на сторінці    awards[1].status
  Run Keyword And Return      convert_uatenders_string_to_common_string      ${return_value}

# ==============================================================================
# #             Создание Малой Приватизации
# ==============================================================================
Створити об'єкт МП
  [Arguments]  ${username}  ${tender_data}
# Рішення про приватизацію
  ${decisionDate}=                                Get From Dictionary    ${tender_data.data.decisions[0]}                  decisionDate
  ${decisionDateEdit}=                            get_dgf                ${decisionDate}
  ${filepyth}=                                    get_file_path
# "Додати аукціон"
  Wait Until Page Contains Element    xpath=(//*[contains(text(),'Мої аукціони')])[1]    10
  Click Element                       xpath=(//*[contains(text(),'Мої аукціони')])[1]
  Wait Until Page Contains Element    xpath=((//*[@class='dropdown-menu'])[1]//*[position() mod 2 = 1])[1]    10
  Click Element                       xpath=((//*[@class='dropdown-menu'])[1]//*[position() mod 2 = 1])[1]
# Загальна інформація
  Input Text                          name=asset[title]                    ${tender_data.data.title}
  Input Text                          name=asset[description]              ${tender_data.data.description}
# Рішення про приватизацію
  Input Text                          name=asset[decisions][0][title]      ${tender_data.data.decisions[0].title}
  Input Text                          name=asset[decisions][0][ID]         ${tender_data.data.decisions[0].decisionID}
  Input Text                          name=asset[decisions][0][date]       ${decisionDateEdit}
# Склад об'єкта приватизації (Items)
  Додати об'єкта приватизації   ${tender_data}
# Розпорядник активу (assetCustodian)
  ClearFildAndInputText               name=asset[custodian][name]                      ${tender_data.data.assetCustodian.name}
  ClearFildAndInputText               name=asset[custodian][identifier][scheme]        ${tender_data.data.assetCustodian.identifier.scheme}
  ClearFildAndInputText               name=asset[custodian][identifier][id]            ${tender_data.data.assetCustodian.identifier.id}
  ClearFildAndInputText               name=asset[custodian][identifier][legal_name]    ${tender_data.data.assetCustodian.identifier.legalName}

  ClearFildAndInputText               name=asset[custodian][contact][name]             ${tender_data.data.assetCustodian.name}
  ClearFildAndInputText               name=asset[custodian][contact][phone]            ${tender_data.data.assetCustodian.contactPoint.telephone}
  ClearFildAndInputText               name=asset[custodian][contact][fax]              ${tender_data.data.assetCustodian.contactPoint.faxNumber}
  ClearFildAndInputText               name=asset[custodian][contact][email]            ${tender_data.data.assetCustodian.contactPoint.email}
  ClearFildAndInputText               name=asset[custodian][contact][url]              ${tender_data.data.assetCustodian.contactPoint.url}
  ClearFildAndInputText               name=asset[custodian][address][country]          ${tender_data.data.assetCustodian.address.countryName}
  ClearFildAndInputText               name=asset[custodian][address][region]           ${tender_data.data.assetCustodian.address.region}
  ClearFildAndInputText               name=asset[custodian][address][postal_code]      ${tender_data.data.assetCustodian.address.postalCode}
  ClearFildAndInputText               name=asset[custodian][address][locality]         ${tender_data.data.assetCustodian.address.locality}
  ClearFildAndInputText               name=asset[custodian][address][street_address]   ${tender_data.data.assetCustodian.address.streetAddress}
# Балансоутримувач активу (Holder)
  ClearFildAndInputText               name=asset[holder][name]                         ${tender_data.data.assetHolder.name}
  ClearFildAndInputText               name=asset[holder][identifier][scheme]           ${tender_data.data.assetHolder.identifier.scheme}
  ClearFildAndInputText               name=asset[holder][identifier][id]               ${tender_data.data.assetHolder.identifier.id}
  ClearFildAndInputText               name=asset[holder][identifier][legal_name]       ${tender_data.data.assetHolder.identifier.legalName}

  ClearFildAndInputText               name=asset[holder][contact][name]                ${tender_data.data.assetHolder.contactPoint.name}
  ClearFildAndInputText               name=asset[holder][contact][phone]               ${tender_data.data.assetHolder.contactPoint.telephone}
  ClearFildAndInputText               name=asset[holder][contact][fax]                 ${tender_data.data.assetHolder.contactPoint.faxNumber}
  ClearFildAndInputText               name=asset[holder][contact][email]               ${tender_data.data.assetHolder.contactPoint.email}
  ClearFildAndInputText               name=asset[holder][contact][url]                 ${tender_data.data.assetHolder.contactPoint.url}

  ClearFildAndInputText               name=asset[holder][address][country]             ${tender_data.data.assetHolder.address.countryName}
  ClearFildAndInputText               name=asset[holder][address][region]              ${tender_data.data.assetHolder.address.region}
  ClearFildAndInputText               name=asset[holder][address][postal_code]         ${tender_data.data.assetHolder.address.postalCode}
  ClearFildAndInputText               name=asset[holder][address][locality]            ${tender_data.data.assetHolder.address.locality}
  ClearFildAndInputText               name=asset[holder][address][street_address]      ${tender_data.data.assetHolder.address.streetAddress}
  Sleep  2
  Choose File                         name=asset[files][]             ${filepyth}
  Sleep  2
  Execute Javascript  window.document.evaluate("//*[@id='submit-asset']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                        xpath=//*[@id='submit-asset']
  Run Keyword And Ignore Error         Click Element      xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])
  uatenders.Зачикати появи статусу при публікації    ${username}
  ${tender_uaid}=   Отримати дані з поля для МП     xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])[1]
  [Return]  ${tender_uaid}

Зачикати появи статусу при публікації
  [Arguments]  ${status}
  Wait Until Keyword Succeeds   20 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(//*[contains(@class,'publishAsset')])[1]      Опублікувати
  Sleep  2
  Wait Until Element Is Visible               xpath=(//*[contains(@class,'publishAsset')])[1]      15
  Click Element                               xpath=(//*[contains(@class,'publishAsset')])[1]
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Does Not Contain  Чернетка  5 s

ClearFildAndInputText
  [Arguments]  ${elementLocator}  ${elementText}
  Wait Until Element Is Visible   ${elementLocator}   15
  Clear Element Text              ${elementLocator}
  Input Text                      ${elementLocator}   ${elementText}

Додати об'єкта приватизації
  [Arguments]  ${tender_data}
  ${items}=           Get From Dictionary   ${tender_data.data}   items
  ${Items_length}=        Get Length        ${items}
  :FOR   ${index}   IN RANGE   ${Items_length}
  \   Додати предмет до об'єкту МП   ${items[${index}]}  ${index}

Додати предмет до об'єкту МП
  [Arguments]  ${item}  ${index}
  ${quantity}=                     Get From Dictionary                 ${item}                            quantity
  ${quantity}=                     Convert To String                   ${quantity}
  ${unit_id}=                      get_unit_id                         ${item.unit.name}
  ${filepyth}=                     get_file_path
# Склад об'єкта приватизації
  Wait Until Element Is Visible        name=asset[items][0][description_str]      10
  Input Text                           name=asset[items][0][description_str]      ${item.description}
  Input Text                           name=asset[items][0][quantity]             ${quantity}
  Select From List                     xpath=//select[@name='asset[items][0][unit_id]']   ${unit_id}
# Основний класифікатор*
  Execute Javascript  window.document.evaluate("(//*[contains(text(),'Склад об')])", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Sleep  2
  Select From List By Value            name=asset[items][0][classification][group]    8
  Sleep  2
  Run Keyword IF  '${item.classification.scheme}' == 'CAV-PS'     Run Keyword
  ...   Select From List By Value      name=asset[items][0][classification][scheme]   1
  ...  ELSE IF    '${item.classification.scheme}' == 'CPVS'       Run Keyword
  ...   Select From List By Value      name=asset[items][0][classification][scheme]   2
  ...  ELSE IF    '${item.classification.scheme}' == 'CPV'        Run Keyword
  ...   Select From List By Value      name=asset[items][0][classification][scheme]   3
  Sleep  1
  Input Text                           name=asset[items][0][classification][description]     ${item.classification.id}
  Wait Until Element Is Visible        xpath=(//li[@class='ui-menu-item'])[1]         10
  Click Element                        xpath=(//li[@class='ui-menu-item'])[1]
# Адреса місцезнаходження майна/активу
  Input Text                           name=asset[items][0][country]          ${item.address.countryName}
  Input Text                           name=asset[items][0][region]           ${item.address.region}
  Input Text                           name=asset[items][0][postal_code]      ${item.address.postalCode}
  Input Text                           name=asset[items][0][locality]         ${item.address.locality}
  Input Text                           name=asset[items][0][address]          ${item.address.streetAddress}
# Інформація про державну реєстрацію
  Run Keyword IF  '${item.registrationDetails.status}' == 'complete'
  ...   Select From List By Value         name=asset[items][0][registration_details][status]   complete
  ...  ELSE IF    '${item.registrationDetails.status}' == 'registering'
  ...   Select From List By Value         name=asset[items][0][registration_details][status]   registering
  Sleep  2
  Choose File                         name=asset[items][0][files][]             ${filepyth}
  Sleep  2

Пошук об’єкта МП по ідентифікатору
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

Оновити сторінку з об'єктом МП
  [Arguments]  ${username}  ${tender_uaid}
  Run Keyword And Ignore Error         Click Element      xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])[1]
  Sleep  2
  Reload Page
  Sleep  2

Отримати інформацію із об'єкта МП
  [Arguments]  ${username}  ${tender_uaid}  ${field_name}
  Run Keyword And Return    uatenders.Отримати інформацію з об'єкту МП про ${field_name}

Отримати дані з поля для МП
  [Arguments]   ${selector}
  Wait Until Page Contains Element             ${selector}    10
  Run Keyword And Return      Get Text         ${selector}

Отримати інформацію з об'єкту МП про assetID
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])[1]

Отримати інформацію з об'єкту МП про date
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Дата створення/знищення')]/..//*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_datetime_for_delivery          ${return_value}

Отримати інформацію з об'єкту МП про dateModified
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Дата внесення останніх змін')]/..//*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_date_modified          ${return_value}

Отримати інформацію з об'єкту МП про status
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Статус об')]/..//*[position() mod 2 = 0])//span
  Run Keyword And Return     convert_uatenders_string_to_common_string   ${return_value}

Отримати інформацію з об'єкту МП про title
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//div[@class='col-md-12']/h2)[1]

Отримати інформацію з об'єкту МП про description
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//div[@class='col-md-12']/p)[1]

Отримати інформацію з об'єкту МП про rectificationPeriod.endDate
  ${return_value}=           Отримати дані з поля для МП    xpath=//*[@class='rectificationPeriod.endDate']
  Run Keyword And Return     convert_datetime_for_delivery          ${return_value}

Отримати інформацію з об'єкту МП про decisions[0].title
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Найменування рішення про')]/..//*[position() mod 2 = 0])

Отримати інформацію з об'єкту МП про decisions[0].decisionID
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Номер рішення у паперовій')]/..//*[position() mod 2 = 0])

Отримати інформацію з об'єкту МП про decisions[0].decisionDate
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Дата прийняття рішення:')]/..//*[position() mod 2 = 0])
  Run Keyword And Return     convert_datetime_for_delivery          ${return_value}

Отримати інформацію з об'єкту МП про assetHolder.name
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetHolder.name']

Отримати інформацію з об'єкту МП про assetHolder.identifier.scheme
  Run Keyword And Return     Convert To String     UA-EDR

Отримати інформацію з об'єкту МП про assetHolder.identifier.id
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetHolder.identifier.id']

Отримати інформацію з об'єкту МП про assetCustodian.identifier.scheme
  Run Keyword And Return     Convert To String     UA-EDR

Отримати інформацію з об'єкту МП про assetCustodian.identifier.id
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetCustodian.identifier.id']

Отримати інформацію з об'єкту МП про assetCustodian.name
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetCustodian.name']

Отримати інформацію з об'єкту МП про assetCustodian.contactPoint.email
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(@class,'assetCustodian.contactPoint.emai')])[1]

Отримати інформацію з об'єкту МП про assetCustodian.contactPoint.name
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetCustodian.contactPoint.name']

Отримати інформацію з об'єкту МП про assetCustodian.contactPoint.telephone
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetCustodian.contactPoint.telephone']

Отримати інформацію з об'єкту МП про assetCustodian.identifier.legalName
  Run Keyword And Return     Отримати дані з поля для МП    xpath=//*[@class='assetCustodian.identifier.legalName']

Отримати інформацію з об'єкту МП про documents[0].documentType
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Документи щодо об')]//..//a)[last()]
  Run Keyword And Return   convert_uatenders_string_to_common_string   ${return_value}

Отримати інформацію з активу об'єкта МП
  [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${field_name}
  Run Keyword And Return    uatenders.Отримати дані з поля для активу МП items[0].${field_name}    ${item_id}

Отримати дані з поля для активу МП items[0].description
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=//*[@id='item-1']//*[@class='item-description']

Отримати дані з поля для активу МП items[0].classification.scheme
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[@class='classifier']/span)[1]

Отримати дані з поля для активу МП items[0].classification.id
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[@class='classifier']/span)[2]

Отримати дані з поля для активу МП items[0].quantity
  [Arguments]    ${item_id}
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[@id='item-1']//*[@class='amountVal'])[1]
  Run Keyword And Return     Convert To Number                            ${return_value}

Отримати дані з поля для активу МП items[0].unit.name
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[@id='item-1']//*[@class='amountDescription'])[1]

Отримати дані з поля для активу МП items[0].registrationDetails.status
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[@id='item-1']//*[@class='registrationDetailsStatus'])[1]

Внести зміни в об'єкт МП
  [Arguments]    ${username}    ${tender_uaid}    ${field_name}    ${field_value}
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Run Keyword IF    '${field_name}' == 'title'
  ...   ClearFildAndInputText            name=asset[title]                          ${field_value}
  ...     ELSE IF   '${field_name}' == 'description'
  ...   ClearFildAndInputText            name=asset[description]                    ${field_value}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                          xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  4

Внести зміни в актив об'єкта МП
  [Arguments]    ${username}    ${item_id}    ${tender_uaid}    ${field_name}    ${field_value}
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Run Keyword       uatenders.Змінити ${field_name} об'єкта МП    ${username}    ${tender_uaid}    ${item_id}    ${field_value}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                          xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  4

Змінити quantity об'єкта МП
  [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${field_value}
  ${quantity_value}=       Convert To String    ${field_value}
  Sleep  2
  ClearFildAndInputText            name=asset[items][0][quantity]           ${quantity_value}

Змінити classification.id об'єкта МП
  [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${field_value}
  Sleep  2
  ClearFildAndInputText            name=asset[items][0][classification][description]           ${field_value}

Завантажити ілюстрацію в об'єкт МП
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}
  ${filepyth}=    get_file_path
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=asset[files][]          ${filepyth}
  Sleep  2
  Select From List                  name=asset[docTypes][]       29
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]

Завантажити документ в об'єкт МП з типом
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}    ${documentType}
  ${documentTypeConvert}=      get_unit_id     ${documentType}
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=asset[files][]          ${filepath}
  Sleep  2
  Select From List                  name=asset[docTypes][]       ${documentTypeConvert}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]

Додати багато предметів до актива об'єкта МП
  [Arguments]    ${items}
  ${items_length}=    Run Keyword IF    '${NUMBER_OF_ITEMS}' != '0'    Run Keyword
  ...   Convert To Integer          ${NUMBER_OF_ITEMS}
  :FOR   ${item_index}   IN RANGE   ${items_length}
  \   uatenders.Додати предмет актива об'єкта МП     ${items}   ${item_index}

Додати актив до об'єкта МП
  [Arguments]    ${username}    ${tender_uaid}    ${item}
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}
  uatenders.Додати багато предметів до актива об'єкта МП    ${item}

Додати предмет актива об'єкта МП
  [Arguments]    ${items}    ${item_index}
  ${quantity}=    Convert To String     ${items.quantity}
  ${unit_id}=     get_unit_id           ${items.unit.name}
  ${filepyth}=    get_file_path
  Wait Until Element Is Visible       xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                       xpath=(//*[text()='Редагувати'])[1]
  Wait Until Element Is Visible       xpath=(//*[contains(@class,'add-item-section')])[1]       10
  Click Element                       xpath=(//*[contains(@class,'add-item-section')])[1]
  Wait Until Element Is Visible       name=asset[items][${NUMBER_OF_ITEMS}][description_str]    10
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][description_str]    ${items.description}
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][quantity]    ${quantity}
  Select From List                    name=asset[items][${NUMBER_OF_ITEMS}][unit_id]     ${unit_id}
  Sleep  2
  Select From List By Value           name=asset[items][${NUMBER_OF_ITEMS}][classification][group]    8
  Sleep  2
  Run Keyword IF  '${items.classification.scheme}' == 'CAV-PS'     Run Keywords
  ...   Select From List By Value     name=asset[items][${NUMBER_OF_ITEMS}][classification][scheme]   1
  ...   AND   Sleep  1
  ...  ELSE IF    '${items.classification.scheme}' == 'CPVS'     Run Keywords
  ...   Select From List By Value     name=asset[items][${NUMBER_OF_ITEMS}][classification][scheme]   2
  ...   AND   Sleep  1
  ...  ELSE IF    '${items.classification.scheme}' == 'CPV'     Run Keywords
  ...   Select From List By Value     name=asset[items][${NUMBER_OF_ITEMS}][classification][scheme]   3
  ...   AND   Sleep  1
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][classification][description]     ${items.classification.id}
  Wait Until Element Is Visible       xpath=(//li[@class='ui-menu-item'])[1]      10
  Click Element                       xpath=(//li[@class='ui-menu-item'])[1]
# Адреса місцезнаходження майна/активу
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][region]        ${items.address.region}
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][postal_code]   ${items.address.postalCode}
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][locality]      ${items.address.locality}
  Input Text                          name=asset[items][${NUMBER_OF_ITEMS}][address]       ${items.address.streetAddress}
# Інформація про державну реєстрацію
  Run Keyword IF  '${items.registrationDetails.status}' == 'complete'
  ...   Select From List By Value     name=asset[items][${NUMBER_OF_ITEMS}][registration_details][status]   complete
  ...  ELSE IF    '${items.registrationDetails.status}' == 'registering'
  ...   Select From List By Value     name=asset[items][${NUMBER_OF_ITEMS}][registration_details][status]   registering
  Sleep  2
  Choose File                         name=asset[items][${NUMBER_OF_ITEMS}][files][]             ${filepyth}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                       xpath=(//*[@id='submit-edit-btn'])[1]

Отримати кількість активів в об'єкті МП
  [Arguments]    ${username}    ${tender_uaid}
  Run Keyword And Return     Get Matching Xpath Count      //*[@class='tab-content']

Завантажити документ для видалення об'єкта МП
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}
  ${filepyth}=    get_file_path
  uatenders.Пошук об’єкта МП по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible       xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                       xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                         name=asset[files][]         ${filepyth}
  Sleep  2
  Select From List                    name=asset[docTypes][]      31
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                       xpath=(//*[@id='submit-edit-btn'])[1]

Видалити об'єкт МП
  [Arguments]    ${username}    ${tender_uaid}
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a    10
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  Wait Until Page Contains Element    xpath=(//*[@id='bs-example-navbar-collapse-1']//a)[5]    10
  Click Element                       xpath=(//*[@id='bs-example-navbar-collapse-1']//a)[5]
  Wait Until Element Is Visible       xpath=(//*[contains(@class,'table-bordered')]//*[contains(text(),'${tender_uaid}')]/..//*[contains(@class,'btn-danger')])[1]    10
  Click Element                       xpath=(//*[contains(@class,'table-bordered')]//*[contains(text(),'${tender_uaid}')]/..//*[contains(@class,'btn-danger')])[1]
  Sleep  5
  Focus            xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]
  Sleep  2
  Press Key        xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]     \\13

# ==============================================================================
# #             Создание ЛОТА по Малой Приватизации
# ==============================================================================
Створити лот
  [Arguments]    ${username}    ${tender_data}    ${asset_uaid}
  ${decisionDate}=        Get From Dictionary     ${tender_data.data.decisions[0]}    decisionDate
  ${decisionDateEdit}=    get_dgf                 ${decisionDate}
# #    Хедер Мої Аукціони
  Wait Until Page Contains Element    xpath=(//*[contains(text(),'Мої аукціони')])[1]    10
  Click Element                       xpath=(//*[contains(text(),'Мої аукціони')])[1]
  Wait Until Page Contains Element    xpath=((//*[@class='dropdown-menu'])[1]//*[position() mod 2 = 1])[5]    10
  Click Element                       xpath=((//*[@class='dropdown-menu'])[1]//*[position() mod 2 = 1])[5]
  Wait Until Page Contains Element    name=assetID    10
  Input Text                          name=assetID                      ${asset_uaid}

  Click Element                       xpath=(//*[@id='search-asset'])[1]
  Wait Until Page Contains Element    xpath=//h2[contains(text(),'Нове інформаційне повідомлення')]    10
  Input Text                          name=lot[decisions][0][title]                   ${tender_data.data.lotType}
  Input Text                          name=lot[decisions][0][ID]                      ${tender_data.data.decisions[0].decisionID}
  ClearFildAndInputText               name=lot[decisions][0][date]                    ${decisionDateEdit}
  Execute Javascript  window.document.evaluate("//*[@id='submit-lot']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                        xpath=//*[@id='submit-lot']
  Sleep  2
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Does Not Contain  Чернетка  2 s
  ${tender_uaid}=   Отримати дані з поля для МП     xpath=(//*[contains(text(),'Ідентифікатор інформаційного повідомлення:')]/..//*[position() mod 2 = 0])[1]
  [Return]    ${tender_uaid}

Пошук лоту по ідентифікатору
  [Arguments]    ${username}    ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

Оновити сторінку з лотом
  [Arguments]    ${username}    ${tender_uaid}
  uatenders.Оновити сторінку з об'єктом МП    ${username}    ${tender_uaid}

Отримати інформацію із лоту
  [Arguments]    ${username}    ${tender_uaid}    ${field_name}
  Run Keyword And Return    uatenders.Отримати інформацію із лоту для МП про ${field_name}

Отримати інформацію із лоту для МП про status
  ${test_name_value}=                Convert To String                       ${TEST_NAME.replace('\'', '')}
  Run Keyword IF   'переключення статусу лоту після створення процедури' in '${test_name_value}'        Run Keyword
  ...   Wait Until Keyword Succeeds   15 x   1 min     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error    Click Element    xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])[1]
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Contains Element                 xpath=(//*[contains(text(),'Статус інформаційного')]/..//*[position() mod 2 = 0]/*[contains(text(),'Аукціон')])[1]
  Run Keyword And Ignore Error    Click Element                xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])[1]
  Sleep  2
  ${return_value}=           Отримати дані з поля для МП       xpath=(//*[contains(text(),'Статус інформаційного повідомлення:')]/..//*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string          ${return_value}

Отримати інформацію із лоту для МП про lotID
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'Ідентифікатор інформаційного')]/..//*[position() mod 2 = 0])[1]

Отримати інформацію із лоту для МП про dateModified
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Дата внесення останніх змін')]/..//*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_date_modified                   ${return_value}

Отримати інформацію із лоту для МП про date
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Дата створення')]/..//*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_datetime_for_delivery           ${return_value}

Отримати інформацію із лоту для МП про rectificationPeriod.endDate
  Wait Until Keyword Succeeds   20 x   15 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error   Click Element   xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])[1]
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Contains Element               xpath=(//*[contains(text(),'Можливе редагування до')]/..//*[position() mod 2 = 0])[1]
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Можливе редагування до')]/..//*[position() mod 2 = 0])[1]
  Run Keyword And Return     convert_date_modified                   ${return_value}
# Загальна інформація щодо інформаційного повідомлення
Отримати інформацію із лоту для МП про assets
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'ASSET ID')]/..//*[position() mod 2 = 0])[1]

Отримати інформацію із лоту для МП про title
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//div[@class='col-md-12']/h2)[1]

Отримати інформацію із лоту для МП про description
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//div[@class='col-md-12']/p)[1]
# Балансоутримувач
Отримати інформацію із лоту для МП про lotHolder.name
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[@class='col-md-12 well'])[1]//*[@class='item-procuringEntity.name']

Отримати інформацію із лоту для МП про lotHolder.identifier.scheme
  Run Keyword And Return     Convert To String     UA-EDR

Отримати інформацію із лоту для МП про lotHolder.identifier.id
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'Код ЄДРПОУ:')]/..//*[position() mod 2 = 0])[1]
# Розпорядник
Отримати інформацію із лоту для МП про lotCustodian.identifier.scheme
  Run Keyword And Return     Convert To String     UA-EDR

Отримати інформацію із лоту для МП про lotCustodian.identifier.id
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Код ЄДРПОУ:')]/..//*[position() mod 2 = 0])[2]

Отримати інформацію із лоту для МП про lotCustodian.identifier.legalName
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[@class='col-md-12 well'])[2]//*[@class='item-procuringEntity.name']

Отримати інформацію із лоту для МП про lotCustodian.contactPoint.name
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Ім')]/..//*[position() mod 2 = 0])[2]

Отримати інформацію із лоту для МП про lotCustodian.contactPoint.telephone
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Телефон')]/..//*[position() mod 2 = 0])[2]

Отримати інформацію із лоту для МП про lotCustodian.contactPoint.email
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'E-mail:')]/..//*[position() mod 2 = 0])[2]
# Рішення
Отримати інформацію із лоту для МП про decisions[0].decisionDate
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Дата прийняття рішення:')]/..//*[position() mod 2 = 0])[1]
  Run Keyword And Return     convert_datetime_for_delivery          ${return_value}

Отримати інформацію із лоту для МП про decisions[1].decisionDate
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(text(),'Дата прийняття рішення:')]/..//*[position() mod 2 = 0])[2]
  Run Keyword And Return     convert_datetime_for_delivery          ${return_value}

Отримати інформацію із лоту для МП про decisions[0].decisionID
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Номер рішення у паперовій документації:')]/..//*[position() mod 2 = 0])[1]

Отримати інформацію із лоту для МП про decisions[1].decisionID
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Номер рішення у паперовій документації:')]/..//*[position() mod 2 = 0])[2]

Отримати інформацію із лоту для МП про decisions[1].title
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'Найменування рішення про приватизацію лоту:')]/..//*[position() mod 2 = 0])[1]
# Загальна інформація
Отримати інформацію із лоту для МП про auctions[0].procurementMethodType
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Тип')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[1].procurementMethodType
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Тип')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[2].procurementMethodType
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Тип')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[0].status
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Статус')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[1].status
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Статус')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[2].status
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Статус')]/..//td)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із лоту для МП про auctions[0].tenderAttempts
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Аукціону')]/..//td)[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].tenderAttempts
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Аукціону')]/..//td)[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[2].tenderAttempts
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Аукціону')]/..//td)[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[0].value.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Початкова ціна')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].value.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Початкова ціна')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[2].value.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Початкова ціна')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[0].minimalStep.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Розмір мінімального')]/..//*[@class='auct_min_step'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].minimalStep.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Розмір мінімального')]/..//*[@class='auct_min_step'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[2].minimalStep.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Розмір мінімального')]/..//*[@class='auct_min_step'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[0].guarantee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Розмір гарантійного')]/..//*[@class='auct_guarantee_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].guarantee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Розмір гарантійного')]/..//*[@class='auct_guarantee_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[2].guarantee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Розмір гарантійного')]/..//*[@class='auct_guarantee_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[0].registrationFee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Реєстраційний внесок')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].registrationFee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Реєстраційний внесок')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[2].registrationFee.amount
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Реєстраційний внесок')]/..//*[@class='auct_amount'])[1]
  Run Keyword And Return     Convert To Number                       ${return_value}

Отримати інформацію із лоту для МП про auctions[1].tenderingDuration
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'2')]//*[contains(text(),'Продолжительность')]/..//*[@class='auct_tendering_duration'])[1]

Отримати інформацію із лоту для МП про auctions[2].tenderingDuration
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'3')]//*[contains(text(),'Продолжительность')]/..//*[@class='auct_tendering_duration'])[1]

Отримати інформацію із лоту для МП про auctions[0].auctionPeriod.startDate
  ${return_value}=           Отримати дані з поля для МП    xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Електронний аукціон відбудеться')]/..//*[@class='enquiryPeriod'])[1]
  Run Keyword And Return     convert_date_modified                       ${return_value}

Отримати інформацію із лоту для МП про auctions[0].auctionID
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error    Click Element   xpath=(//*[@class='clean-table']//*[contains(text(),'sync')])[1]
  ...   AND   Sleep  2
  ...   AND   Wait Until Page Contains Element                xpath=(//*[contains(@data-index,'1')]//*[contains(text(),'Переглянути аукціон')])[1]
  Run Keyword And Return     Отримати дані з поля для МП      xpath=(//*[contains(@data-index,'1')]//td)[1]

Отримати інформацію з активу лоту
  [Arguments]    ${username}    ${tender_uaid}    ${item_id}    ${field_name}
  Run Keyword And Return    uatenders.Отримати інформацію з активу лоту про ${field_name}    ${item_id}
# Інформація щодо об’єкта продажу
Отримати інформацію з активу лоту про description
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП    xpath=(//*[contains(text(),'${item_id}')])

Отримати інформацію з активу лоту про classification.scheme
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='scheme']

Отримати інформацію з активу лоту про classification.id
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='id']

Отримати інформацію з активу лоту про unit.name
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountDescription']

Отримати інформацію з активу лоту про quantity
  [Arguments]    ${item_id}
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountVal']
  Run Keyword And Return     Convert To Number                            ${return_value}

Отримати інформацію з активу лоту про registrationDetails.status
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='registrationDetailsStatus']

Отримати інформацію з активу лоту про items[0].description
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')])

Отримати інформацію з активу лоту про items[1].description
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')])

Отримати інформацію з активу лоту про items[0].unit.name
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountDescription']

Отримати інформацію з активу лоту про items[1].unit.name
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountDescription']

Отримати інформацію з активу лоту про items[0].quantity
  [Arguments]    ${item_id}
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountVal']
  Run Keyword And Return     Convert To Number                            ${return_value}

Отримати інформацію з активу лоту про items[1].quantity
  [Arguments]    ${item_id}
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='amountVal']
  Run Keyword And Return     Convert To Number                            ${return_value}

Отримати інформацію з активу лоту про items[0].classification.scheme
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='scheme']

Отримати інформацію з активу лоту про items[1].classification.scheme
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='scheme']

Отримати інформацію з активу лоту про items[0].classification.id
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='id']

Отримати інформацію з активу лоту про items[1].classification.id
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='id']

Отримати інформацію з активу лоту про items[0].registrationDetails.status
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='registrationDetailsStatus']

Отримати інформацію з активу лоту про items[1].registrationDetails.status
  [Arguments]    ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}')]//..//*/../..//td)//*[@class='registrationDetailsStatus']

Внести зміни в лот
  [Arguments]    ${username}    ${tender_uaid}    ${field_name}    ${field_value}
  uatenders.Оновити сторінку з лотом    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Run Keyword IF    '${field_name}' == 'title'
  ...   ClearFildAndInputText            name=lot[title]                          ${field_value}
  ...     ELSE IF   '${field_name}' == 'description'
  ...   ClearFildAndInputText            name=lot[description]                    ${field_value}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                          xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  4

Внести зміни в актив лоту
  [Arguments]    ${username}    ${item_id}    ${tender_uaid}    ${field_name}    ${field_value}
  ${quantity_value}=      Run Keyword IF    '${field_name}' == 'quantity'
  ...   uatenders.Зберегти дані поля ${field_name}     ${field_value}
  uatenders.Оновити сторінку з лотом    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Run Keyword IF    '${field_name}' == 'quantity'
  ...   ClearFildAndInputText            name=lot[items][0][quantity]             ${quantity_value}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                          xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  4

Завантажити ілюстрацію в лот
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}
  ${filepyth}=    get_file_path
  uatenders.Пошук лоту по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=lot[files][]         ${filepyth}
  Sleep  2
  Select From List                  name=lot[docTypes][]      29
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  3

Завантажити документ в лот з типом
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}    ${documentType}
  ${documentTypeNumber}=      get_unit_id     ${documentType}
  uatenders.Оновити сторінку з лотом    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=lot[files][]         ${filepath}
  Sleep  2
  Select From List                  name=lot[docTypes][]      ${documentTypeNumber}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  3

Завантажити документ в умови проведення аукціону
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}    ${documentType}    ${auction_index}
  ${documentTypeNumber}=      get_unit_id     ${documentType}
  uatenders.Оновити сторінку з лотом    ${username}    ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=lot[auctions][${auction_index}][files][]         ${filepath}
  Sleep  2
  Select From List                  name=lot[auctions][0][docTypes][]      ${documentTypeNumber}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  3

Завантажити документ для видалення лоту
  [Arguments]    ${username}    ${tender_uaid}    ${filepath}
  ${filepyth}=    get_file_path
  uatenders.Пошук лоту по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Choose File                       name=lot[files][]         ${filepyth}
  Sleep  2
  Select From List                  name=lot[docTypes][]      31
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                     xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  3

Видалити лот
  [Arguments]    ${username}    ${tender_uaid}
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a    10
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  Wait Until Page Contains Element    xpath=(//*[@id='bs-example-navbar-collapse-1']//a)[7]    10
  Click Element                       xpath=(//*[@id='bs-example-navbar-collapse-1']//a)[7]
  Wait Until Element Is Visible       xpath=(//*[contains(@class,'table-bordered')]//*[contains(text(),'${tender_uaid}')]/..//*[contains(@class,'btn-danger')])[1]    10
  Click Element                       xpath=(//*[contains(@class,'table-bordered')]//*[contains(text(),'${tender_uaid}')]/..//*[contains(@class,'btn-danger')])[1]
  Sleep  5
  Focus                               xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]
  Sleep  2
  Press Key                           xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]     \\13
  Wait Until Page Contains Element    xpath=(//*[text()='Інформаційне повідомлення'])[1]     15
  Click Element                       xpath=(//*[text()='Інформаційне повідомлення'])[1]

Додати умови проведення аукціону
  [Arguments]    ${username}    ${auction}    ${index}    ${tender_uaid}
  Run Keyword  uatenders.Додати умови проведення аукціону номер ${index}   ${username}  ${tender_uaid}   ${auction}   ${index}

Додати умови проведення аукціону номер 0
  [Arguments]    ${username}    ${tender_uaid}    ${auction}    ${index}
  ${valueAmount}=                    Convert To String      ${auction.value.amount}
  ${valueValueAddedTaxIncluded}=     Convert To String      ${auction.value.valueAddedTaxIncluded}
  ${minimalStep}=                    Convert To String      ${auction.minimalStep.amount}
  ${guaranteeAmount}=                Convert To String      ${auction.guarantee.amount}
  ${registrationFee}=                Convert To String      ${auction.registrationFee.amount}
  ${id}=                             Convert To String      ${auction.bankAccount.accountIdentification[0].id}
  ${scheme}=                         Get From Dictionary      ${auction.bankAccount.accountIdentification[0]}    scheme
  ${description}=                    Convert To String      ${auction.bankAccount.accountIdentification[0].description}
  ${auctionStartDateConvert}=               Get From Dictionary    ${auction.auctionPeriod}    startDate
  ${auctionStartDate}=               convert_bank_identification_date    ${auctionStartDateConvert}
  uatenders.Пошук лоту по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Run Keyword IF       '${valueValueAddedTaxIncluded}' == '${True}'    Select Checkbox    name=lot[auctions][${index}][tax]
  ClearFildAndInputText           name=lot[auctions][${index}][amount]                     ${valueAmount}
  ClearFildAndInputText           name=lot[auctions][${index}][guarantee_amount]           ${guaranteeAmount}
  ClearFildAndInputText           name=lot[auctions][${index}][fee_amount]                 ${registrationFee}
  ClearFildAndInputText           name=lot[auctions][${index}][minimal_step]               ${minimalStep}
  Input Text                      name=lot[auctions][${index}][auction_start_date]                ${auctionStartDate}
  ClearFildAndInputText           name=lot[auctions][${index}][bank_name]                  ${auction.bankAccount.bankName}
  ClearFildAndInputText           name=lot[auctions][${index}][bank_desc]                  ${auction.bankAccount.description}
  ClearFildAndInputText           name=lot[auctions][${index}][bank_identification][0][id]             ${id}
  Select From List By Value       name=lot[auctions][${index}][bank_identification][0][scheme]         ${scheme}
  ClearFildAndInputText           name=lot[auctions][${index}][bank_identification][0][description]    ${description}
  Input Text                      name=lot[auctions][1][tendering_duration]      20
  Input Text                      name=lot[auctions][2][tendering_duration]      20
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                           xpath=(//*[@id='submit-edit-btn'])[1]
  Wait Until Keyword Succeeds   15 x   15 s     Run Keywords
  ...   Wait Until Page Contains Element          xpath=(//*[contains(@class,'sendToVerification')])[1]     10
  ...   AND   Click Element                       xpath=(//*[contains(@class,'sendToVerification')])[1]
  ...   AND   Wait Until Page Contains   Заявка на верифікацію відправлена.   2 s
  Sleep  2

Додати умови проведення аукціону номер 1
  [Arguments]    ${username}    ${tender_uaid}    ${auction}    ${index}
  uatenders.Пошук лоту по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Page Contains Element       xpath=(//*[text()='Редагувати'])[1]    5
  ...   AND   Click Element                          xpath=(//*[text()='Редагувати'])[1]
  ...   AND   Wait Until Page Does Not Contain   Редагувати   2 s
  ${tenderingDuration}=   Run Keyword IF    '${auction.tenderingDuration}' == 'P1M'      Convert To String    1
  ClearFildAndInputText                              name=lot[auctions][${index}][tendering_duration]         ${tenderingDuration}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                                      xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  2

Зберегти дані поля quantity
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Зберегти дані поля value.amount
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Зберегти дані поля guarantee.amount
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Зберегти дані поля registrationFee.amount
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Зберегти дані поля minimalStep.amount
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Зберегти дані поля auctionPeriod.startDate
  [Arguments]   ${field_value}
  Run Keyword And Return     Convert To String    ${field_value}

Внести зміни в умови проведення аукціону
  [Arguments]    ${username}    ${tender_uaid}    ${field_name}    ${field_value}    ${auction_index}
  ${valueAmount_value}=              Run Keyword IF    '${field_name}' == 'value.amount'              uatenders.Зберегти дані поля ${field_name}     ${field_value}
  ${guaranteeAmount_value}=          Run Keyword IF    '${field_name}' == 'guarantee.amount'          uatenders.Зберегти дані поля ${field_name}     ${field_value}
  ${registrationFeeAmount_value}=    Run Keyword IF    '${field_name}' == 'registrationFee.amount'    uatenders.Зберегти дані поля ${field_name}     ${field_value}
  ${minimalStepAmount_value}=        Run Keyword IF    '${field_name}' == 'minimalStep.amount'        uatenders.Зберегти дані поля ${field_name}     ${field_value}
  ${auctionPeriodStartDate_value}=   Run Keyword IF    '${field_name}' == 'auctionPeriod.startDate'   uatenders.Зберегти дані поля ${field_name}     ${field_value}
  Wait Until Element Is Visible     xpath=(//*[text()='Редагувати'])[1]    10
  Click Element                     xpath=(//*[text()='Редагувати'])[1]
  Sleep  2
  Run Keyword IF    '${auction_index}' == '0' and '${field_name}' == 'value.amount'                  Run Keyword
  ...   ClearFildAndInputText       xpath=(//*[contains(@name,'amount')])[1]                         ${valueAmount_value}
  ...     ELSE IF   '${auction_index}' == '0' and '${field_name}' == 'guarantee.amount'
  ...   ClearFildAndInputText       xpath=(//*[contains(@name,'guarantee_amount')])[1]               ${guaranteeAmount_value}
  ...     ELSE IF   '${auction_index}' == '0' and '${field_name}' == 'registrationFee.amount'
  ...   ClearFildAndInputText       xpath=(//*[contains(@name,'fee_amount')])[1]                     ${registrationFeeAmount_value}
  ...     ELSE IF   '${auction_index}' == '0' and '${field_name}' == 'minimalStep.amount'
  ...   ClearFildAndInputText       xpath=(//*[contains(@name,'minimal_step')])[1]                   ${minimalStepAmount_value}
  ...     ELSE IF   '${auction_index}' == '0' and '${field_name}' == 'auctionPeriod.startDate'
  ...   ClearFildAndInputText       xpath=(//*[contains(@name,'auction_start_date')])[1]             ${auctionPeriodStartDate_value}
  Sleep  2
  Execute Javascript  window.document.evaluate("(//*[@id='submit-edit-btn'])[1]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                           xpath=(//*[@id='submit-edit-btn'])[1]
  Sleep  7

Активувати процедуру
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}


# ==============================================================================
#    Tests Files.Awarding
# ==============================================================================
Отримати кількість авардів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Пропозиції')])[1]     10
  Click Element                      xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Пропозиції')])[1]
  Wait Until Element Is Visible      xpath=((//*[@class='clean-table']))[1]     10
  ${numOfAwards}=       Get Matching Xpath Count           ((//*[@class='clean-table']))
  Run Keyword And Return     Convert To Integer     ${numOfAwards}

Завантажити протокол погодження в авард
  [Arguments]  ${username}  ${tender_uaid}  ${file_path}  ${award_index}
  ${filepyth}=    get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  uatenders.Оновити сторінку з тендером
  Wait Until Element Is Visible          xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]     15
  Click Element                          xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]
  ${trueEnableButton}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible    xpath=(//*[@value='Опублікувати рішення про викуп'])[1]       5
  Run Keyword IF    '${trueEnableButton}' == 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   Choose File                name=award_admission_protocol           ${filepyth}
  ...     ELSE IF   '${trueEnableButton}' != 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   Choose File                xpath=(//*[@id='award_protocol'])[1]    ${filepyth}
  Sleep  5

Активувати кваліфікацію учасника
  [Arguments]  ${username}  ${tender_uaid}
  ${trueEnableButton}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible      xpath=(//*[@value='Опублікувати рішення про викуп'])[1]       5
  Run Keyword IF    '${trueEnableButton}' == 'True'          Run Keywords
  ...   Wait Until Element Is Visible      xpath=(//*[@value='Опублікувати рішення про викуп'])[1]     10
  ...   AND   Click Element                xpath=(//*[@value='Опублікувати рішення про викуп'])[1]
  ...     ELSE IF   '${trueEnableButton}' != 'True'          Run Keywords
  ...   Wait Until Element Is Visible      xpath=(//*[contains(@value,'Зберегти')])    10
  ...   AND   Click Element                xpath=(//*[contains(@value,'Зберегти')])
  Sleep  5

Завантажити протокол аукціону в авард
  [Arguments]  ${username}  ${tender_uaid}  ${file_path}  ${award_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  uatenders.Оновити сторінку з тендером
  ${filepyth}=    get_file_path
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]    15
  Click Element                        xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]
  ${trueEnableButton}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible       xpath=(//*[contains(text(),'Додати протокол торгів')])       5
  Run Keyword IF    '${trueEnableButton}' == 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   Choose File                          xpath=(//*[@id='award_protocol'])[1]        ${filepyth}
  ...   AND   Sleep  2
  ...   AND   Wait Until Element Is Visible        xpath=(//*[contains(@value,'Зберегти')])    15
  ...   AND   Click Element                        xpath=(//*[contains(@value,'Зберегти')])
  ...     ELSE IF   '${trueEnableButton}' != 'True'          Run Keyword
  ...   Reload Page
  Sleep  5

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]    15
  Click Element                      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Підтвердити протокол')])[1]        15
  Click Element                      xpath=(//*[contains(text(),'Підтвердити протокол')])[1]
  Sleep  5
  uatenders.Оновити сторінку з тендером

Завантажити протокол дискваліфікації в авард
  [Arguments]  ${username}  ${tender_uaid}  ${file_path}  ${award_index}
  ${filepyth}=    get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  uatenders.Оновити сторінку з тендером
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]     15
  Click Element                      xpath=(//*[contains(text(),'Кваліфікація') and contains(@class,'btn-warning')])[1]
  ${trueSinglStatusDisqualification}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible     xpath=(//*[@value='Опублікувати рішення про викуп'])[2]       5
  Run Keyword IF    '${trueSinglStatusDisqualification}' == 'True'          Run Keywords
  ...   Sleep  3
  ...   AND   Choose File                 name=award_admission_rejection         ${filepyth}
  ...     ELSE IF   '${trueSinglStatusDisqualification}' != 'True'          Run Keywords
  ...   Wait Until Element Is Visible     xpath=(//*[contains(text(),'Відхилити') and contains(@class,'btn-danger')])[1]     15
  ...   AND   Click Element               xpath=(//*[contains(text(),'Відхилити') and contains(@class,'btn-danger')])[1]
  ...   AND   Sleep  3
  ...   AND   Choose File                 name=award[0][files][]         ${filepyth}
  Sleep  5

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
  ${filepyth}=    get_file_path
  ${trueSinglStatusDisqualification}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible       xpath=(//*[@value='Опублікувати рішення про викуп'])[2]          5
  Run Keyword IF    '${trueSinglStatusDisqualification}' == 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   ClearFildAndInputText              name=award_admission_description                ${description}
  ...   AND   Sleep  5
  ...   AND   Wait Until Element Is Visible      xpath=(//*[@value='Опублікувати рішення про викуп'])[2]     10
  ...   AND   Click Element                      xpath=(//*[@value='Опублікувати рішення про викуп'])[2]
  ...     ELSE IF   '${trueSinglStatusDisqualification}' != 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   ClearFildAndInputText      xpath=(//*[contains(text(),'Підстава відхилення')]/..//*[position() mod 2 = 0]/textarea)[1]      ${description}
  ...   AND   Sleep  5
  ...   AND   Wait Until Element Is Visible      xpath=(//*[contains(@value,'Відхилити') and contains(@class,'btn-danger')])[1]    10
  ...   AND   Click Element                      xpath=(//*[contains(@value,'Відхилити') and contains(@class,'btn-danger')])[1]
  Sleep  5

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error       Click Element      xpath=(//a[@class='btn btn-warning'])
  Wait Until Element Is Visible         xpath=//a[text()[contains(.,'Мої пропозиції')]]        15
  Click Element                         xpath=//a[text()[contains(.,'Мої пропозиції')]]
  Wait Until Keyword Succeeds   5 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Wait Until Element Is Visible             xpath=((//*[text()[contains(.,'${tender_uaid}')]])//..//*[contains(@class,'btn btn-xs btn-danger')])[1]        10
  Wait Until Element Is Visible         xpath=((//*[text()[contains(.,'${tender_uaid}')]])//..//*[contains(@class,'btn btn-xs btn-danger')])[1]        15
  Click Element                         xpath=((//*[text()[contains(.,'${tender_uaid}')]])//..//*[contains(@class,'btn btn-xs btn-danger')])[1]
  Sleep  5
  Focus                                 xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]
  Sleep  2
  Press Key                             xpath=(//*[contains(@type,'button') and contains(.,'Так')])[1]     \\13


# ==============================================================================
#    Contract Signing
# ==============================================================================
Завантажити протокол скасування в контракт
  [Arguments]  ${username}  ${tender_uaid}  ${file_path}  ${contract_num}
  ${filepyth}=    get_file_path
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Контракти')])[1]          15
  Click Element                      xpath=(//*[contains(text(),'Контракти')])[1]
  uatenders.Оновити сторінку з тендером
  ${trueEnableStatus}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible            xpath=(//*[contains(text(),'Відхилити') and contains(@class,'btn-danger')])[1]          5
  Run Keyword IF    '${trueEnableStatus}' == 'True'          Run Keywords
  ...   Wait Until Element Is Visible            xpath=(//*[contains(text(),'Відхилити') and contains(@class,'btn-danger')])[1]     15
  ...   AND   Click Element                      xpath=(//*[contains(text(),'Відхилити') and contains(@class,'btn-danger')])[1]
  ...   AND   Wait Until Element Is Visible      xpath=(//*[contains(text(),'Підстава відхилення')])[1]     10
  ...   AND   ClearFildAndInputText              xpath=(//*[contains(text(),'Підстава відхилення')]/..//*[position() mod 2 = 0]/textarea)[1]        Дисквалiфiкувати потом еще раз и два
  ...   AND   Sleep  2
  ...   AND   Choose File                        name=award[0][files][]         ${filepyth}
  ...     ELSE IF   '${trueEnableStatus}' != 'True'          Run Keywords
  ...   Wait Until Element Is Visible            xpath=(//*[contains(text(),'Контракти') and contains(@class,'main_contract')])[1]     15
  ...   AND   Click Element                      xpath=(//*[contains(text(),'Контракти') and contains(@class,'main_contract')])[1]
  ...   AND   Wait Until Element Is Visible      xpath=(//*[contains(text(),'Скасувати контракт') and contains(@class,'btn-danger')])[1]     15
  ...   AND   Click Element                      xpath=(//*[contains(text(),'Скасувати контракт') and contains(@class,'btn-danger')])[1]
  ...   AND   Wait Until Element Is Visible      xpath=(//*[contains(text(),'Відміна договору')])[1]     15
  ...   AND   Sleep  2
  ...   AND   Choose File                        name=contract[files][]         ${filepyth}
  Sleep  4

Скасувати контракт
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  Wait Until Element Is Visible      xpath=(//*[contains(@value,'Відхилити') or contains(@value,'Відмінити')])[1]     15
  Click Element                      xpath=(//*[contains(@value,'Відхилити') or contains(@value,'Відмінити')])[1]
  Sleep  5

Встановити дату підписання угоди
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${date}
  ${filepyth}=    get_file_path
  ${contractDateEdit}=                            convert_bank_identification_date                ${date}
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Контракти')])[1]     15
  Click Element                      xpath=(//*[contains(text(),'Контракти')])[1]
  uatenders.Оновити сторінку з тендером
  ${trueSinglStatusDisqualification}=       Run Keyword And Return Status
  ...   Wait Until Element Is Visible       xpath=(//*[contains(text(),'Додати договір')])[1]     5
  Run Keyword IF    '${trueSinglStatusDisqualification}' == 'True'          Run Keywords
  ...   Sleep  2
  ...   AND   Choose File                        name=contract[files][]          ${filepyth}
  ...   AND   Sleep  2
  ...   AND   Wait Until Element Is Visible      xpath=(//*[@value='Зберегти'])[1]     15
  ...   AND   Click Element                      xpath=(//*[@value='Зберегти'])[1]
  ...   AND   Sleep  5
  Wait Until Keyword Succeeds   5 x   15 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible      xpath=(//*[contains(text(),'Дата підписання')]/../*[position() mod 2 = 0])/div
  Wait Until Element Is Visible              xpath=(//*[contains(text(),'Дата підписання')]/../*[position() mod 2 = 0])/div     10
# // поле принимает время без секунд
  Input Text                         name=date_signed     ${contractDateEdit}
  Wait Until Element Is Visible      xpath=(//*[@value='Зберегти'])[1]     15
  Click Element                      xpath=(//*[@value='Зберегти'])[1]

Завантажити угоду до тендера
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${file_path}
  Wait Until Element Is Visible      xpath=(//*[contains(text(),'Контракти')])[1]        10
  Click Element                      xpath=(//*[contains(text(),'Контракти')])[1]
  ${filepyth}=    get_file_path
  Sleep  2
  Choose File                        name=contract[files][]          ${filepyth}
  Sleep  3
  Wait Until Element Is Visible      xpath=(//*[@value='Зберегти'])[1]          15
  Click Element                      xpath=(//*[@value='Зберегти'])[1]

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  Wait Until Element Is Visible      xpath=(//*[contains(@value,'Завершити електронні')])[1]     10
  Click Element                      xpath=(//*[contains(@value,'Завершити електронні')])[1]
  Sleep  5
  Wait Until Page Contains   Заявка на підисання договору подана до ЦБД.   10 s
  Click Element                      xpath=((//*[contains(@role,'tablist')])//*[contains(.,'Аукціон')])[1]
  Sleep  5
  uatenders.Оновити сторінку з тендером

# ==============================================================================
#    Contracting
# ==============================================================================
Активувати контракт
  [Arguments]  ${username}  ${contract_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}

Отримати інформацію із договору
  [Arguments]  ${username}  ${contract_uaid}  ${field_name}
  Wait Until Page Contains Element    xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                       xpath=(//*[text()='Завершення приватизації'])[1]
  uatenders.Оновити сторінку з тендером
  ${return_value}=    Run Keyword      Отримати інформацію із договору про ${field_name}
  [Return]  ${return_value}

Отримати інформацію із договору про status
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Статус:')]/../*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із договору про milestones[0].status
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Статус:')]/../*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}
Отримати інформацію із договору про milestones[1].status
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Статус:')]/../*[position() mod 2 = 0]/span)[2]
  Run Keyword And Return     convert_uatenders_string_to_common_string        ${return_value}

Отримати інформацію із договору про milestones[0].dueDate
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Період на внесення оплати до:')]/../*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return   convert_dateMet   ${return_value}
Отримати інформацію із договору про milestones[1].dueDate
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Період на внесення оплати до:')]/../*[position() mod 2 = 0]/span)[2]
  Run Keyword And Return   convert_dateMet   ${return_value}

Отримати інформацію із договору про milestones[0].dateMet
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Завантажено фінальний Наказ про приватизацію')]/../*[position() mod 2 = 0]/span)[1]
  Run Keyword And Return   convert_dateMet   ${return_value}
Отримати інформацію із договору про milestones[1].dateMet
  ${return_value}=           Отримати дані з поля для МП     xpath=(//*[contains(text(),'Завантажено фінальний Наказ про приватизацію')]/../*[position() mod 2 = 0]/span)[2]
  Run Keyword And Return   convert_dateMet   ${return_value}

Отримати інформацію з активу в договорі
  [Arguments]  ${username}  ${contract_uaid}  ${item_id}  ${field_name}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  Wait Until Page Contains Element    xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                       xpath=(//*[text()='Завершення приватизації'])[1]
  Run Keyword And Return      Отримати інформацію з активу в договорі про ${field_name}   ${username}   ${item_id}

Отримати інформацію з активу в договорі про description
  [Arguments]  ${username}  ${item_id}
  Run Keyword And Return     Отримати дані з поля для МП     xpath=(//*[contains(text(),'${item_id}') and contains(@class,'item_desc')])

Вказати дату отримання оплати
  [Arguments]  ${username}  ${contract_uaid}  ${dateMet}  ${milestone_index}
  ${test_name_value}=                 Convert To String                 ${TEST_NAME.replace('\'', '')}
  ${contractDateEdit}=    Run Keyword IF   'оплати після кінцевої дати' in '${test_name_value}'
  ...   convert_contract_Met_date                ${dateMet}
  ...     ELSE IF   'оплати після кінцевої дати' != '${test_name_value}'
  ...   convert_bank_identification_date         ${dateMet}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  Wait Until Page Contains Element     xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                        xpath=(//*[text()='Завершення приватизації'])[1]
  uatenders.Оновити сторінку з тендером
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Підтверждення оплати')])[1]     10
# // поле принимает время без секунд
  Input Text                           name=date_met     ${contractDateEdit}
  Sleep  1
  Wait Until Element Is Visible        xpath=(//*[@value='Підтвердити оплату'])[1]     15
  Click Element                        xpath=(//*[@value='Підтвердити оплату'])[1]
  Sleep  5

Підтвердити відсутність оплати
  [Arguments]  ${username}  ${contract_uaid}  ${milestone_index}
  Wait Until Page Contains Element     xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                        xpath=(//*[text()='Завершення приватизації'])[1]
  uatenders.Оновити сторінку з тендером
  Sleep  2
  Wait Until Page Contains Element     xpath=(//*[text()='Коштів не отримав'])[1]     10
  Click Element                        xpath=(//*[text()='Коштів не отримав'])[1]
  Sleep  2
  Focus                                xpath=(//*[contains(@type,'submit') or contains(.,'Так')])[1]
  Sleep  2
  Press Key                            xpath=(//*[contains(@type,'submit') or contains(.,'Так')])[1]     \\13

Завантажити наказ про завершення приватизації
  [Arguments]  ${username}  ${contract_uaid}  ${file_path}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  ${filepyth}=    get_file_path
  Wait Until Page Contains Element     xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                        xpath=(//*[text()='Завершення приватизації'])[1]
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Підтверждення завантаження фінального Наказу')])[1]     10
  Sleep  2
  Choose File                          name=approval_protocol          ${filepyth}
  Sleep  2

Вказати дату прийняття наказу
  [Arguments]  ${username}  ${contract_uaid}  ${dateMet}
  ${test_name_value}=                 Convert To String                 ${TEST_NAME.replace('\'', '')}
  ${contractDateEdit}=    Run Keyword IF   'після дати виконання умов приватизації' in '${test_name_value}'
  ...   convert_contract_Met_date_twoZone        ${dateMet}
  ...     ELSE IF   'після дати виконання умов приватизації' != '${test_name_value}'
  ...   convert_bank_identification_date         ${dateMet}
# // поле принимает время без секунд
  Input Text                          name=date_met     ${contractDateEdit}
  Sleep  2
  Wait Until Element Is Visible       xpath=(//*[contains(@value,'Підтвердити завантаження фінального Наказу про приватизацію')])[1]     15
  Click Element                       xpath=(//*[contains(@value,'Підтвердити завантаження фінального Наказу про приватизацію')])[1]
  Sleep  5

Підтвердити відсутність наказу про приватизацію
  [Arguments]  ${username}  ${contract_uaid}  ${file_path}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  ${filepyth}=    get_file_path
  Wait Until Page Contains Element     xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                        xpath=(//*[text()='Завершення приватизації'])[1]
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Підтверждення відсутності Наказу')])[1]     10
  Sleep  2
  Choose File                          name=rejection_protocol          ${filepyth}
  Sleep  2
  Wait Until Element Is Visible        xpath=(//*[contains(@value,'Підтвердити відсутності Наказу про приватизацію об’єкту')])[1]     15
  Click Element                        xpath=(//*[contains(@value,'Підтвердити відсутності Наказу про приватизацію об’єкту')])[1]
  Sleep  5

Вказати дату виконання умов контракту
  [Arguments]  ${username}  ${contract_uaid}  ${dateMet}
  ${test_name_value}=                 Convert To String                 ${TEST_NAME.replace('\'', '')}
  ${contractDateEdit}=    Run Keyword IF   'усіх умов контракту після дати виконання умов приватизації' in '${test_name_value}'
  ...   convert_contract_Met_date_twoZone        ${dateMet}
  ...     ELSE IF   'усіх умов контракту після дати виконання умов приватизації' != '${test_name_value}'
  ...   convert_bank_identification_date         ${dateMet}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Підтверждення виконання решти умов контракту')])[1]     10
# // поле принимает время без секунд
  Input Text                           name=date_met     ${contractDateEdit}
  Sleep  2
  Wait Until Element Is Visible        xpath=(//*[contains(@value,'Підтвердити виконання решти умов')])[1]     15
  Click Element                        xpath=(//*[contains(@value,'Підтвердити виконання решти умов')])[1]
  Sleep  5

Підтвердити невиконання умов приватизації
  [Arguments]  ${username}  ${contract_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${contract_uaid}
  ${filepyth}=    get_file_path
  Wait Until Page Contains Element     xpath=(//*[text()='Завершення приватизації'])[1]     10
  Click Element                        xpath=(//*[text()='Завершення приватизації'])[1]
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'Підтверждення не виконання решти умов контракту')])[1]     10
  Sleep  2
  Choose File                          name=rejection_protocol          ${filepyth}
  Sleep  2
  Wait Until Element Is Visible        xpath=(//*[contains(@value,'Підтвердити не виконання решти умов контракту')])[1]     15
  Click Element                        xpath=(//*[contains(@value,'Підтвердити не виконання решти умов контракту')])[1]
  Sleep  5
