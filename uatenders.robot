*** Setting ***

Library  String
Library  DateTime
Library  uatenders_service.py

*** Variables ***

${locator.title}                                                xpath=(//div[@class='col-md-12']/h2)
${locator.description}                                          xpath=/html/body/div/div[1]/div[1]/div/p
${locator.auctionPeriod.endDate}                                xpath=(//td[@class='auctionEndDate'])
${locator.auctionPeriod.startDate}                              xpath=(//td[@class='enquiryPeriod']/span)
${locator.status}                                               xpath=(//table[@class="clean-table"]//span)[1]
${locator.minimalStep.amount}                                   xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.amount}                                         xpath=(//*[contains(text(),'Очікувана вартість:')]/..//*[position() mod 2 = 0])
${locator.value.currency}                                       xpath=(//table[@class='clean-table']/tbody/tr[4]/td)[1]
${locator.value.valueAddedTaxIncluded}                          xpath=(//span[@class='valueAddedTaxIncluded'])
${locator.auctionID}                                            xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])
${locator.procuringEntity.name}                                 xpath=(//td[@class='item-procuringEntity.name'])
${locator.enquiryPeriod.startDate}                              xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[1]
${locator.enquiryPeriod.endDate}                                xpath=/html/body/div[2]/div[1]/div[3]/div[1]/table[2]/tbody/tr[1]/td/span[2]
${locator.tenderPeriod.startDate}                               xpath=(//span[@class='startDate'])
${locator.tenderPeriod.endDate}                                 xpath=(//span[@class='endDate'])
${locator.items[0].quantity}                                    xpath=(//*[@class='item-amount']//span[1])[1]
${locator.items[1].quantity}                                    xpath=(//*[@class='item-amount']//span[1])[2]
${locator.items[2].quantity}                                    xpath=(//*[@class='item-amount']//span[1])[3]
${locator.items[0].description}                                 xpath=(//td[@class='item-description'])[1]
${locator.items[1].description}                                 xpath=(//td[@class='item-description'])[2]
${locator.items[2].description}                                 xpath=(//td[@class='item-description'])[3]
${locator.items[0].deliveryLocation.latitude}                   xpath=//td[(@class='item-deliveryLocation.latitude')]
${locator.items[0].deliveryLocation.longitude}                  xpath=//td[(@class='item-deliveryLocation.longitude')]
${locator.items[0].unit.code}                                   xpath=(//span[@class='amountCODE'])[1]
${locator.items[1].unit.code}                                   xpath=(//span[@class='amountCODE'])[2]
${locator.items[2].unit.code}                                   xpath=(//span[@class='amountCODE'])[3]
${locator.items[0].unit.name}                                   xpath=(//span[@class='amountDescription'])[1]
${locator.items[1].unit.name}                                   xpath=(//span[@class='amountDescription'])[2]
${locator.items[2].unit.name}                                   xpath=(//span[@class='amountDescription'])[3]
${locator.items[0].deliveryAddress.postalCode}                  xpath=(//span[@class='item-deliveryAddress.postalCode'])
${locator.items[0].deliveryAddress.countryName}                 xpath=(//span[@class='item-deliveryAddress.countryName'])
${locator.items[0].deliveryAddress.region}                      xpath=(//span[@class='item-deliveryAddress.region'])
${locator.items[0].deliveryAddress.locality}                    xpath=(//span[@class='item-deliveryAddress.locality'])
${locator.items[0].deliveryAddress.streetAddress}               xpath=(//span[@class='item-deliveryAddress.streetAddress'])
${locator.items[0].deliveryDate.endDate}                        xpath=//*[@id="lot-0-item-0"]/table/tbody/tr[4]/td
${locator.items[0].classification.scheme}                       xpath=(//span[@class=' item-classification.scheme- '])
${locator.items[0].classification.id}                           xpath=(//span[@class='id'])[1]
${locator.items[0].classification.description}                  xpath=(//span[@class='description'])[1]
${locator.items[1].classification.scheme}                       xpath=(//span[@class=' item-classification.scheme '])
${locator.items[1].classification.id}                           xpath=(//span[@class='id'])[2]
${locator.items[1].classification.description}                  xpath=(//span[@class='description'])[2]
${locator.items[2].classification.scheme}                       xpath=(//span[@class=' item-classification.scheme '])
${locator.items[2].classification.id}                           xpath=(//span[@class='id'])[3]
${locator.items[2].classification.description}                  xpath=(//span[@class='description'])[3]
${locator.items[0].schema_properties.code}                      xpath=(//*[@class='item-schema_properties-code'])[1]
${locator.items[1].schema_properties.code}                      xpath=(//*[@class='item-schema_properties-code'])[2]
${locator.items[2].schema_properties.code}                      xpath=(//*[@class='item-schema_properties-code'])[3]
${locator.items[0].schema_properties.version}                   xpath=(//*[@class='item-schema_properties-version'])[1]
${locator.items[1].schema_properties.version}                   xpath=(//*[@class='item-schema_properties-version'])[2]
${locator.items[2].schema_properties.version}                   xpath=(//*[@class='item-schema_properties-version'])[3]
${locator.items[0].schema_properties.properties.region}         xpath=(//*[@class='item-schema_properties-region'])[1]
${locator.items[1].schema_properties.properties.region}         xpath=(//*[@class='item-schema_properties-region'])[2]
${locator.items[2].schema_properties.properties.region}         xpath=(//*[@class='item-schema_properties-region'])[3]
${locator.items[0].schema_properties.properties.district}       xpath=(//*[@class='item-schema_properties-district'])[1]
${locator.items[1].schema_properties.properties.district}       xpath=(//*[@class='item-schema_properties-district'])[2]
${locator.items[2].schema_properties.properties.district}       xpath=(//*[@class='item-schema_properties-district'])[3]
${locator.items[0].schema_properties.properties.cadastral_number}       xpath=(//*[@class='item-schema_properties-cadastral_number'])[1]
${locator.items[1].schema_properties.properties.cadastral_number}       xpath=(//*[@class='item-schema_properties-cadastral_number'])[2]
${locator.items[2].schema_properties.properties.cadastral_number}       xpath=(//*[@class='item-schema_properties-cadastral_number'])[3]
${locator.items[0].schema_properties.properties.area}           xpath=(//*[@class='item-schema_properties-area'])[1]
${locator.items[1].schema_properties.properties.area}           xpath=(//*[@class='item-schema_properties-area'])[2]
${locator.items[2].schema_properties.properties.area}           xpath=(//*[@class='item-schema_properties-area'])[3]
${locator.items[0].schema_properties.properties.forms_of_land_ownership}       xpath=(//*[@class='item-schema_properties-forms_of_land_ownership']/span)[1]
${locator.items[1].schema_properties.properties.forms_of_land_ownership}       xpath=(//*[@class='item-schema_properties-forms_of_land_ownership']/span)[2]
${locator.items[2].schema_properties.properties.forms_of_land_ownership}       xpath=(//*[@class='item-schema_properties-forms_of_land_ownership']/span)[3]
${locator.items[0].schema_properties.properties.availability_of_utilities}     xpath=(//*[@class='item-schema_properties-availability_of_utilities'])[1]
${locator.items[1].schema_properties.properties.availability_of_utilities}     xpath=(//*[@class='item-schema_properties-availability_of_utilities'])[2]
${locator.items[2].schema_properties.properties.availability_of_utilities}     xpath=(//*[@class='item-schema_properties-availability_of_utilities'])[3]
${locator.items[0].schema_properties.properties.co_owners}      xpath=(//*[@class='item-schema_properties-co_owners'])[1]
${locator.items[1].schema_properties.properties.co_owners}      xpath=(//*[@class='item-schema_properties-co_owners'])[2]
${locator.items[2].schema_properties.properties.co_owners}      xpath=(//*[@class='item-schema_properties-co_owners'])[3]
${locator.dgf}                                                  xpath=(//b[@class='dgfLotID'])
${locator.cancellations[0].status}                              xpath=(//span[@class='status'])
${locator.cancellations[0].reason}                              xpath=/html/body/div/div/div[3]/div/p
${locator.cancellations[0].documents[0].title}                  xpath=(//a[@class='doc-download '])[1]
${locator.cancellations[0].documents[0].description}            xpath=(//span[@class='docDesc'])[1]
${locator.eligibilityCriteria}                                  xpath=(//td[@class='eligibilityCriteria'])
${locator.procurementMethodType}                                xpath=(//*[@class='auctionType'])
${locator.dgfDecisionDate}                                      xpath=(//span[@class='dgf_decision_date'])
${locator.dgfDecisionID}                                        xpath=(//span[@class='dgf_decision_id'])
${locator.tenderAttempts}                                       xpath=(//*[@class='lotDescription'])/span
${locator.awards[0].status}                                     xpath=(//*[@class='col-md-12']//span[contains(@class,'label')])[1]
${locator.awards[1].status}                                     xpath=(//*[@class='col-md-12']//span[contains(@class,'label')])[2]


*** Keywords ***

Підготувати клієнт для користувача
  [Arguments]  ${username}
  [Documentation]  Відкрити брaузер, створити обєкт api wrapper, тощо
  Open Browser   ${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${username}
  Set Window Size       @{USERS.users['${username}'].size}
  Set Window Position   @{USERS.users['${username}'].position}
#  Run Keyword If   '${username}' != 'Ua_Viewer'   Login ${username}
#Login
  Wait Until Page Contains Element   xpath=(//*[text()[contains(.,'Вхід')]])
  Click Element                      xpath=(//*[text()[contains(.,'Вхід')]])
  Wait Until Page Contains Element   name=email   10
  Input text                         name=email      ${USERS.users['${username}'].login}
  Input text                         name=password   ${USERS.users['${username}'].password}
  Click Element                      xpath=//*[@name='remember']
  Wait Until Page Contains Element   xpath=//button[contains(@class, 'btn btn-danger')]
  Click Element                      xpath=//button[contains(@class, 'btn btn-danger')]


Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ${title}=                    Get From Dictionary         ${ARGUMENTS[1].data}                 title
  ${dgf}=                      Get From Dictionary         ${ARGUMENTS[1].data}                 dgfID
  ${description}=              Get From Dictionary         ${ARGUMENTS[1].data}                 description
  ${budget}=                   Get From Dictionary         ${ARGUMENTS[1].data.value}           amount
  ${budget}=                   Convert To String           ${budget}
  ${currency}=                 Get From Dictionary         ${ARGUMENTS[1].data.value}           currency
  ${valueAddedTaxIncluded}=    Get From Dictionary         ${ARGUMENTS[1].data.value}           valueAddedTaxIncluded
  ${step_rate}=                Get From Dictionary         ${ARGUMENTS[1].data.minimalStep}     amount
  ${step_rate} =               Convert To String           ${step_rate}
  ${dates}=                  get_all_uatenders_dates       ${ARGUMENTS[1]}
  ${start_day_auction}=   convert_datetime_for_delivery    ${dates['StartDate']}
  ${items}=                    Get From Dictionary         ${ARGUMENTS[1].data}                 items
  ${item0}=                    Get From List               ${items}                             0
  ${descr_lot}=                Get From Dictionary         ${items[0]}                          description
  ${quantity}=                 Get From Dictionary         ${items[0]}                          quantity
  ${unit}=                     Get From Dictionary         ${items[0].unit}                     name
  ${cav_id}=                   Get From Dictionary         ${items[0].classification}           id
  ${postalCode}=               Get From Dictionary         ${items[0].deliveryAddress}          postalCode
  ${locality}=                 Get From Dictionary         ${items[0].deliveryAddress}          locality
  ${streetAddress}=            Get From Dictionary         ${items[0].deliveryAddress}          streetAddress
  ${schema_properties_region}=     Get From Dictionary     ${items[0].schema_properties.properties}      region
  ${proc_name}=                Get From Dictionary         ${ARGUMENTS[1].data.procuringEntity}          name
  ${unit_id} =                    get_unit_id              ${unit}
  ${dgfdate} =                 Get From Dictionary         ${ARGUMENTS[1].data}                 dgfDecisionDate
  ${dgfdate} =                     get_dgf                 ${dgfdate}
  ${dgfDecisionID}=            Get From Dictionary         ${ARGUMENTS[1].data}                 dgfDecisionID
  ${tenderAttempts}=           Get From Dictionary         ${ARGUMENTS[1].data}                 tenderAttempts
  ${tenderAttempts}=           Convert To String           ${tenderAttempts}
  ${procurement}=              Get From Dictionary         ${ARGUMENTS[1].data}                 procurementMethodType
  Maximize Browser Window
#Редагування "Дані організації"
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a           25
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[2]/li[1]/ul/li[2]/a
  Input text                          name=name            ${proc_name}
  Input text                          name=legal_name      ${proc_name}
  Click Element                       xpath=(//*[@name='legal']/..//*[@type='checkbox'])
  Checkbox Should Be Selected         xpath=(//*[@name='legal']/..//*[@type='checkbox'])
  Click Element                       xpath=//*[@type='submit']
#"Додати аукціон"
  Wait Until Page Contains Element    xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a          25
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  Click Element                       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/ul/li[1]/a
  Input Text                          name=title           ${title}
  Input Text                          xpath=//*[@id="create-tender-form"]/fieldset/div[3]/div/textarea         ${description}
  Click Element                       name=tax_included
  Input Text                          name=map             ${schema_properties_region}
  Input Text                          name=lots[0][title]  ${dgf}
  Run Keyword If   '${procurement}' == 'dgfOtherAssets'   Select From List                    xpath=//select[@name="type_id"]          2
  Input Text                          name=should_start_after      ${start_day_auction}
  Select From List                    name=lots[0][description]    ${tenderAttempts}
  Input Text                          name=lots[0][amount]         ${budget}
  Wait Until Element Is Visible       name=lots[0][minimal_step]     15
  Input Text                          name=lots[0][minimal_step]   ${step_rate}
  Input Text                          name=lots[0][dgf_decision_id]     ${dgfDecisionID}
  Input Text                          name=lots[0][dgf_decision_date]   ${dgfdate}
  Додати багато предметів   ${ARGUMENTS[1]}
  Sleep  10
  Wait Until Element Is Visible       xpath=//*[text()='Опублікувати']     120
  Click Element                       xpath=//*[text()='Опублікувати']
  Sleep  120
  Reload Page
  Sleep  5
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
  ${unit_id} =                         get_unit_id       ${item.unit.name}
  Run Keyword And Ignore Error         Click Element     xpath=//*[text()='Редагувати']
  Run Keyword if    ${index} != 0
  ...    Click Element                 xpath=//a[@class="btn btn-success add-item-section"]
  Wait Until Element Is Visible        name=lots[0][items][${index}][quantity]         25
  Input Text                           name=lots[0][items][${index}][quantity]  ${item.quantity}
  Input Text                           name=lots[0][items][${index}][description]   ${item.description}
  Wait Until Page Contains Element     name=lots[0][items][${index}][unit_id]
  Click Element                        name=lots[0][items][${index}][unit_id]
  Select From List                     xpath=//select[@name="lots[0][items][${index}][unit_id]"]          ${unit_id}
  Input Text                           name=lots[0][items][${index}][cav]   ${item.classification.id}
  Wait Until Page Contains Element     xpath=//li[@class='ui-menu-item']      25
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[1]
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[2]
  Run Keyword And Ignore Error         Click Element     xpath=(//li[@class='ui-menu-item'])[3]
  Sleep  10
  Execute Javascript  window.document.evaluate("//*[@type='submit']", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Click Element                        xpath=//*[@type='submit']

Отримати інформацію про auctionID
  ${tender_UAid}=   Отримати текст із поля і показати на сторінці   auctionID
  [Return]  ${tender_UAid}

Задати питання
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tenderUaId
  ...      ${ARGUMENTS[2]} ==  questionId
  ${title}=           Get From Dictionary  ${ARGUMENTS[2].data}  title
  ${description}=     Get From Dictionary  ${ARGUMENTS[2].data}  description
  Click Element       xpath=//*[text()='Задати запитання'][1]
  Input text          name=title                                 ${title}
  Input Text          name=question                              ${description}
  Click Element       xpath=//*[@type='submit']

Задати запитання на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${question}
  ${title}=           Get From Dictionary    ${question.data}    title
  ${description}=     Get From Dictionary    ${question.data}    description
  uatenders.Пошук тендера по ідентифікатору  ${username}   ${tender_uaid}
  Click Element       xpath=(//a[@class='btn btn-success auctionQuestion'])[1]
  Input Text          name=title                                 ${title}
  Input Text          name=question                              ${description}
  Click Element       xpath=(//input[@class='btn btn-xs btn-default'])


Подати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} ==  ${test_bid_data}
  uatenders.Пошук тендера по ідентифікатору  ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element     xpath=//*[text()='Подати пропозицію'][1]
  Wait Until Element Is Visible       xpath=//*[@id="self_eligible"]      25
  Click Element                       xpath=//*[@id="self_eligible"]
  Run Keyword If     'Неможливість' in '${TEST_NAME}'       Click Element              xpath=//*[@type='submit']//
  Run Keyword If     '${MODE}' == 'dgfFinancialAssets'      Run Keyword
  ...   Input Text               name=amount       ${ARGUMENTS[2].data.value.amount}
  ...      ELSE IF   '${MODE}' == 'dgfInsider' or 'Неможливість' != '${TEST_NAME}'   Run Keyword
  ...   Click Element      xpath=//*[@type='submit']
  Run Keyword If   'без кваліфікації' in '${TEST_NAME}'
  ...  Fail  "Неможливо подати пропозицію без кваліфікації"


Скасувати цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Click Element                       xpath=//*[text()='Редагувати пропозицію']
  Wait Until Element Is Visible       xpath=//*[text()='Відмінити']    25
  Click Element                       xpath=//*[text()='Відмінити']
  Wait Until Page Contains Element       xpath=//*[@id="modal-confirm-bid"]/div/div/div[3]/input
  Click Element               xpath=//*[@id="modal-confirm-bid"]/div/div/div[3]/input

Змінити цінову пропозицію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tenderId
  ...    ${ARGUMENTS[2]} ==  amount
  ...    ${ARGUMENTS[3]} ==  amount.value
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${amount} =          Convert To String      ${ARGUMENTS[3]}
  Click Element               xpath=//*[text()='Редагувати пропозицію']
  Clear Element Text          name=amount
  Input Text                  name=amount                   ${amount}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    30
  Click Element               xpath=//*[@type='submit']
  Sleep  8

Завантажити документ в ставку
  [Arguments]  ${username}  ${filePath}  ${tender_uaid}
  ${filepyth}=                              get_file_path
  Run Keyword if   'Неможливість' in '${TEST_NAME}'        uatenders.Пошук тендера по ідентифікатору  ${username}   ${tender_uaid}
  Reload Page
  Sleep  5
  Click Element               xpath=//*[text()='Додати файл']
  Choose File                 id=bid-1            ${filepyth}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    60
  Click Element               xpath=//*[@type='submit']

Змінити документ в ставці
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[1]} ==  file
  ...    ${ARGUMENTS[2]} ==  tenderId
  ${filepyth}=                get_file_path
  Click Element               xpath=//*[text()='Додати файл']
  Choose File                 id=bid-1            ${filepyth}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    60
  Click Element               xpath=//*[@type='submit']

Відповісти на питання
  Sleep   20
  Reload Page
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} = username
  ...      ${ARGUMENTS[1]} = ${TENDER_UAID}
  ...      ${ARGUMENTS[2]} = 0
  ...      ${ARGUMENTS[3]} = answer_data
  ${answer}=        Get From Dictionary        ${ARGUMENTS[3].data}   answer
  Run Keyword if   'запитання на лот' in '${TEST_NAME}'               Click Element       xpath=//a[@class="questionItem"]
  Run Keyword if   'запитання на всі предмети' in '${TEST_NAME}'      Click Element       xpath=//a[@class="auctionQuestionList"]
  Sleep   5
  Click Element               xpath=//*[text()='Відповісти']
  Input Text                  name=answer                             ${answer}
  Click Element               xpath=//*[@type='submit']


Завантажити документ
  [Arguments]  ${username}  ${filepath}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element               xpath=//*[text()='Редагувати']
  Choose File                 name=tender[files][]                   ${filepath}
  Wait Until Element Is Visible     xpath=//*[@type='submit']    60
  Click Element               xpath=//*[@type='submit']

Внести зміни в тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} =  username
  ...    ${ARGUMENTS[1]} =  ${file_path}
  ...    ${ARGUMENTS[2]} =  ${TENDER_UAID}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Input Text                 name=description              Тестовий тендер після редагування
  Wait Until Element Is Visible     xpath=//*[@type='submit']    60
  Click Element              xpath=//*[@id="submit-edit-btn"]

Оновити сторінку з тендером
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} =  username
  ...      ${ARGUMENTS[1]} =  ${TENDER_UAID}
  uatenders.Пошук тендера по ідентифікатору    ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  5
  Run Keyword And Ignore Error         Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  15
  Reload Page
  Sleep  2

Подати скаргу
  [Arguments]  @{ARGUMENTS}
  Fail  Поки не реалізовано

Порівняти скаргу
  [Arguments]  @{ARGUMENTS}
  Fail  Поки не реалізовано

Пошук тендера по ідентифікатору
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${TENDER_UAID}
  Go To  ${USERS.users['${ARGUMENTS[0]}'].homepage}
  Run Keyword And Ignore Error        Click Element        xpath=//*[@class='navbar-brand']
  Log To Console  tender_id --> ${ARGUMENTS[1]}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Run Keyword If      '${ARGUMENTS[1]}' == 'PASS'    Input Text     name=search[s]    ${ARGUMENTS[1]}
  ...   AND   Input Text                                  name=search[s]                    ${ARGUMENTS[1]}
  ...   AND   Click Button                                xpath=(//*[contains(@type,'submit') and contains(.,'Знайти')])
  ...   AND   Element Should Be Visible                   xpath=(//*[text()[contains(.,'Загальна інформація')]])[1]
  Run Keyword And Ignore Error        Click Element       xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])

Отримати інформацію про dgfID
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgf
  [Return]  ${return_value}

Отримати інформацію про title
  ${return_value}=   Отримати текст із поля і показати на сторінці   title
  [Return]  ${return_value}

Отримати інформацію про value.currency
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.currency
  [Return]  ${return_value.split(' ')[1]}

Отримати інформацію про status
  Reload page
  Sleep  2
  ${return_value}=   Отримати текст із поля і показати на сторінці   status
  ${return_value}=   convert_uatenders_string_to_common_string   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про value.valueAddedTaxIncluded
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.valueAddedTaxIncluded
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  ${return_value}=   Convert To Boolean   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про description
  ${return_value}=   Отримати текст із поля і показати на сторінці   description
  [Return]  ${return_value}

Отримати інформацію про value.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   value.amount
  ${return_value}=            Get Line             ${return_value}    0
  ${return_value}=         Fetch From Left         ${return_value}   UAH
  ${return_value}=        Convert To Number        ${return_value.split(' ')[0]}
  [Return]  ${return_value}

Отримати інформацію про tenderId
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderId
  [Return]  ${return_value}

Отримати інформацію про auctionPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.startDate
  ${return_value}=            convert_auction_date     ${return_value}
  [Return]  ${return_value}

Отримати інформацію про auctionPeriod.endDate
  Wait Until Keyword Succeeds   10 x   20 s   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(//*[contains(text(),'Дата закінчення аукціону')])[1]
  ${return_value}=   Отримати текст із поля і показати на сторінці   auctionPeriod.endDate
  ${return_value}=            convert_auction_date    ${return_value}
  [Return]  ${return_value}

Отримати інформацію про procuringEntity.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   procuringEntity.name
  [Return]  ${return_value}

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
  ${return_value}=   Change_date_to_month   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про enquiryPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   enquiryPeriod.endDate
  ${return_value}=   convert_auction_date   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про tenderPeriod.startDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.startDate
  ${return_value}=   convert_auction_date   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про tenderPeriod.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderPeriod.endDate
  ${return_value}=   convert_auction_date   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про minimalStep.amount
  ${return_value}=   Отримати текст із поля і показати на сторінці   minimalStep.amount
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [Return]  ${return_value}

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
  Wait Until Page Contains    [ТЕСТУВАННЯ]   10

Отримати інформацію про items[${index}].description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].description
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryDate.endDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryDate.endDate
  ${return_value}=   Change_date_to_month   ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryLocation.latitude
  Fail  Немає такого поля при перегляді

Отримати інформацію про items[0].deliveryLocation.longitude
  Fail  Немає такого поля при перегляді

Отримати інформацію про items[0].deliveryAddress.countryName
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.countryName
  ${return_value}=   Remove String   ${return_value}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Украина'   Convert To String   Україна
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.postalCode
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.postalCode
  ${return_value}=   Remove String   ${return_value}  ,
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.region
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.region
  ${return_value}=   Remove String   ${return_value}  ,
  ${return_value}=   Run keyword if    '${return_value}' == 'Київ'   Convert To String  м. Київ
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.locality
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.locality
  ${return_value}=   Remove String   ${return_value}  ,
  [Return]  ${return_value}

Отримати інформацію про items[0].deliveryAddress.streetAddress
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[0].deliveryAddress.streetAddress
  ${return_value}=   Remove String    ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[${index}].classification.scheme
  ${return_value}=   Convert To String    CAV
  [Return]  ${return_value}

Отримати інформацію про items[${index}].classification.id
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].classification.id
  [Return]  ${return_value}

Отримати інформацію про items[${index}].classification.description
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].classification.description
  [Return]  ${return_value}

Отримати інформацію про items[${index}].unit.code
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.code
  ${return_value}=   Convert To String     ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[${index}].unit.name
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].unit.name
  ${return_value}=   convert to string                            ${return_value}
  ${return_value}=   convert_uatenders_string_to_common_string    ${return_value}
  [Return]   ${return_value}

Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Page Contains Element         xpath=//a[@class="auctionUrl"]
  ${url}=        Get Element Attribute     xpath=//a[@class="auctionUrl"]@href
  ${url}=        convert to string         ${url}
  [Return]  ${url}

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
  Wait Until Page Contains Element      xpath=//a[@class="auctionUrl"]
  ${url}=    Get Element Attribute      xpath=//a[@class="auctionUrl"]@href
  [Return]   ${url}

Отримати посилання на аукціон dgfInsider
  [Arguments]   @{ARGUMENTS}
  Click Element                         xpath=//*[text()='Мої пропозиції']
  Wait Until Element Is Visible         xpath=((//*[contains(text(),'${ARGUMENTS[1]}')]//..//*)[contains(@class,"auctionUrl")])    60
  ${url}=     Get Element Attribute     xpath=((//*[contains(text(),'${ARGUMENTS[1]}')]//..//*)[contains(@class,"auctionUrl")])@href
  Click Element                         xpath=(//*[contains(text(),'${ARGUMENTS[1]}')]//..//a)[1]
  [Return]   ${url}

Отримати інформацію про items[${index}].quantity
  ${return_value}=   Отримати текст із поля і показати на сторінці   items[${index}].quantity
  ${return_value}=   Convert To Number   ${return_value.split(' ')[0]}
  [Return]   ${return_value}

Отримати інформацію про items[${index}].schema_properties.code
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   items[${index}].schema_properties.code

Отримати інформацію про items[${index}].schema_properties.version
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   items[${index}].schema_properties.version

Отримати інформацію про items[${index}].schema_properties.properties.region
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   items[${index}].schema_properties.properties.region

Отримати інформацію про items[${index}].schema_properties.properties.district
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   items[${index}].schema_properties.properties.district

Отримати інформацію про items[${index}].schema_properties.properties.cadastral_number
  Run Keyword And Return   Отримати текст із поля і показати на сторінці   items[${index}].schema_properties.properties.cadastral_number

Отримати інформацію про items[${index}].schema_properties.properties.area
  ${return_value}=   Отримати текст із поля і показати на сторінці         items[${index}].schema_properties.properties.area
  ${return_value}=                Convert To Integer                       ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[${index}].schema_properties.properties.forms_of_land_ownership
  ${return_value}=   Отримати текст із поля і показати на сторінці         items[${index}].schema_properties.properties.forms_of_land_ownership
  ${return_value}=     convert_uatenders_string_to_common_string           ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[${index}].schema_properties.properties.co_owners
  ${return_value}=   Отримати текст із поля і показати на сторінці         items[${index}].schema_properties.properties.co_owners
  ${return_value}=     convert_uatenders_string_to_common_string           ${return_value}
  [Return]  ${return_value}

Отримати інформацію про items[${index}].schema_properties.properties.availability_of_utilities
  ${return_value}=   Отримати текст із поля і показати на сторінці         items[${index}].schema_properties.properties.availability_of_utilities
  ${return_value}=     convert_uatenders_string_to_common_string           ${return_value}
  [Return]  ${return_value}

# ==========================
#          Запитання
# ==========================

Отримати інформацію про questions[0].title
  [Arguments]  ${username}  ${question_id}
  Wait Until Keyword Succeeds   5 x   25 s     Run Keyword
  ...   Element Should Be Visible              xpath=(//*[contains(text(),'${question_id}')]/..//*)[1]         ${question_id}
  ${return_value}=       Get Text              xpath=(//*[contains(text(),'${question_id}')]/..//*)[1]
  [Return]  ${return_value}

Отримати інформацію про questions[0].description
  [Arguments]  ${username}  ${question_id}
  ${return_value}=       Get Text              xpath=(//*[contains(text(),'${question_id}')]/..//following::*)[2]
  [Return]  ${return_value}

Отримати інформацію про questions[0].answer
  [Arguments]  ${username}  ${question_id}
  Wait Until Page Contains Element            xpath=(//*[contains(text(),'${question_id}')]/..//following::*[@class='bs-callout bs-callout-success']//p)[1]           60
  ${return_value}=      Get Text              xpath=(//*[contains(text(),'${question_id}')]/..//following::*[@class='bs-callout bs-callout-success']//p)[1]
  [Return]  ${return_value}

Підготувати дані для оголошення тендера
  [Arguments]  ${username}   ${tender_data}    ${role_name}
  ${tender_data}=    adapt_procuringEntity     ${tender_data}
  ${tender_data}=        adapt_item            ${tender_data}  ${role_name}
  [Return]  ${tender_data}

Отримати інформацію із тендера
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  fieldname
  ${return_value}=  Run Keyword  Отримати інформацію про ${ARGUMENTS[2]}
  [Return]  ${return_value}

Отримати текст із поля і показати на сторінці
  [Arguments]   ${fieldname}
  Wait Until Page Contains Element            ${locator.${fieldname}}    20
  ${return_value}=      Get Text              ${locator.${fieldname}}
  [Return]  ${return_value}

Отримати інформацію із предмету
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  item_id
  ...      ${ARGUMENTS[3]} ==  field_name
  ${return_value}=  Run Keyword And Return  uatenders.Отримати інформацію із тендера  ${username}  ${tender_uaid}  ${field_name}
  [Return]  ${return_value}

Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}   ${field}
  Click Element                        xpath=//*[text()='Мої пропозиції']
  Wait Until Element Is Visible        xpath=(//*[contains(text(),'${tender_uaid}')]/..//span)[3]      30
  Click Element                        xpath=(//*[contains(text(),'${tender_uaid}')]/..//span)[3]
  ${value}=     Get Value              name=amount
  ${value}=     Convert To String      ${value.split('.')[0]}
  ${value}=     Convert To Number      ${value}
  [Return]    ${value}

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  ${filepyth}=                               get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//a[@class='btn btn-warning'])        60
  Click Element                      xpath=(//a[@class='btn btn-warning'])
  Click Element                      xpath=//*[text()='Додати файл']
  Choose File                        id=award-0-1           ${filepyth}
  Click Element                      xpath=//*[@type='submit']
  Wait Until Element Is Visible      xpath=/html/body/div/div/div[3]/div/a[1]     60
  Click Element                      xpath=/html/body/div/div/div[3]/div/a[1]

Підтвердити підписання контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}
  ${filepyth}=                              get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Element Is Visible      xpath=(//a[@class='main_contract'])          60
  Click Element                      xpath=(//a[@class='main_contract'])
  Click Element                      xpath=/html/body/div/div/table/tbody/tr/td[2]/a
  Input text                         name=contract_number   ${contract_num}
  Choose File                        id=contract-0          ${filepyth}
  Click Element                      name=date_signed
  Click Element                      name=period_date_start
  Click Element                      name=period_date_end
  Wait Until Element Is Visible      xpath=(//a[@class='btn btn-success'])        60
  Click Element                      xpath=(//a[@class='btn btn-success'])

Скасувати закупівлю
  [Arguments]  ${username}  ${tender_uaid}  ${cancellation_reason}  ${document}  ${new_description}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Click Element                      xpath=(//a[@class='btn btn-danger'])
  Input Text                         name=reason                                 ${cancellation_reason}
  Choose File                        id=cancel-1                                 ${document}
  Input Text                         name=cancel[descriptions][]                 ${new_description}
  Click Element                      xpath=//*[@type='submit']
  Wait Until Element Is Visible      xpath=(//a[@class='btn btn btn-info'])       60
  Click Element                      xpath=(//a[@class='btn btn btn-info'])

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  ${option}=               Get Matching Xpath Count       //*[@class='table']//tr
  ${index}=                  get_minus_Index                     ${option}
  Run Keyword And Return If    'title' == '${field}'         Отримати інформацію про cancellations[0].documents[${index}].title
  Run Keyword And Return If    'description' == '${field}'   Отримати інформацію про cancellations[0].documents[${index}].description

Отримати інформацію про cancellations[0].status
  Sleep  5
  Reload Page
  Sleep  5
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Sleep  2
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].status

Отримати інформацію про cancellations[0].reason
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].reason

Отримати інформацію про cancellations[0].documents[${index}].title
  Run Keyword And Ignore Error       Click Element        xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].documents[0].title

Отримати інформацію про cancellations[0].documents[${index}].description
  Click Element                      xpath=(//*[contains(text(),'Заявка на відміну аукціону')])[1]
  Run Keyword And Return    Отримати текст із поля і показати на сторінці    cancellations[0].documents[0].description

Додати Virtual Data Room
  [Arguments]  ${username}  ${tender_uaid}  ${vdr_url}  ${title}=Sample Virtual Data Room
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Wait Until Element Is Visible      xpath=//*[text()='Додати гіперпосилання']     60
  Click Element                      xpath=//*[text()='Додати гіперпосилання']
  Input Text                         name=vdr[]             ${vdr_url}
  Click Element                      xpath=//*[@type='submit']

Завантажити ілюстрацію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  ${filepath}=   local_path_to_file   TestDocument.docx
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Choose File                        name=tender[files][]       ${filepath}
  Select From List                   xpath=//select[@name="tender[docTypes][]"]    6
  Wait Until Element Is Visible      xpath=//*[@type='submit']                     60
  Click Element                      xpath=//*[@type='submit']

Додати публічний паспорт активу
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  ${filepath}=   local_path_to_file   TestDocument.docx
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати']
  Choose File                        name=tender[files][]       ${filepath}
  Select From List                   xpath=//select[@name="tender[docTypes][]"]    2
  Wait Until Element Is Visible      xpath=//*[@type='submit']                     60
  Click Element                      xpath=//*[@type='submit']

Отримати інформацію про eligibilityCriteria
  ${return_value}=   Отримати текст із поля і показати на сторінці   eligibilityCriteria
  [Return]  ${return_value}

Отримати інформацію із запитання
  [Arguments]   ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   10 x   25 s     Run Keyword
  ...   Element Should Be Visible    xpath=(//*[contains(@class,'active') and contains(.,'Запитання')])    Запитання
  Click Element                      xpath=//a[@class="auctionQuestionList"]
  ${return_value}=    Run Keyword    Отримати інформацію про questions[0].${field_name}   ${username}   ${question_id}
  [Return]  ${return_value}

Задати запитання на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${question}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=(//*[contains(@title,'${item_id}') and contains(.,'Задати запитання')])
  Input Text                         name=title                                      ${question.data.title}
  Input Text                         name=question                                   ${question.data.description}
  Click Element                      xpath=(//input[@value='Опублікувати запитання'])[1]

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//a[@class="auctionQuestionList"]
  Click Element                      xpath=//*[text()='Відповісти']
  Input Text                         name=answer                                     ${answer_data.data.answer}
  Wait Until Element Is Visible      xpath=//*[@type='submit']                     60
  Click Element                      xpath=//*[@type='submit']

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  ${file_name}=          Get Text         xpath=//a[contains(text(),'${doc_id}')]
  ${url}=         Get Element Attribute   xpath=//a[contains(text(),'${doc_id}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}

Завантажити фінансову ліцензію
  [Arguments]  ${username}  ${tender_uaid}  ${filepath}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=//*[text()='Редагувати пропозицію']
  Choose File                        name=bid[files][]            ${filepath}
  Select From List                   name=bid[docTypes][]         14
  Wait Until Element Is Visible      xpath=(//*[contains(@type,'submit') and contains(@value,'Оновити')])              60
  Click Element                      xpath=(//*[contains(@type,'submit') and contains(@value,'Оновити')])

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error       Click Element      xpath=(//a[@class='btn btn-warning'])
  Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Click Element                                   xpath=//a[text()[contains(.,'Мої пропозиції')]]
  ...   AND   Sleep  5
  ...   AND   Reload Page
  ...   AND   Sleep  5
  ...   AND   Wait Until Element Is Visible             xpath=(//*[text()[contains(.,'${tender_uaid}')]])//..//*[contains(@class,'btn btn-xs btn-danger')]
  ...   AND   Click Element                             xpath=(//*[text()[contains(.,'${tender_uaid}')]])//..//*[contains(@class,'btn btn-xs btn-danger')]
  ...   AND   Sleep  2
  ...   AND   Click Element                             xpath=//a[text()[contains(.,'Так')]]

Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=(//a[@class='btn btn-warning'])
  Click Element                      xpath=//*[text()='Додати файл']
  Choose File                        id=award-0-1           ${document}
  Wait Until Element Is Visible      xpath=//*[@type='submit']        60
  Click Element                      xpath=//*[@type='submit']

Дискваліфікувати постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}  ${description}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=(//a[@class='btn btn-warning'])
  Click Element                      xpath=/html/body/div/div/div[3]/div/a[2]
  Input Text                         name=unsuccessful_title        ${award_num}
  Input Text                         name=unsuccessful_description  ${description}
  Click Element                      xpath=//*[@type='submit']

Завантажити угоду до тендера
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${filepath}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                      xpath=/html/body/div/div[1]/div[2]/div/ul/li[4]/a
  Click Element                      xpath=/html/body/div/div/table/tbody/tr/td[2]/a
  Click Element                      xpath=//*[text()='Додати файл']
  Choose File                        name=contract[files][]            ${filepath}
  Wait Until Element Is Visible      xpath=//*[@type='submit']        60
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
  Choose File                        name=bid[files][]            ${filepath}
  Select From List                   name=bid[docTypes][]             15
  Wait Until Element Is Visible      xpath=//*[@type='submit']        60
  Click Element                      xpath=//*[@type='submit']

Отримати дані із документу пропозиції
  [Arguments]  ${user_name}  ${tender_id}  ${bid_index}  ${document_index}  ${field}
  ${return_value}=      Get Text     xpath=(//span[@id=${document_index}])
  [Return]       ${return_value}

Отримати інформацію про procurementMethodType
  ${return_value}=   Отримати текст із поля і показати на сторінці   procurementMethodType
  ${return_value}=       convert_uatenders_string_to_common_string   ${return_value}
  [Return]       ${return_value}

Отримати інформацію про dgfDecisionDate
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgfDecisionDate
  [Return]       ${return_value}

Отримати інформацію про dgfDecisionID
  ${return_value}=   Отримати текст із поля і показати на сторінці   dgfDecisionID
  [Return]       ${return_value}

Отримати інформацію про tenderAttempts
  ${return_value}=   Отримати текст із поля і показати на сторінці   tenderAttempts
  ${return_value}=                  Convert To Integer               ${return_value}
  [Return]       ${return_value}

Отримати кількість документів в тендері
  [Arguments]  @{ARGUMENTS}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${return_value}=              Get Matching Xpath Count            //*[@class='table']//tr
  [Return]  ${return_value}

Отримати інформацію із документа по індексу
  [Arguments]  ${user_name}   ${tender_id}   ${document_index}   ${field}
  ${return_value}=              Get Text                           xpath=(//*[@class='table']//*[@index='${document_index}'])//span
  [Return]       ${return_value}

Завантажити документ в тендер з типом
  [Arguments]  ${username}  ${tender_uaid}  ${doc}  ${doc_type}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${option}=      convert_uatenders_string_to_common_string     ${doc_type}
  Click Element                            xpath=//*[text()='Редагувати']
  Wait Until Page Contains Element         name=tender[files][]                          10
  Choose File                              name=tender[files][]                          ${doc}
  Select From List                         xpath=//select[@name="tender[docTypes][]"]    ${option}
  Wait Until Element Is Visible            xpath=//*[@type='submit']        60
  Click Element                            xpath=//*[@type='submit']

Додати офлайн документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Click Element                            xpath=//*[text()='Редагувати']
  Wait Until Page Contains Element         xpath=//*[text()='Додати гіперпосилання']
  Click Element                            xpath=//*[text()='Додати гіперпосилання']
  Wait Until Page Contains Element         xpath=//select[@name="vdrDocTypes[]"]         20
  Select From List                         xpath=//select[@name="vdrDocTypes[]"]         21
  Input text                               name=vdr[]                                    ${doc}
  Wait Until Element Is Visible            xpath=//*[@type='submit']        60
  Click Element                            xpath=//*[@type='submit']

Отримати кількість предметів в тендері
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Wait Until Page Contains Element                       xpath=(//span[@class='item-classification.scheme'])
  ${number_of_items}=       Get Matching Xpath Count           (//span[@class='item-classification.scheme'])
  [Return]  ${number_of_items}

Додати предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Ignore Error    Додати предмет          ${item}   0

Видалити предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${lot_id}=${Empty}
  Run Keyword And Ignore Error    Click Element           xpath=//*[text()='Редагувати']


Завантажити протокол аукціону в авард
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  ...      ${ARGUMENTS[2]} ==  filepath
  ...      ${ARGUMENTS[3]} ==  award_index
  ${ARGUMENTS[2]}=                                       get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Wait Until Element Is Visible                     xpath=(//a[@class='btn btn-warning'])
  Click Element                                     xpath=(//a[@class='btn btn-warning'])
  Choose File                                       xpath=//*[@id='award-${ARGUMENTS[3]}-1']              ${ARGUMENTS[2]}
  Select From List                                  xpath=//*[@class='form-control select2-hidden-accessible']    22
  Wait Until Element Is Visible                     xpath=//*[@type='submit']
  Click Element                                     xpath=//*[@type='submit']

Підтвердити наявність протоколу аукціону
  [Arguments]  ${username}  ${tender_uaid}  ${award_index}
  Wait Until Element Is Visible                     xpath=(//a[@class='btn btn-warning'])
  Click Element                                     xpath=(//a[@class='btn btn-warning'])
  Sleep  2
  Maximize Browser Window
  Sleep  5
  Run Keyword if   'Неможливість' in '${TEST_NAME}'        Run Keywords
  ...   Wait Until Element Is Not Visible           xpath=//a[text()[contains(.,'Підтвердити протокол')]]    90
  ...   AND  Sleep  3
  Wait Until Element Is Visible                     xpath=//a[text()[contains(.,'Підтвердити протокол')]]
  Click Element                                     xpath=//a[text()[contains(.,'Підтвердити протокол')]]

Отримати інформацію про awards[0].status
  Click Element                                    xpath=(//*[contains(text(),'Пропозиції')])[1]
  ${test_name_value}=                Convert To String                                         ${TEST_NAME.replace('\'', '')}
  Run Keyword If   'оплачено, очікується підписання договору' in '${test_name_value}'   Wait Until Keyword Succeeds   10 x   10 s   Run Keywords
  ...   Wait Until Page Contains  Оплачено, очікується підписання договору
  ...   AND   Reload Page
  ...   AND   Sleep  5
  ${return_value}=    Отримати текст із поля і показати на сторінці    awards[0].status
  ${return_value}=      convert_uatenders_string_to_common_string      ${return_value}
  [Return]       ${return_value}

Отримати інформацію про awards[1].status
  Click Element                                    xpath=(//*[contains(text(),'Пропозиції')])[1]
  ${test_name_value}=                Convert To String                                         ${TEST_NAME.replace('\'', '')}
  Run Keyword If   'оплачено, очікується підписання договору' in '${test_name_value}'   Wait Until Keyword Succeeds   10 x   10 s   Run Keywords
  ...   Wait Until Page Contains  Оплачено, очікується підписання договору
  ...   AND   Reload Page
  ...   AND   Sleep  5
  ${return_value}=    Отримати текст із поля і показати на сторінці    awards[1].status
  ${return_value}=      convert_uatenders_string_to_common_string      ${return_value}
  [Return]       ${return_value}
