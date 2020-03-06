*** Setting ***
Library  String
Library  DateTime
Library  uatenders_service.py

*** Variables ***
############################################   Provider_Tender Locators
&{methodType}
...       aboveThresholdUA=Відкриті торги
...       aboveThresholdEU=Відкриті торги з публікацією англійською мовою
...       competitiveDialogueUA=Конкурентний діалог
...       competitiveDialogueEU=Конкурентний діалог з публікацією англ. мовою
...       negotiation=Переговорна процедура
...       negotiation.quick=Скорочена переговорна процедура
...       reporting=Звіт про укладений договір
...       belowThreshold=Допорогова закупівля
...       aboveThresholdUA.defense=Переговорна процедура для потреб оборони
...       esco=Закупівля енергосервісу (ESCO)
# ...       negotiationarm=Переговорна процедура для потреб оборони
${locator.provider.title}                                                   xpath=//*[@class='Tender-name ukr_version']
${locator.provider.title_en}                                                xpath=//*[@class='Tender-name eng_version']
${locator.provider.description}                                             xpath=//*[@class='Tender-description']
${locator.provider.value.amount}                                            xpath=(//*[@class='data-amount'])
${locator.provider.minimalStep.amount}                                      xpath=(//*[text()[contains(.,'Мінімальний крок пониження')]]/..//*[@class='amountValue'])
${locator.provider.value.currency}                                          xpath=//*[@class='data-currency_code ifua']
${locator.provider.value.valueAddedTaxIncluded}                             xpath=(//*[contains(text(),'Очікувана вартість закупівлі')]/..//*[position() mod 2 = 0]/span)[3]
${locator.provider.tenderId}                                                xpath=(//*[contains(text(),'Ідентифікаційний номер')]/..//*[position() mod 2 = 0])
${locator.provider.procuringEntity.name}                                    xpath=(.//*[@class='item-procuringEntity.name'])[1]
${locator.provider.enquiryPeriod.startDate}                                 xpath=(//*[text()[contains(.,'Дати')]]/..//*[@class='tenderPeriod']//span)[1]
${locator.provider.enquiryPeriod.endDate}                                   xpath=(//*[text()[contains(.,'Дати')]]/..//*[@class='tenderPeriod']//span)[1]
${locator.provider.tenderPeriod.startDate}                                  xpath=(//*[contains(text(),'Подача пропозицій')]/..//*[position() mod 2 = 0]/span)
${locator.provider.tenderPeriod.endDate}                                    xpath=(//*[contains(text(),'Подача пропозицій')]/..//*[position() mod 2 = 0]/span)    #tenderPeriod
${locator.provider.procurementMethodType}                                   xpath=(//div[@class='col-md-12']//p)[1]
${locator.provider.complaintPeriod.endDate}                                 xpath=(//*[contains(text(),'Період оскарження умов')]/..//*[position() mod 2 = 0]/span)
${locator.provider.status}                                                  xpath=(//span[@class='titleStep activeStep'])
${locator.provider.qualificationPeriod.endDate}                             xpath=//*[@id='propozEnd']
${locator.provider.lots[0].value.amount}                                    xpath=(//*[@class='data-amount'])
${locator.provider.fundingKind}                                             xpath=(//*[contains(text(),'Джерело фінансування лота:')]/..//*[position() mod 2 = 0])[1]
${locator.provider.maxAwardsCount}                                          xpath=(.//*[@id='maxSupplierNumb'])[1]
${locator.provider.agreements[0].agreementID}                               xpath=(//*[contains(text(),'Ідентифікаційний номер')]/..//*[position() mod 2 = 0])[1]
####################################    Complaint Locators
############  Вимога статус  ############
${locator.claims.provider.status}                                           xpath=(//span[@class='titleStep activeStep'])
####################################    OwnerViewer Tender Locators
${locator.ownerViewer.title}                                                xpath=(//div[@class='col-md-12']/h2)
${locator.ownerViewer.title_en}                                             xpath=(//table[@class='clean-table']//td)[2]
${locator.ownerViewer.description}                                          xpath=(//div[@class='col-md-12']/p[2])
${locator.ownerViewer.value.amount}                                         xpath=//*[@class='data-amount']
${locator.ownerViewer.value.currency}                                       xpath=//*[@class='data-currency_code']
${locator.ownerViewer.value.valueAddedTaxIncluded}                          xpath=//*[@class='data-tax_included']
${locator.ownerViewer.tenderId}                                             xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.tenderIdSecond}                                       xpath=(//*[contains(text(),'ID:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.contractTenderId}                                     xpath=(//*[contains(text(),'№')]/../../..//a)[1]
${locator.ownerViewer.procuringEntity.name}                                 xpath=(//td[@class='item-procuringEntity.name'])[1]
${locator.ownerViewer.enquiryPeriod.startDate}                              xpath=(//*[text()[contains(.,'Дати')]]/..//*[@class='tenderPeriod']//span)[1]
${locator.ownerViewer.enquiryPeriod.endDate}                                xpath=(//*[text()[contains(.,'Дати')]]/..//*[@class='tenderPeriod']//span)[1]
${locator.ownerViewer.tenderPeriod.startDate}                               xpath=(//*[contains(text(),'Кінцевий строк подання тендерних пропозицій:')]/..//*[position() mod 2 = 0]/span)
${locator.ownerViewer.tenderPeriod.endDate}                                 xpath=(//*[contains(text(),'Кінцевий строк подання тендерних пропозицій:')]/..//*[position() mod 2 = 0]/span)    #tenderPeriod
${locator.ownerViewer.minimalStep.amount}                                   xpath=(//span[@class='data-minimal_step'])
${locator.ownerViewer.procurementMethodType}                                xpath=(//div[@class='col-md-12']//p)[1]
${locator.ownerViewer.complaintPeriod.endDate}                              xpath=(//*[contains(text(),'Оскарження умов закупівлі:')]/..//*[position() mod 2 = 0]/span)
${locator.ownerViewer.auctionUrl}                                           xpath=//a[@class="move-to-auction-page"]
${locator.ownerViewer.auctionPeriod.startDate}                              xpath=(//*[contains(text(),'Дата початку аукціону')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.status}                                               xpath=(//table[@class="clean-table"]//span)[1]
${locator.ownerViewer.mainProcurementCategory}                              xpath=(//*[contains(text(),'Тип предмету закупівлі:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.NBUdiscountRate}                                      xpath=(//*[contains(text(),'Облікова ставка НБУ')]/..//*[position() mod 2 = 0])[1]
${locator.ownerViewer.minimalStepPercentage}                                xpath=(//*[contains(text(),'Мінімальний крок підвищення показника ефективності:')]/..//*[position() mod 2 = 0])[1]
${locator.ownerViewer.yearlyPaymentsPercentageRange}                        xpath=(//*[contains(text(),'Фіксований відсоток суми скорочення витрат замовника:')]/..//*[position() mod 2 = 0])[1]
${locator.ownerViewer.fundingKind}                                          xpath=(//*[contains(text(),'Джерело фінансування лота:')]/..//*[position() mod 2 = 0])[1]
${locator.ownerViewer.maxAwardsCount}                                       xpath=(.//*[@class='awardMaxCount'])[1]
${locator.ownerViewer.agreements[0].agreementID}                            xpath=(//*[contains(text(),'№')]/../../..//a)[1]
####################################    Selections
${locator.ownerViewer.lots[0].value.amount}                                xpath=(.//*[@class='data-amount'])[1]
${locator.ownerViewer.lots[0].minimalStep.amount}                          xpath=(.//*[@class='data-minimal_step'])[1]
${locator.ownerViewer.lots[0].title}                                       xpath=(.//h4[contains(text(),'Лоти')]//..//span)[1]
${locator.ownerViewer.items[0].description}                                xpath=(.//*[@class='item-description'])[1]
${locator.ownerViewer.items[0].quantity}                                   xpath=(.//*[@class='data-item-amount'])[1]
####################################    Milestones Locators
${locator.ownerViewer.milestones[0].title}                                  xpath=(//*[contains(text(),'Умови оплати')]/..//td[1])[1]
${locator.ownerViewer.milestones[0].code}                                   xpath=(//*[contains(text(),'Умови оплати')]/..//td[3])[1]
${locator.ownerViewer.milestones[0].duration.days}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[4])[1]
${locator.ownerViewer.milestones[0].duration.type}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[5])[1]
${locator.ownerViewer.milestones[0].percentage}                             xpath=(//*[contains(text(),'Умови оплати')]/..//td[6])[1]
${locator.ownerViewer.milestones[1].title}                                  xpath=(//*[contains(text(),'Умови оплати')]/..//td[1])[2]
${locator.ownerViewer.milestones[1].code}                                   xpath=(//*[contains(text(),'Умови оплати')]/..//td[3])[2]
${locator.ownerViewer.milestones[1].duration.days}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[4])[2]
${locator.ownerViewer.milestones[1].duration.type}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[5])[2]
${locator.ownerViewer.milestones[1].percentage}                             xpath=(//*[contains(text(),'Умови оплати')]/..//td[6])[2]
${locator.ownerViewer.milestones[2].title}                                  xpath=(//*[contains(text(),'Умови оплати')]/..//td[1])[3]
${locator.ownerViewer.milestones[2].code}                                   xpath=(//*[contains(text(),'Умови оплати')]/..//td[3])[3]
${locator.ownerViewer.milestones[2].duration.days}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[4])[3]
${locator.ownerViewer.milestones[2].duration.type}                          xpath=(//*[contains(text(),'Умови оплати')]/..//td[5])[3]
${locator.ownerViewer.milestones[2].percentage}                             xpath=(//*[contains(text(),'Умови оплати')]/..//td[6])[3]
${locator.provider.milestones[0].title}                                     xpath=(//*[@class='payment-cond-wrapper']//*[@class='ukr_version'])[1]
${locator.provider.milestones[0].code}                                      xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Тип оплати:')])[1]/../*[position() mod 2 = 0]
${locator.provider.milestones[0].duration.days}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[1]/../*[position() mod 2 = 0]
${locator.provider.milestones[0].duration.type}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[1]/../*[position() mod 2 = 0]
${locator.provider.milestones[0].percentage}                                xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Розмір оплати:')])[1]/../*[position() mod 2 = 0]
${locator.provider.milestones[1].title}                                     xpath=(//*[@class='payment-cond-wrapper']//*[@class='ukr_version'])[2]
${locator.provider.milestones[1].code}                                      xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Тип оплати:')])[2]/../*[position() mod 2 = 0]
${locator.provider.milestones[1].duration.days}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[2]/../*[position() mod 2 = 0]
${locator.provider.milestones[1].duration.type}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[2]/../*[position() mod 2 = 0]
${locator.provider.milestones[1].percentage}                                xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Розмір оплати:')])[2]/../*[position() mod 2 = 0]
${locator.provider.milestones[2].title}                                     xpath=(//*[@class='payment-cond-wrapper']//*[@class='ukr_version'])[3]
${locator.provider.milestones[2].code}                                      xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Тип оплати:')])[3]/../*[position() mod 2 = 0]
${locator.provider.milestones[2].duration.days}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[3]/../*[position() mod 2 = 0]
${locator.provider.milestones[2].duration.type}                             xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Період:')])[3]/../*[position() mod 2 = 0]
${locator.provider.milestones[2].percentage}                                xpath=(//*[@class='payment-cond-wrapper']//*[contains(text(),'Розмір оплати:')])[3]/../*[position() mod 2 = 0]
####################################    Complaint Locators
${locator.ownerViewer.bids[0].name}                                         xpath=(//*[@class='col-md-12']//span)[5]
${locator.ownerViewer.bids[0].description}                                  xpath=(//*[@class='col-md-12']//span)[5]
####################################    Qualifications Locators
${locator.ownerViewer.qualifications[0].status}                             xpath=(//*[@class='label label-warning'])[1]
${locator.ownerViewer.qualifications[1].status}                             xpath=(//*[@class='label label-warning'])[2]
${locator.ownerViewer.qualificationPeriod.endDate}                          xpath=(//td[@class="tenderPeriod"]//span)[3]
################################################################
####################################    Provider Tender Locators
${locator.provider.procuringEntity.address.countryName}                     xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Поштова адреса') or contains(text(),'Країна реєстрації')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.address.locality}                        xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Поштова адреса') or contains(text(),'Місто')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.address.postalCode}                      xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Поштова адреса') or contains(text(),'Індекс')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.address.region}                          xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Поштова адреса') or contains(text(),'Регіон')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.address.streetAddress}                   xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Поштова адреса') or contains(text(),'Вулиця')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.identifier.id}                           xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'ЄДРПОУ') or contains(text(),'Ідентифікатор ')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.identifier.legalName}                    xpath=(//*[contains(text(),'Інформація про замовника') or contains(text(),'Дані організації')]/../table)//*[contains(text(),'Ім') or contains(text(),'Повна юридична назва')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.identifier.legalName_en}                 xpath=(//*[contains(text(),'Назва англійською')]/..//*[position() mod 2 = 0])
${locator.provider.procuringEntity.contactPoint.name}                       xpath=(((//*[contains(text(),'Інформація про замовника')]/../table)[1])//*[contains(text(),'Поштова адреса')]/../*/parent::*//.//following-sibling::*/*/../td)[1]
${locator.provider.procuringEntity.contactPoint.telephone}                  xpath=((//*[contains(text(),'Інформація про замовника')]/../table)[1])//*[contains(text(),'Телефон')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.contactPoint.email}                      xpath=((//*[contains(text(),'Інформація про замовника')]/../table)[1])//*[contains(text(),'Ел. пошта')]/../*[position() mod 2 = 0]
${locator.provider.procuringEntity.contactPoint.url}                        xpath=((//*[contains(text(),'Інформація про замовника')]/../table)[1])//*[contains(text(),'Ел. пошта')]/../*[position() mod 2 = 0]
############  статусы Аварда  ############
${locator.provider.awards[0].status}                                        xpath=(//*[@class='winner'])
${locator.provider.awards[0].suppliers[0].name}                             xpath=((//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*/parent::*//.//following-sibling::*/*/../td)[1]
${locator.provider.awards[0].suppliers[0].contactPoint.telephone}           xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Телефон')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].contactPoint.email}               xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Ел. пошта')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].identifier.legalName}             xpath=((//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*/parent::*//.//following-sibling::*/*/../td)[1]
${locator.provider.awards[0].suppliers[0].identifier.id}                    xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Код ЄДРПОУ')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].documents[0].title}                            xpath=((//*[@class='winner']/../../..//*)[contains(text(),'Документи')]//../*//td/span)[1]
${locator.provider.awards[0].suppliers[0].address.countryName}              xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].address.locality}                 xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].address.postalCode}               xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].address.region}                   xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*[position() mod 2 = 0]
${locator.provider.awards[0].suppliers[0].address.streetAddress}            xpath=(//*[@class='winner']/../../..//*)[contains(text(),'Поштова адреса')]//../*[position() mod 2 = 0]
############  Selections  ############
${locator.provider.items[0].quantity}                                   xpath=(.//*[@class='item-amount'])[1]
${locator.provider.items[1].quantity}                                   xpath=(.//*[@class='item-amount'])[2]
${locator.provider.items[2].quantity}                                   xpath=(.//*[@class='item-amount'])[3]
${locator.provider.items[0].description}                                   xpath=(.//*[@class='wrappLots lots-price']//*[@class='ukr_version'])[1]
${locator.provider.items[1].description}                                   xpath=(.//*[@class='wrappLots lots-price']//*[@class='ukr_version'])[2]
${locator.provider.items[2].description}                                   xpath=(.//*[@class='wrappLots lots-price']//*[@class='ukr_version'])[3]
############  Доноры  ############
${locator.provider.funders[0].name}                                         xpath=(//*[contains(text(),'Донор:')]/..//*[position() mod 2 = 0]/a)
${locator.provider.funders[0].address.postalCode}                           xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.provider.funders[0].address.region}                               xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.provider.funders[0].address.streetAddress}                        xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.provider.funders[0].identifier.legalName}                         xpath=(.//*[@class='donorModalTable']//td[2])[3]
###################################################################
####################################    OwnerViewer Tender Locators
${locator.ownerViewer.procuringEntity.address.countryName}                  xpath=(.//*[@class='country'])[1]
${locator.ownerViewer.procuringEntity.address.locality}                     xpath=(.//*[@class='locality'])[1]
${locator.ownerViewer.procuringEntity.address.postalCode}                   xpath=(.//*[@class='postal_code'])[1]
${locator.ownerViewer.procuringEntity.address.region}                       xpath=(.//*[@class='region'])[1]
${locator.ownerViewer.procuringEntity.address.streetAddress}                xpath=(.//*[@class='street'])[1]
${locator.ownerViewer.causeDescription}                                     xpath=(.//*[@class='cause_description'])[1]
${locator.ownerViewer.cause}                                                xpath=(.//*[@class='cause'])[1]
${locator.ownerViewer.procuringEntity.contactPoint.name}                    xpath=(.//*[@class='contact_name'])[1]
${locator.ownerViewer.procuringEntity.contactPoint.telephone}               xpath=(.//*[@class='contact_phone'])[1]
${locator.ownerViewer.procuringEntity.contactPoint.email}                   xpath=(.//*[@class='contact_email'])[1]
${locator.ownerViewer.procuringEntity.contactPoint.url}                     xpath=(.//*[@class='contact_url'])[1]
${locator.ownerViewer.contactPoint.status}                                  xpath=(//*[@class='label label-info'])[1]
${locator.ownerViewer.contracts[0].status}                                  xpath=(//*[contains(text(),'Статус:')]/..//*[position() mod 2 = 0]/span)[1]
${locator.ownerViewer.contracts[1].status}                                  xpath=(//*[contains(text(),'Статус:')]/..//*[position() mod 2 = 0]/span)[1]
${locator.ownerViewer.agreements[0].status}                                 xpath=(//*[contains(text(),'Статус:')]/..//*[position() mod 2 = 0]/span)[1]
${locator.ownerViewer.agreements[1].status}                                 xpath=(//*[contains(text(),'Статус:')]/..//*[position() mod 2 = 0]/span)[1]
${locator.ownerViewer.contracts[0].value.amount}                            xpath=(.//*[@class='current_amount'])
${locator.ownerViewer.contracts[1].value.amount}                            xpath=(.//*[@class='current_amount'])
${locator.ownerViewer.contracts[0].value.amountNet}                         xpath=(//*[contains(text(),'Ціна договору без ПДВ:')]/..//*[position() mod 2 = 0]/p)[1]
${locator.ownerViewer.contracts[1].value.amountNet}                         xpath=(//*[contains(text(),'Ціна договору без ПДВ:')]/..//*[position() mod 2 = 0]/p)[1]
${locator.ownerViewer.contracts[0].dateSigned}                              xpath=(//*[contains(text(),'Дата підписання:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.contracts[1].dateSigned}                              xpath=(//*[contains(text(),'Дата підписання:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.contracts[0].period.startDate}                        xpath=(//*[contains(text(),'Початок дії договору:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.contracts[0].period.endDate}                          xpath=(//*[contains(text(),'Закінчення дії договору:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.procuringEntity.identifier.legalName}                 xpath=(//*[contains(text(),'Назва організації:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.procuringEntity.identifier.id}                        xpath=(//*[contains(text(),'Код ЄДРПОУ:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.documents[0].title}                                   xpath=(//*[contains(text(),'Документи')]/..//*[position() mod 2 = 0])[2]
${locator.ownerViewer.awards[0].status}                                     xpath=((.//*[contains(@class,'container')]//h4)//*[contains(@class,'label')])[1]
${locator.ownerViewer.awards[0].documents[0].title}                         xpath=((//*[text()[contains(.,'Документи рішення')]][. = 'Документи рішення']/..//*[position() mod 2 = 0])[2])//a
${locator.ownerViewer.awards[0].suppliers[0].address.countryName}           xpath=(.//*[@class='country'])[1]
${locator.ownerViewer.awards[0].suppliers[0].address.locality}              xpath=(.//*[@class='locality'])[1]
${locator.ownerViewer.awards[0].suppliers[0].address.postalCode}            xpath=(.//*[@class='postal_code'])[1]
${locator.ownerViewer.awards[0].suppliers[0].address.region}                xpath=(.//*[@class='region'])[1]
${locator.ownerViewer.awards[0].suppliers[0].address.streetAddress}         xpath=(.//*[@class='street'])[1]
${locator.ownerViewer.awards[0].suppliers[0].contactPoint.name}             xpath=((//*[contains(text(),'Контактна особа:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].contactPoint.telephone}        xpath=((//*[contains(text(),'Телефон контактної особи:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].contactPoint.email}            xpath=((//*[contains(text(),'Пошта контактної особи:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].contactPoint.url}              xpath=((//*[contains(text(),'Сайт контактної особи:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].identifier.legalName}          xpath=((//*[contains(text(),'Назва організації:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].identifier.id}                 xpath=((//*[contains(text(),'Код ЄДРПОУ:')])//../td)[1]
${locator.ownerViewer.awards[0].suppliers[0].name}                          xpath=(//*[contains(text(),'Назва організації:')]/..//*[position() mod 2 = 0])
${locator.ownerViewer.awards[0].value.valueAddedTaxIncluded}                xpath=(//*[contains(text(),'Запропонована ціна:')]/..//*[position() mod 2 = 0])/p
${locator.ownerViewer.awards[0].value.currency}                             xpath=(//*[contains(text(),'Запропонована ціна:')]/..//*[position() mod 2 = 0])/p
${locator.ownerViewer.awards[0].value.amount}                               xpath=(//*[contains(text(),'Запропонована ціна:')]/..//*[position() mod 2 = 0])/p
${locator.ownerViewer.items[0].unit.code}                                   xpath=(.//*[@class='data-item-amount-code'])[1]
${locator.ownerViewer.items[1].unit.code}                                   xpath=(.//*[@class='data-item-amount-code'])[2]
${locator.ownerViewer.items[2].unit.code}                                   xpath=(.//*[@class='data-item-amount-code'])[3]
############  Доноры
${locator.ownerViewer.funders[0].name}                                      xpath=(//*[contains(text(),'Донор:')]/..//*[position() mod 2 = 0]/a)
${locator.ownerViewer.funders[0].address.postalCode}                        xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.ownerViewer.funders[0].address.region}                            xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.ownerViewer.funders[0].address.locality}                            xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.ownerViewer.funders[0].address.streetAddress}                     xpath=(.//*[@class='donorModalTable']//td[2])[2]
${locator.ownerViewer.funders[0].identifier.legalName}                      xpath=(.//*[@class='donorModalTable']//td[2])[3]
#####################################################################
####################################    OwnerViewer Planning Locators
${locator.planningOwnerViewer.planId}                                       xpath=(//*[contains(text(),'Ідентифікаційний номер')]/..//*[position() mod 2 = 0])
${locator.planningOwnerViewer.status}                                       xpath=(//*[contains(text(),'Статус')]/..//*[position() mod 2 = 0])/span
${locator.planningOwnerViewer.tender.procurementMethodType}                 xpath=(//*[contains(text(),'Процедура закупівлі')]/..//*[position() mod 2 = 0])
${locator.planningOwnerViewer.procuringEntity.name}                         xpath=(//*[contains(text(),'Назва організації')]/..//*[position() mod 2 = 0])[1]
${locator.planningOwnerViewer.procuringEntity.identifier.id}                xpath=(//*[contains(text(),'Код ЄДРПОУ')]/..//*[position() mod 2 = 0])[1]
${locator.planningOwnerViewer.procuringEntity.identifier.legalName}         xpath=(//*[contains(text(),'Назва організації')]/..//*[position() mod 2 = 0])[1]
${locator.planningOwnerViewer.classification.description}                   xpath=((.//*[contains(text(),'Інформація про план')])[1]//..//*[contains(text(),'Код')]/../*[position() mod 2 = 0])[1]
${locator.planningOwnerViewer.classification.scheme}                        xpath=((.//*[contains(text(),'Інформація про план')])[1]//..//*[contains(text(),'Код')])[1]
${locator.planningOwnerViewer.classification.id}                            xpath=((.//*[contains(text(),'Інформація про план')])[1]//..//*[contains(text(),'Код')]/../*[position() mod 2 = 0])[1]
${locator.planningOwnerViewer.budget.amount}                                xpath=(//*[contains(text(),'Планована сума закупівлі')]/..//*[position() mod 2 = 0])//*[@class='amountValue']
${locator.planningOwnerViewer.budget.description}                           xpath=.//*[@class='plan-name']
${locator.planningOwnerViewer.budget.currency}                              xpath=(//*[text()[contains(.,'Планована сума закупівлі')]]/..//*[@class='ifua'])
${locator.planningOwnerViewer.items[0].description}                         xpath=(//*[@class='item-name-general'])[1]
${locator.planningOwnerViewer.items[0].quantity}                            xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[1]
${locator.planningOwnerViewer.items[0].unit.name}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[1]
${locator.planningOwnerViewer.items[0].unit.code}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[1]
${locator.planningOwnerViewer.items[0].deliveryDate.endDate}                xpath=((//*[text()[contains(.,'Кінцева дата доставки')]]/../*[position() mod 2 = 0]))[1]
${locator.planningOwnerViewer.items[0].classification.description}          xpath=((.//*[contains(text(),'Предмет закупівлі')])[1]//..//*[@class='data-item-classifier-desc'])[1]
${locator.planningOwnerViewer.items[0].classification.scheme}               xpath=((.//*[contains(text(),'Предмет закупівлі')])[1]//..//*[@class='label-plan-text'])[3]
${locator.planningOwnerViewer.items[0].classification.id}                   xpath=((.//*[contains(text(),'Предмет закупівлі')])[1]//..//*[@class='data-item-classifier-code'])[1]
${locator.planningOwnerViewer.items[1].description}                         xpath=(//*[@class='item-name-general'])[2]
${locator.planningOwnerViewer.items[1].quantity}                            xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[1].unit.name}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[1].unit.code}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[1].deliveryDate.endDate}                xpath=((//*[text()[contains(.,'Кінцева дата доставки')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[1].classification.description}          xpath=((.//*[contains(text(),'Предмет закупівлі')])[2]//..//*[@class='data-item-classifier-desc'])[1]
${locator.planningOwnerViewer.items[1].classification.scheme}               xpath=((.//*[contains(text(),'Предмет закупівлі')])[2]//..//*[@class='label-plan-text'])[3]
${locator.planningOwnerViewer.items[1].classification.id}                   xpath=((.//*[contains(text(),'Предмет закупівлі')])[2]//..//*[@class='data-item-classifier-code'])[1]
${locator.planningOwnerViewer.items[2].description}                         xpath=(//*[@class='item-name-general'])[3]
${locator.planningOwnerViewer.items[2].quantity}                            xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[3]
${locator.planningOwnerViewer.items[2].unit.name}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[3]
${locator.planningOwnerViewer.items[2].unit.code}                           xpath=((//*[text()[contains(.,'Кількість')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[2].deliveryDate.endDate}                xpath=((//*[text()[contains(.,'Кінцева дата доставки')]]/../*[position() mod 2 = 0]))[2]
${locator.planningOwnerViewer.items[2].classification.description}          xpath=((.//*[contains(text(),'Предмет закупівлі')])[3]//..//*[@class='data-item-classifier-desc'])[1]
${locator.planningOwnerViewer.items[2].classification.scheme}               xpath=((.//*[contains(text(),'Предмет закупівлі')])[3]//..//*[@class='label-plan-text'])[3]
${locator.planningOwnerViewer.items[2].classification.id}                   xpath=((.//*[contains(text(),'Предмет закупівлі')])[3]//..//*[@class='data-item-classifier-code'])[1]
${locator.planningOwnerViewer.tender.tenderPeriod.startDate}                xpath=(//*[text()[contains(.,'Дата публікації')]]/../*[position() mod 2 = 0])

*** Keywords ***
############################################################################################################
######################################    CUSTOM KEYWORDS   ################################################
############################################################################################################
ClearFildAndInputText
  [Arguments]  ${elementLocator}  ${elementText}
  Wait Until Element Is Visible   ${elementLocator}   5
  Clear Element Text              ${elementLocator}
  Input Text                      ${elementLocator}   ${elementText}

WaitVisibilityAndClickElement
  [Arguments]  ${elementLocator}
  Wait Until Element Is Visible   ${elementLocator}   5
  Click Element                   ${elementLocator}
  Sleep  1

ScrollToAndClickElement
  [Arguments]  ${elementLocator}
  Sleep  1
  Execute Javascript  window.document.evaluate("${elementLocator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Sleep  1
  Click Element                   ${elementLocator}

ScrollToElement
  [Arguments]  ${elementLocator}
  Execute Javascript  window.document.evaluate("${elementLocator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Sleep  1

ScrollToElementToFalse
  [Arguments]  ${elementLocator}
  Execute Javascript  window.document.evaluate("${elementLocator}", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(false);
  Sleep  1

DismissAlertPopUp
  WaitVisibilityAndClickElement               xpath=//*[@type='submit']
  Sleep  2
  Dismiss Alert
  Sleep  5

Переміститься до футера
  Sleep  1
  ScrollToElementToFalse                    (//*[contains(text(),'З 8 до 18')])[1]

Переміститься до хедера
  Sleep  1
  Run Keyword IF   '${ROLE}' == 'provider' or '${ROLE}' == 'provider1' or '${ROLE}' == 'provider2'
  ...   ScrollToElementToFalse                         (.//*[@class='TenderType'])[1]
  ...    ELSE IF   '${ROLE}' != 'provider' or '${ROLE}' != 'provider1' or '${ROLE}' != 'provider2'
  ...   ScrollToElementToFalse                         (.//*[contains(@class,'breadcrumb_link') or contains(text(),'Редагування')])[1]

Заповнити поля регіону доставки першого предмета
  [Arguments]  ${index_0}
  ScrollToElementToFalse           (.//*[contains(text(),'Поштова адреса')])[1]
  Sleep  1
  Run Keyword if   'Можливість змінити дату закінчення періоду подання пропозиції на 10 днів' == '${TEST_NAME.replace('\'', '')}'
  ...   WaitVisibilityAndClickElement     xpath=(.//*[@name='lots[0][items][${index_0}][same_delivery_address]'])[2]
  WaitVisibilityAndClickElement           xpath=(.//*[@name='lots[0][items][${index_0}][same_delivery_address]'])[2]
  Sleep  1
  Select From List           xpath=(//*[@name='lots[0][items][${index_0}][region_id]'])[3]           ${regionDeliveryGlobal_1}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_0}][postal_code]'])[2]         ${postalCodeDeliveryGlobal_1}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_0}][locality]'])[2]            ${localityDeliveryGlobal_1}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_0}][delivery_address]'])[2]    ${streetAddressDeliveryGlobal_1}

Заповнити поля регіону доставки другого предмета
  [Arguments]  ${index_1}
  ScrollToElementToFalse           (.//*[contains(text(),'Поштова адреса')])[2]
  Sleep  1
  Select From List           xpath=(//*[@name='lots[0][items][${index_1}][region_id]'])[3]           ${regionDeliveryGlobal_2}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_1}][postal_code]'])[2]         ${postalCodeDeliveryGlobal_2}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_1}][locality]'])[2]            ${localityDeliveryGlobal_2}
  ClearFildAndInputText      xpath=(//*[@name='lots[0][items][${index_1}][delivery_address]'])[2]    ${streetAddressDeliveryGlobal_2}

############################################################################################################

Підготувати клієнт для користувача
  [Arguments]  ${username}
  ${chrome_options}=    Evaluate   sys.modules['selenium.webdriver'].ChromeOptions()    sys
  Call Method    ${chrome_options}    add_argument    --disable-notifications
  Call Method    ${chrome_options}  add_argument    --allow-running-insecure-content
  Call Method    ${chrome_options}  add_argument    --disable-web-security
  Call Method    ${chrome_options}  add_argument    --nativeEvents\=false
  # Create Webdriver    Chrome    chrome_options=${chrome_options}
  Set Global Variable   ${BROWSER_ALIAS_USERNAME}   ${username}
  Open Browser   ${USERS.users['${username}'].homepage}   ${USERS.users['${username}'].browser}   alias=${BROWSER_ALIAS_USERNAME}
  Set Window Size       @{USERS.users['${username}'].size}
  Set Window Position   @{USERS.users['${username}'].position}
  ############   Login
  # maximize browser window
  Delete All Cookies
  WaitVisibilityAndClickElement      xpath=(//*[text()[contains(.,'Вхід')]])[1]
  Wait Until Page Contains Element   name=email
  Input Text                         name=email      ${USERS.users['${username}'].login}
  Input Text                         name=password   ${USERS.users['${username}'].password}
  WaitVisibilityAndClickElement      xpath=//input[contains(@class, 'btn btn-success zak-log-btn')]

######################################    Tender operations    ################################################
Підготувати дані для оголошення тендера
  [Arguments]  ${username}  ${tender_data}  ${role_name}
  ${addressStatus}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data.procuringEntity.address}  locality
  ${adaptedData}=    Run Keyword IF   '${addressStatus}' == 'False' and '${ROLE}' != 'provider' and '${ROLE}' != 'provider1' and '${ROLE}' != 'provider2'    adapt_plan_data  ${tender_data.data}
  ...   ELSE IF   '${addressStatus}' != 'False' and '${ROLE}' != 'provider' and '${ROLE}' != 'provider1' and '${ROLE}' != 'provider2'   adapt_tender_data  ${tender_data.data}
  [Return]    ${tender_data}
###############################################################
####                TODO  раскомментировать                ####
###############################################################
Завантажити документ
  [Arguments]  ${username}  ${filepath}  ${tender_uaid}
  WaitVisibilityAndClickElement               xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  Sleep  1
  Execute Javascript  window.document.evaluate("//*[@id='edit-form-submit']//h3[3]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Execute Javascript  window.frames[0]; document.querySelector( "input[name='tender[files][]']" ).style.display = "block";
  Sleep  1
  Choose File       name=tender[files][]        ${filepath}
  Sleep  3
  Run Keyword If   '${mode}' != 'negotiation'    Run Keywords
  ...   uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  ...   AND   Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[@name='lots[0][items][1][same_delivery_address]'])[1]
  Run Keyword If   '${mode}' == 'negotiation'    Run Keywords
  ...   uatenders.Заповнити поля регіону доставки першого предмета  ${1}
  ...   AND   uatenders.Заповнити поля регіону доставки другого предмета  ${0}
  uatenders.DismissAlertPopUp

Отримати інформацію із документа
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}  ${field}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword if   'заголовку документації до всіх лотів' in '${TEST_NAME.replace('\'', '')}'
  ...   WaitVisibilityAndClickElement       xpath=(//*[text()[contains(.,'Лоти')]]/..//*[. = 'Лоти']/..//*[text()[contains(.,'Документація по лоту')]])
  Run Keyword if   'Відображення заголовку документа' == '${TEST_NAME.replace('\'', '')}' or 'Відображення привязки документа до тендера' == '${TEST_NAME.replace('\'', '')}'   Run Keywords
  ...   WaitVisibilityAndClickElement            xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  ...   AND   WaitVisibilityAndClickElement      xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ...   AND   Sleep  10
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  uatenders.Оновити сторінку з тендером  ${username}  ${tender_uaid}
  uatenders.Переміститься до футера
  Sleep  3
  Run Keyword And Return If   '${field}' == 'documentOf'    Get Element Attribute    xpath=(//*[contains(text(),'${doc_id}')]//../span)@value
  Run Keyword And Return If   '${field}' != 'documentOf'    Get Text                 xpath=//a[contains(text(),'${doc_id}')]

Отримати документ
  [Arguments]  ${username}  ${tender_uaid}  ${doc_id}
  Run Keyword if   'Відображення заголовку документа' == '${TEST_NAME.replace('\'', '')}'    Run Keywords
  ...    WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  ...    AND   WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ...    AND   Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ${file_name}=                    Get Text                   xpath=//a[contains(text(),'${doc_id}')]
  ${url}=                     Get Element Attribute           xpath=//a[contains(text(),'${doc_id}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}

######################################    СТВОРЕННЯ ПЛАНу    ################################################
Створити план
  [Arguments]  ${username}  ${tender_data}
  ${filepath}=                   get_file_path
  ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${tender_data.data}  items
  @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
  ${legalNameProcuringEntity}=         Get From Dictionary         ${tender_data.data.procuringEntity.identifier}    legalName
  ${nameProjectBudget}=                Get From Dictionary         ${tender_data.data.budget.project}                name
  ${descriptionBudget}=                Get From Dictionary         ${tender_data.data.budget}                        description
  ${budget}=                           Get From Dictionary         ${tender_data.data.budget}                        amount
  ${amountBudget}=                     float_to_string_2f          ${budget}
  ${classificationID}=                 Get From Dictionary         ${tender_data.data.classification}                id
  ${classificationIDItems}=            Get From Dictionary         ${items[0].classification}                        id
  ${methodType}=                       Get From Dictionary         ${tender_data.data.tender}          procurementMethodType
  #Конвертируем русское имя Типа процедуры на англ
  ${methodType}=            convert_uatenders_string_to_common_string        ${methodType}
  WaitVisibilityAndClickElement       xpath=(.//*[@class='dropdown-toggle']/span)[2]
  WaitVisibilityAndClickElement       xpath=(.//*[@class='dropdown-menu']//a[contains(.,'Створити рядок плану зукіпівлі')])[1]
  uatenders.Вибір типу процедури   ${methodType}  ${tender_data}
  Input Text                          name=name                          ${legalNameProcuringEntity}
  Input Text                          name=identifier                    31648966
  Input Text                          name=description                   ${descriptionBudget}
  Input Text                          name=notes                         ${nameProjectBudget}
  Input Text                          name=amount                        ${amountBudget}
  WaitVisibilityAndClickElement       name=start_date
  WaitVisibilityAndClickElement       name=end_date                      #${endDateBudget}
  ${tenderPeriodStartDate}=    Convert Date         ${tender_data.data.tender.tenderPeriod.startDate}         result_format=%m.%Y
  Input Text                          name=tender_date_start             ${tenderPeriodStartDate}
  Input Text                          name=code                          ${classificationID}    #24910000-6
  WaitVisibilityAndClickElement       xpath=(.//*[contains(text(),'${classificationID}')])[1]
  Input Text                          name=code_kekv[]                   241
  WaitVisibilityAndClickElement       xpath=(.//*[contains(text(),'241')])[last()]
  Sleep  2
  Choose File                         name=plan[files][]                 ${filepath}
  Sleep  2
  WaitVisibilityAndClickElement       xpath=(//*[contains(text(),'Додати джерело фінансуванн')])
  Sleep  2
  Input Text                          name=breakdown[0][amount]               199
  Input Text                          name=breakdown[0][description]          Опис джерела фінансування
  #Заповнити предмети закупівлі
  uatenders.Додати предмети закупівлі в план  ${items}  #${type}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@value,'Зберегти як чернетку')])[1]
  Sleep  2
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement       xpath=(.//*[@id='plans-list']//td[3]/a)[1]
  uatenders.Підписати ЕЦП   ${username}   ${tender_data}
  uatenders.Дочикатися появи айди тендера plan_uaid  ${username}
  Run Keyword And Return    Отримати текст плана із поля                     planId

Додати предмети закупівлі в план
  [Arguments]  ${items}  #${type}
  ${items_count}=  Get Length  ${items}
  ${items_count_lib}=  get_minus_Index  ${items_count}
  : FOR  ${index}  IN RANGE  ${items_count}  #${item_block_count}
  \  WaitVisibilityAndClickElement   xpath=(.//*[contains(@class,'add-item-section-plan')])[1]
  \  Input Text                          name=items[${index+1}][description]              ${items[${index}].description}
  \  ${quantityItems}=                   Convert To String                                ${items[${index}].quantity}
  \  Input Text                          name=items[${index+1}][quantity]                 ${quantityItems}
  \  ${deliveryEndDate}=  Convert Date   ${items[${index}].deliveryDate.endDate}          result_format=%d.%m.%Y
  \  Input Text                          name=items[${index+1}][delivery_end_date]        ${deliveryEndDate}
  \  Select From List                    name=items[${index+1}][unit_id]    ${items[${index}].unit.name}
  \  Input Text                          name=items[${index+1}][cpv]                      ${items[${index}].classification.id}      #24910000-6     #${classificationID}
  \  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'ui-menu-item')])[last()]

######################################    СТВОРЕННЯ ТЕНДЕРУ    ################################################
Створити тендер
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_data
  # Создание черновика тендера со статусом ЧЕРНЕТКА
  uatenders.Створити чернетку тендера  ${ARGUMENTS[0]}  ${ARGUMENTS[1]}
  # Возможность дождаться кнопки [Опублікувати] из-за 2х факторной факторизации
  uatenders.Дочикатися появи кнопки Опублікувати  ${ARGUMENTS[0]}
  #pop-up window
  Run Keyword And Ignore Error            WaitVisibilityAndClickElement       xpath=(//*[@class='btn btn-primary text-center'])
  # Возможность дождаться получения АЙДИ тендера
  uatenders.Дочикатися появи айди тендера tender_uaid  ${ARGUMENTS[0]}
  Run Keyword And Return    Отримати текст із поля для замовника                     tenderId

#######################################################
#  Создать черновик тендера, со статусом Чернетка
#######################################################
Створити чернетку тендера
  [Arguments]   ${username}  ${tender_data}
  ${procurementMethodType}=   Set Variable If  '${mode}' == 'single' or '${mode}' == 'belowThreshold'  belowThreshold  ${tender_data.data.procurementMethodType}
#####################
#Додати закупівлю
  WaitVisibilityAndClickElement       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/a
  WaitVisibilityAndClickElement       xpath=//*[@id="bs-example-navbar-collapse-1"]/ul[1]/li[1]/ul/li[1]/a
  # Выбрать Тип предмету закупівлі
  uatenders.Вибір типу процедури   ${procurementMethodType}  ${tender_data}
  # Выбрать План
  ScrollToElementToFalse                    (.//h2[@class='inline'])
  WaitVisibilityAndClickElement       xpath=(.//*[@id='plan_id'])
  WaitVisibilityAndClickElement       xpath=(.//*[@id='plan_id']/*)[2]
  Input Text                          name=title                                                     ${tender_data.data.title}
  # Выбрать ТИП процедуры по созданию тендера
  Run Keyword IF   '${tender_data.data.mainProcurementCategory}' == 'goods'      Select From List by Value   xpath=//select[@name='procurement_type_id']   2   #Закупівля товорыв
  ...    ELSE IF   '${tender_data.data.mainProcurementCategory}' == 'services'   Select From List by Value   xpath=//select[@name='procurement_type_id']   3    #Закупівля послуг
  Input Text                          name=description                                               ${tender_data.data.description}
  Run Keyword IF    '${procurementMethodType}' != 'esco'    Run Keyword
  ...   Run Keyword IF    '${tender_data.data.value.valueAddedTaxIncluded}' == 'True'   Click Element    name=tax_included
#####   Додати донора
  ${statusFunders}=    Run Keyword And Return Status    Get From Dictionary    ${tender_data.data}    funders
  Run Keyword IF    '${statusFunders}' == 'True'    uatenders.Додати донора до тендеру    ${username}  ${tender_data}
  ${presence}=    Run Keyword And Return Status    Get From Dictionary    ${tender_data.data}    items
  @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${tender_data.data}  items
  Run Keyword If    '${NUMBER_OF_ITEMS}' == '1'
  ...   uatenders.Сформувати глобальні змінні по ОДНОМУ предмету    ${items[0]}
  Run Keyword If    '${NUMBER_OF_ITEMS}' == '2'
  ...   uatenders.Сформувати глобальні змінні по ДВОХ предметах    ${items[0]}  ${items[1]}
#####################
  # Процедуры в которых нет features
  ${mode}=   Set Variable If
  ...   '${procurementMethodType}' == 'negotiation'             negotiation
  ...   '${procurementMethodType}' == 'negotiation.quick'       negotiation.quick
  ...   '${procurementMethodType}' == 'reporting'               reporting
# Создание тендера с одним \ много - лотами
  Run Keyword IF    '${NUMBER_OF_LOTS}' == '1' or '${NUMBER_OF_LOTS}' == '0'      Run Keyword
  ...   uatenders.Можливість додати лот до тендеру            ${tender_data}  ${procurementMethodType}  ${mode}
  ...     ELSE IF   '${NUMBER_OF_LOTS}' == '2'      Run Keyword
  ...   uatenders.Можливість додати багато лотів до тендеру   ${tender_data}  ${procurementMethodType}  ${mode}
  uatenders.Переміститься до футера
  uatenders.DismissAlertPopUp

Сформувати глобальні змінні по ОДНОМУ предмету
  [Arguments]    ${item_1}
  ${lotRegionName_1}=                 Get From Dictionary              ${item_1.deliveryAddress}     region
  ${lotRegionId_1}=                   get_region_delivery_id           ${lotRegionName_1}
  # item == 1
  Set Global Variable   ${regionDeliveryGlobal_1}          ${lotRegionId_1}
  Set Global Variable   ${postalCodeDeliveryGlobal_1}      ${item_1.deliveryAddress.postalCode}
  Set Global Variable   ${localityDeliveryGlobal_1}        ${item_1.deliveryAddress.locality}
  Set Global Variable   ${streetAddressDeliveryGlobal_1}   ${item_1.deliveryAddress.streetAddress}

Сформувати глобальні змінні по ДВОХ предметах
  [Arguments]    ${item_1}  ${item_2}
  ${lotRegionName_1}=                 Get From Dictionary              ${item_1.deliveryAddress}     region
  ${lotRegionName_2}=                 Get From Dictionary              ${item_2.deliveryAddress}     region
  ${lotRegionId_1}=                   get_region_delivery_id           ${lotRegionName_1}
  ${lotRegionId_2}=                   get_region_delivery_id           ${lotRegionName_2}
  # item == 1
  Set Global Variable   ${regionDeliveryGlobal_1}          ${lotRegionId_1}
  Set Global Variable   ${postalCodeDeliveryGlobal_1}      ${item_1.deliveryAddress.postalCode}
  Set Global Variable   ${localityDeliveryGlobal_1}        ${item_1.deliveryAddress.locality}
  Set Global Variable   ${streetAddressDeliveryGlobal_1}   ${item_1.deliveryAddress.streetAddress}
  # item == 2
  Set Global Variable   ${regionDeliveryGlobal_2}          ${lotRegionId_2}
  Set Global Variable   ${postalCodeDeliveryGlobal_2}      ${item_2.deliveryAddress.postalCode}
  Set Global Variable   ${localityDeliveryGlobal_2}        ${item_2.deliveryAddress.locality}
  Set Global Variable   ${streetAddressDeliveryGlobal_2}   ${item_2.deliveryAddress.streetAddress}

Додати донора до тендеру
  [Arguments]   ${username}  ${tender_data}
  WaitVisibilityAndClickElement    name=donor_checkbox
  Run Keyword IF    'Глобальний фонд' == '${tender_data.data.funders[0].name}'
  ...   Select From List    name=donor_select    2
  Run Keyword IF    'Світовий Банк' == '${tender_data.data.funders[0].name}'
  ...   Select From List    name=donor_select    1

#######################################################
#  Выбрать ТИП процедуры по созданию тендера
#######################################################
Вибір типу процедури
  [Arguments]   ${methodType}  ${tender_uaid}
  Run Keyword IF   '${methodType}' == 'aboveThresholdEU' or '${methodType}' == 'openeu'             Run Keywords
  ...   Select From List                 xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       3    #Відкриті торги з публікацією англійською мовою
  ...   AND     Run Keyword And Ignore Error   Input Text               name=title_en                                    ${tender_uaid.data.title_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=description_en                              ${tender_uaid.data.description_en}
  ...   AND     Run Keyword And Ignore Error   Input Text   name=contact_name_en          ${tender_uaid.data.procuringEntity.name_en}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...      ELSE IF   '${methodType}' == 'belowThreshold'           Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       1    #Допорогова закупівля
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані поля для процедури belowThreshold    ${tender_uaid}
  ...      ELSE IF   '${methodType}' == 'aboveThresholdUA' or '${methodType}' == 'openua'         Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       2    #Відкриті торги
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO   ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...      ELSE IF   '${methodType}' == 'reporting'                Run Keyword
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       4    #Звіт про укладений договір
  ...      ELSE IF   '${methodType}' == 'negotiation'              Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       5    #Переговорна процедура
  ...   AND   Run Keyword if   'Можливість створити план закупівлі' != '${TEST_NAME}'   uatenders.Дані поля для процедури negotiation   ${tender_uaid}
  ...      ELSE IF   '${methodType}' == 'negotiation.quick'        Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       6    #Переговорна процедура скорочена
  ...   AND     uatenders.Дані поля для процедури negotiation       ${tender_uaid}
  ...      ELSE IF   '${methodType}' == 'aboveThresholdUA.defense' or '${methodType}' == 'openua_defense'        Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       8    #Переговорна процедура для потреб оборони
  ...   AND     Run Keyword And Ignore Error   Input Text               name=title_en                                    ${tender_uaid.data.title_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=description_en                              ${tender_uaid.data.description_en}
  ...   AND     Run Keyword And Ignore Error   Input Text   name=contact_name_en          ${tender_uaid.data.procuringEntity.name_en}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...      ELSE IF   '${methodType}' == 'competitiveDialogueUA' or '${methodType}' == 'openua_defense' or '${methodType}' =='aboveThresholdUA.defense'    Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       9    #Конкурентний діалог
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...      ELSE IF   '${methodType}' == 'competitiveDialogueEU' or '${methodType}' == 'open_competitive_dialogue'    Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       10   #Конкурентний діалог з публікацією англійською мовою
  ...   AND     Run Keyword And Ignore Error   Input Text               name=title_en                                    ${tender_uaid.data.title_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=description_en                              ${tender_uaid.data.description_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=contact_name_en                             ${tender_uaid.data.procuringEntity.name_en}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...      ELSE IF   '${methodType}' == 'esco' or '${methodType}' == 'open_esco'    Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       13   #Закупівля енергосервісу (ESCO)
  ...   AND     Run Keyword And Ignore Error   Input Text               name=title_en                                    ${tender_uaid.data.title_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=description_en                              ${tender_uaid.data.description_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=contact_name_en                             ${tender_uaid.data.procuringEntity.name_en}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані відсотків по ESCO    ${tender_uaid}
  ...      ELSE IF   '${methodType}' == 'closeFrameworkAgreementUA' or '${methodType}' == 'open_framework'    Run Keywords
  ...      Select From List              xpath=//select[contains(@id,'procedure_types_id') or contains(@name,'procedure_id')]       14   #Рамки
  ...   AND     Run Keyword And Ignore Error   Input Text               name=title_en                                    ${tender_uaid.data.title_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=description_en                              ${tender_uaid.data.description_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=contact_name_en                             ${tender_uaid.data.procuringEntity.name_en}
  ...   AND     Run Keyword And Ignore Error   Input Text               name=max_awards_count                            ${tender_uaid.data.maxAwardsCount}
  ...   AND     Run Keyword And Ignore Error   uatenders.Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO    ${tender_uaid}  #${end_receive_offers_for_aboveThresholdEU}

Додати цінову пропозицію до reporting
  [Arguments]   ${tender_uaid}
  ${budget}=                       float_to_string_2f         ${tender_uaid.data.value.amount}
  Input Text                          name=amount              ${budget}

Дані відсотків по ESCO
  [Arguments]   ${tender_uaid}
  ${fundingKind}=                        Get From Dictionary      ${tender_uaid.data}    fundingKind
  ${NBUdiscountRate}=                    Evaluate      ${tender_uaid.data.NBUdiscountRate}*${100}
  ${yearlyPaymentsPercentageRange}=      Evaluate      ${tender_uaid.data.lots[0].yearlyPaymentsPercentageRange}*${100}
  ${NBUdiscountRate}=                    Convert To String      ${NBUdiscountRate}
  ${yearlyPaymentsPercentageRange}=      Convert To String      ${yearlyPaymentsPercentageRange}
  Input Text               name=nbu_discount_rate                ${NBUdiscountRate}
  Run Keyword IF    '${fundingKind}' == 'budget'    Input Text          name=yearly_payment_percentage       ${yearlyPaymentsPercentageRange}
  ...   ELSE IF     '${fundingKind}' != 'budget'    Select From List    xpath=(.//*[@name='funding_kind'])   1   #other

Дані часу для процедури aboveThresholdEU/UA/competitiveDialogueEU/UA/ESCO
  [Arguments]   ${tender_uaid}
  ${tenderEndDate}=   convert_enquiry_tenderPeriod    ${tender_uaid.data.tenderPeriod.endDate}
  Input Text        name=tender_end_date                 ${tenderEndDate}
  Run Keyword IF   '${MODE}' == 'open_framework'   uatenders.Дані часу для процедури framework  ${tender_uaid}

Дані часу для процедури framework
  [Arguments]   ${tender_uaid}
  ${matches}=   Get Regexp Matches  ${tender_uaid.data.agreementDuration}  \\d+
  ${year}=      Set Variable If  ${matches[0]} > 0  ${matches[0]}  ${EMPTY}
  ${month}=     Set Variable If  ${matches[1]} > 0  ${matches[1]}  ${EMPTY}
  ${day}=       Set Variable If  ${matches[2]} > 0  ${matches[2]}  ${EMPTY}
  Input Text        name=ag_years                 ${year}
  Input Text        name=ag_month                 ${month}
  Input Text        name=ag_days                  ${day}
  # ${hour}=      Set Variable If  ${matches[3]} > 0  ${matches[3]}  ${EMPTY}
  # ${minute}=    Set Variable If  ${matches[4]} > 0  ${matches[4]}  ${EMPTY}
  # ${second}=    Set Variable If  ${matches[5]} > 0  ${matches[5]}  ${EMPTY}
  # Input Text        name=ag_hours                 ${hour}
  # Input Text        name=ag_minutes               ${minute}
  # Input Text        name=ag_seconds               ${second}
  Input Text        name=ag_hours                 0
  Input Text        name=ag_minutes               0
  Input Text        name=ag_seconds               0

Дані поля для процедури negotiation
  [Arguments]   ${tender_uaid}
  ${cause}=                             Get From Dictionary                            ${tender_uaid.data}          cause
  ${cause}=                                 get_unit_id                                ${cause}
  ${causeDescription}=                  Get From Dictionary                            ${tender_uaid.data}          causeDescription
  ${amount}=                            Get From Dictionary                            ${tender_uaid.data.value}    amount
  ${amount}=                            float_to_string_2f                             ${amount}
  Select From List                 xpath=//*[@id="cause_select"]                       ${cause}
  Input Text                       name=cause_description                              ${causeDescription}

Дані поля для процедури belowThreshold
  [Arguments]   ${tender_uaid}
  ${enquireEndDate}=  convert_enquiry_tenderPeriod    ${tender_uaid.data.enquiryPeriod.endDate}
  ${tenderEndDate}=   convert_enquiry_tenderPeriod    ${tender_uaid.data.tenderPeriod.endDate}
  Input Text        name=enquiry_end_date                ${enquireEndDate}
  Input Text        name=tender_end_date                 ${tenderEndDate}

#######################################################
# Создание тендера с одним \ много - лотами
#######################################################
Можливість додати лот до тендеру
  [Arguments]  ${tender_data}  ${methodType}  ${mode}
  ${scenarios_name}=  get_scenarios_name
  ${scenarios_name_1}=    Fetch From Right    ${scenarios_name}    /
  ${scenarios_name_2}=    Fetch From Left    ${scenarios_name_1}   .
  #  для процедуры reporting ${NUMBER_OF_LOTS} == 0
  ${LOTS_NUM}=  Run Keyword If
  ...   '${NUMBER_OF_LOTS}' == '0'   Set Variable   1
  ...   ELSE IF   '${NUMBER_OF_LOTS}' != '0'   Set Variable   ${NUMBER_OF_LOTS}
  ${milestonesStatus}=    Run Keyword And Return Status    Get From Dictionary    ${tender_data.data}     milestones
  :FOR   ${lot_index}   IN RANGE   ${LOTS_NUM}
  \  uatenders.Завантажити документ до створення 'Нової закупівлі' - тендер        ${tender_data}
  \  Run Keyword IF   '${TENDER_MEAT}' == 'True'
  \  ...    uatenders.Можливість заповнити Tender info   ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \  Run Keyword IF   'single_item_tender' == '${scenarios_name_2}' and '${LOT_MEAT}' == 'False' and '${methodType}' != 'reporting'
  \  ...    uatenders.Можливість заповнити безлотовий Lots info     ${tender_data}  ${methodType}  ${mode}
  \  Run Keyword IF   'single_item_tender' != '${scenarios_name_2}' and '${LOT_MEAT}' == 'True' and '${methodType}' != 'reporting'
  \  ...    uatenders.Можливість заповнити Lots info          ${tender_data}  ${methodType}   ${mode}        ${lot_index}
  \  Run Keyword IF   'single_item_tender' != '${scenarios_name_2}' and '${methodType}' != 'reporting'
  \  ...    uatenders.Можливість в тендері заповнити поля роздiлу ЛОТИ                     ${tender_data}  ${lot_index}  #lot
  \  Run Keyword IF   '${milestonesStatus}' == 'True'
  \  ...    uatenders.Можливість заповнити Milestones info    ${tender_data.data.milestones}  ${methodType}  ${mode}
  \  Run Keyword IF   '${methodType}' == 'reporting'
  \  ...   uatenders.Додати цінову пропозицію до reporting   ${tender_data}
  \  Run Keyword IF   '${ITEM_MEAT}' == 'True'
  \  ...    uatenders.Можливість заповнити Items info    ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \  uatenders.Можливість додати потрiбну кількість предметів_items до ЛОТУ    ${tender_data}  ${lot_index}   #items

Можливість додати багато лотів до тендеру
  [Arguments]  ${tender_data}  ${methodType}  ${mode}
  :FOR   ${lot_index}   IN RANGE   ${NUMBER_OF_LOTS}
  \   uatenders.Можливість заповнити Tender info   ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \   uatenders.Можливість заповнити Lots info     ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \   uatenders.Можливість заповнити Items info    ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \   uatenders.Можливість заповнити Milestones info    ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  \   Exit For Loop If      '${lot_index}' == '1'
  \   WaitVisibilityAndClickElement          xpath=(//*[@class='form-group']//button)[@data-lot='0']

#################################### Tender info ####################################
Можливість заповнити Tender info
  [Arguments]  ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  # tender-features
  Run Keyword IF   '${methodType}' != '${mode}'          Run Keyword
  ...   Run Keyword And Ignore Error    uatenders.Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу НЕЦIНОВI ПОКАЗНИКИ     ${tender_data}  ${lot_index}    #tender-features

#################################### безлотовий Lots info ####################################
Можливість заповнити безлотовий Lots info
  [Arguments]  ${tender_data}  ${methodType}  ${mode}
  # lot
  # lot-features
  ${amount}=                                     float_to_string_2f     ${tender_data.data.value.amount}
  ${minimalStep}=    Run Keyword IF   '${methodType}' != 'negotiation'
  ...   float_to_string_2f     ${tender_data.data.minimalStep.amount}
  Wait Until Element Is Visible                 name=lots[0][title]                15
  Input text                                    name=lots[0][title]                l-c92308c7: Жалуватися переплачувати покоїтися стирта.
  Run Keyword And Ignore Error    Input text    name=lots[0][title_en]             l-84068ff4: Voluptatibus expedita illum quaerat omnis dolore adipisci.
  Input text                                    name=lots[0][description]          Виголос обачити іконний нахватитися свистіння звідси шолупайка
  Input text                                    name=lots[0][amount]               ${amount}
  Run Keyword And Ignore Error    Input text    name=lots[0][minimal_step]         ${minimalStep}

#################################### Lots info ####################################
Можливість заповнити Lots info
  [Arguments]  ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  # lot
  # lot-features
  Run Keyword IF   '${methodType}' != 'closeFrameworkAgreementUA'          Run Keyword
  ...   Run Keyword And Ignore Error    uatenders.Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу НЕЦIНОВI (ЯКIСНI) КРИТЕРII ОЦIНКИ    ${tender_data}  ${lot_index}    #lot-features

#################################### Items info ####################################
Можливість заповнити Items info
  [Arguments]  ${tender_data}  ${methodType}  ${mode}  ${lot_index}
  # items
  # items-features
  Run Keyword IF   '${methodType}' != '${mode}'           Run Keyword
  ...   Run Keyword And Ignore Error    uatenders.Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу IНФОРМАЦIЯ ПРО НОМЕНКЛАТУРУ     ${tender_data}  ${lot_index}    #items-features

#########################################################################################
#################################### Milestones info ####################################
#########################################################################################
Можливість заповнити Milestones info
  [Arguments]  ${milestones}  ${methodType}  ${mode}
  ${miles_count}=  Get Length  ${milestones}
  ${visible_btn}=    Run Keyword And Return Status   Element Should Be Visible       xpath=(//*[contains(text(),'Тип оплати')])[1]   Тип оплати
  Run Keyword IF    '${visible_btn}' == 'False'     Run Keyword
  ...   WaitVisibilityAndClickElement     xpath=(//*[contains(text(),'Додати умову оплати')])[1]
  :FOR   ${index}   IN RANGE   ${miles_count}
  \   ${milestonesTitle}=           get_milestones_title            ${milestones[${index}].title}
  \   ${milestonesCode}=            get_milestones_code             ${milestones[${index}].code}
  \   ${milestonesDurationType}=    get_milestones_duration_type    ${milestones[${index}].duration.type}
  \   Run Keyword IF    '${visible_btn}' == 'False'     Run Keywords
  \   ...   uatenders.Додавання умов оплати   ${milestones}  ${index+1}  ${visible_btn}
  \   ...   AND   Exit For Loop If      '${index}' == '2'
  \   ...   AND   WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Додати умову оплати')])[1]
  \   Run Keyword IF    '${visible_btn}' == 'True'      Run Keywords
  \   ...   uatenders.Додавання умов оплати   ${milestones}  ${index}  ${visible_btn}
  \   ...   AND   Exit For Loop If      '${index}' == '0' and '${miles_count}' == '1'
  \   ...   AND   Exit For Loop If      '${index}' == '2'
  \   ...   AND   WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Додати умову оплати')])[1]

Додавання умов оплати
  [Arguments]  ${milestones}  ${index}  ${visible_btn}
  ${indexDate}=    Run Keyword IF    '${MODE}' == 'reporting'    get_minus_Index    ${index}
  ...   ELSE IF     '${MODE}' != 'reporting'   Convert To String    ${index}
  ${milestonesTitle}=           get_milestones_title            ${milestones[${indexDate}].title}
  ${milestonesCode}=            get_milestones_code             ${milestones[${indexDate}].code}
  ${milestonesDurationType}=    get_milestones_duration_type    ${milestones[${indexDate}].duration.type}
  Input text                       name=lots[0][milestones][${index}][duration_days]    ${milestones[${indexDate}].duration.days}
  Select From List                 name=lots[0][milestones][${index}][title_id]         ${milestonesTitle}
  Run Keyword And Ignore Error    Input text    name=lots[0][milestones][${index}][description]    ${milestones[${indexDate}].description}
  Select From List                 name=lots[0][milestones][${index}][code]             ${milestonesCode}
  Select From List                 name=lots[0][milestones][${index}][duration_type]    ${milestonesDurationType}
  Input text                       name=lots[0][milestones][${index}][percentage]       ${milestones[${indexDate}].percentage}

###########################################################
####################### Tender info #######################
#     Основные данные --> Нецінові показники
#     Основные данные --> Документація
###########################################################
#     Основные данные --> Нецінові показники
Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу НЕЦIНОВI ПОКАЗНИКИ
  [Arguments]  ${tender_data}  ${defoultLot_index}
  uatenders.Додати потрiбну кількість показників_features до ТЕНДЕРУ   ${tender_data}  ${tender_data.data.features[${defoultLot_index}]}  ${defoultLot_index}

Додати потрiбну кількість показників_features до ТЕНДЕРУ
  [Arguments]  ${tender_data}  ${featureTender}  ${defoultLot_index}
  ${featureTenderIndex}=    Run Keyword IF   '${tender_data.data.procurementMethodType}' == 'aboveThresholdUA.defense'
  ...   Convert To Integer        ${0}
  ...         ELSE IF                        '${tender_data.data.procurementMethodType}' != 'aboveThresholdUA.defense'
  ...   Convert To Integer        ${1}
  ${featureTender_length}=    Run Keyword IF    '${defoultLot_index}' == '0'     Run Keyword
  ...   Convert To Integer        ${1}
  ...         ELSE IF                           '${defoultLot_index}' == '1'
  ...   Convert To Integer        ${1}
  :FOR   ${featureTender_index}   IN RANGE   ${featureTender_length}
  \   Exit For Loop If      '${defoultLot_index}' != '0'
  \   uatenders.Додати нецінові показники до тендеру   ${featureTender}   ${featureTender_index}   ${defoultLot_index}

Додати нецінові показники до тендеру
  [Arguments]    ${featureTender}   ${featureTender_index}   ${defoultLot_index}
  ${featureTenderEnumValue_0}=      Evaluate              ${featureTender.enum[0].value}*${100}
  ${featureTenderEnumValue_0}=      Convert To String     ${featureTenderEnumValue_0}
  ${featureTenderEnumValue_0}=      Fetch From Left       ${featureTenderEnumValue_0}    .
  ${featureTenderEnumValue_1}=      Evaluate              ${featureTender.enum[1].value}*${100}
  ${featureTenderEnumValue_1}=      Convert To String     ${featureTenderEnumValue_1}
  ${featureTenderEnumValue_1}=      Fetch From Left       ${featureTenderEnumValue_1}    .
  ${featureTenderEnumValue_2}=      Evaluate              ${featureTender.enum[2].value}*${100}
  ${featureTenderEnumValue_2}=      Convert To String     ${featureTenderEnumValue_2}
  ScrollToElement                        (//*[text()[contains(.,'Документація')]]/..//*[. = 'Документація'])
  WaitVisibilityAndClickElement    xpath=(//*[@class='form-group']//button)[@data-container='tender']
  Wait Until Element Is Visible    name=features[${featureTender_index}][title]                        15
  Input Text                       name=features[${featureTender_index}][title]                        ${featureTender.title}
  Run Keyword And Ignore Error     Input Text       name=features[${featureTender_index}][title_en]    ${featureTender.title_en}
  Input Text                       name=features[${featureTender_index}][description]                  ${featureTender.description}
  ScrollToElement                        (//*[text()[contains(.,'Нецінові показники')]]/..//*[. = 'Нецінові показники'])
  Wait Until Element Is Visible    name=features[${featureTender_index}][values][0][title]             15
  Input Text                       name=features[${featureTender_index}][values][0][title]             ${featureTender.enum[0].title}
  Input Text                       name=features[${featureTender_index}][values][0][value]             ${featureTenderEnumValue_0}
  ScrollToElementToFalse                 (//*[@data-container='feature-values-container-tender${featureTender_index}'])
  WaitVisibilityAndClickElement    xpath=(//*[@data-container='feature-values-container-tender${featureTender_index}'])
  Wait Until Element Is Visible    name=features[${featureTender_index}][values][1][title]             15
  Input Text                       name=features[${featureTender_index}][values][1][title]             ${featureTender.enum[1].title}
  Input Text                       name=features[${featureTender_index}][values][1][value]             ${featureTenderEnumValue_1}
  ScrollToElementToFalse                 (//*[@data-container='feature-values-container-tender${featureTender_index}'])
  WaitVisibilityAndClickElement    xpath=(//*[@data-container='feature-values-container-tender${featureTender_index}'])
  Wait Until Element Is Visible    name=features[${featureTender_index}][values][2][title]             15
  Input Text                       name=features[${featureTender_index}][values][2][title]             ${featureTender.enum[2].title}
  Input Text                       name=features[${featureTender_index}][values][2][value]             ${featureTenderEnumValue_2}

#     Основные данные --> Документація
Завантажити документ до створення 'Нової закупівлі' - тендер
  [Arguments]  ${filepath}
  ${filepath}=                             get_file_path
  # скрытый элемен конвертируем в видимый (style.display = "none" ---> style.display = "block")
  Execute Javascript  window.frames[0]; document.querySelector( "input[name='tender[files][]']" ).style.display = "block";
  Choose File       name=tender[files][]           ${filepath}

###########################################################
######################## Lots info ########################
#     Основные данные --> Лоти
#     Основные данные --> Нецінові (якісні) критерії оцінки
#     Основные данные --> Документація лоту
###########################################################
#     Основные данные --> Лоти
Можливість в тендері заповнити поля роздiлу ЛОТИ
  [Arguments]  ${tender_data}  ${lot_index}
  ${lots}=                Get From Dictionary        ${tender_data.data}           lots
  uatenders.Основнi поля для роздiлу ЛОТИ    ${lots[${lot_index}]}       ${lot_index}

Основнi поля для роздiлу ЛОТИ
  [Arguments]  ${lot}  ${lot_index}
  Wait Until Element Is Visible                 name=lots[${lot_index}][title]                15
  Input text                                    name=lots[${lot_index}][title]                ${lot.title}
  Run Keyword And Ignore Error    Input text    name=lots[${lot_index}][title_en]             ${lot.title_en}
  Input text                                    name=lots[${lot_index}][description]          ${lot.description}
  Run Keyword And Ignore Error    Input text    name=lots[${lot_index}][description_en]       ${lot.title_en}
  Run Keyword IF    '${MODE}' == 'esco' or '${MODE}' == 'open_esco'
  ...   uatenders.Поля ESCO в роздiлі ЛОТИ    ${lot}  ${lot_index}
  ...   ELSE IF     '${MODE}' != 'esco' or '${MODE}' != 'open_esco'
  ...   uatenders.Поля інших процедур в роздiлі ЛОТИ    ${lot}  ${lot_index}

Поля інших процедур в роздiлі ЛОТИ
  [Arguments]  ${lot}  ${lot_index}
  ${budget}=                                     Get From Dictionary    ${lot.value}          amount
  ${budget}=                                     float_to_string_2f     ${budget}
  ${step_rate}=       Run Keyword And Return Status
  ...   Get From Dictionary    ${lot.minimalStep}    amount
  ${step_rate}=    Run Keyword IF    '${step_rate}' == 'True'
  ...   Get From Dictionary    ${lot.minimalStep}    amount
  ${step_rate}=   Run Keyword And Ignore Error   float_to_string_2f     ${step_rate}
  Input text                                    name=lots[${lot_index}][amount]               ${budget}
  Run Keyword And Ignore Error    Input text    name=lots[${lot_index}][minimal_step]         ${step_rate}

Поля ESCO в роздiлі ЛОТИ
  [Arguments]  ${lot}  ${lot_index}
  ${minimalStepPercent}=      Get From Dictionary    ${lot}    minimalStepPercentage
  ${minimalStepPercent}=  Evaluate  ${minimalStepPercent}*${100}
  ${minimalStepPercent}=      Convert To String     ${minimalStepPercent}
  Input text    name=lots[${lot_index}][minimal_step_percentage]   ${minimalStepPercent}

Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу НЕЦIНОВI (ЯКIСНI) КРИТЕРII ОЦIНКИ
  [Arguments]  ${tender_data}  ${defoultLot_index}
  uatenders.Додати потрiбну кількість показників_features до ЛОТУ   ${tender_data}  ${tender_data.data.features[${defoultLot_index}]}  ${defoultLot_index}

Додати потрiбну кількість показників_features до ЛОТУ
  [Arguments]  ${tender_data}  ${featureLot}  ${defoultLot_index}
  # #значение по счету в дикшинари для lot == 0  (features[0])
  # #значение по счету в дикшинари для tenderer == 1  (features[1])
  # #значение по счету в дикшинари для item == 2  (features[2])
  ${featureLot_length}=    Run Keyword IF    '${NUMBER_OF_LOTS}' == '1'     Run Keyword
  ...   Convert To Integer        ${0}
  ...         ELSE IF                        '${NUMBER_OF_LOTS}' == '2'     Run Keyword
  ...   Convert To Integer        ${0}
  uatenders.Додати нецінові показники до ЛОТУ   ${featureLot}        ${featureLot_length}   ${defoultLot_index}
  uatenders.Завантажити документ до створення 'Нової закупівлі' - лот   ${defoultLot_index}    #added files in Tender (лот)

Додати нецінові показники до ЛОТУ
  [Arguments]    ${featureLot}   ${featureLot_index}  ${defoultLot_index}
  ${featureLotEnumValue_0}=      Evaluate              ${featureLot.enum[0].value}*${100}
  ${featureLotEnumValue_0}=      Convert To String     ${featureLotEnumValue_0}
  ${featureLotEnumValue_0}=      Fetch From Left       ${featureLotEnumValue_0}    .
  ${featureLotEnumValue_1}=      Evaluate              ${featureLot.enum[1].value}*${100}
  ${featureLotEnumValue_1}=      Convert To String     ${featureLotEnumValue_1}
  ${featureLotEnumValue_1}=      Fetch From Left       ${featureLotEnumValue_1}    .
  ${featureLotEnumValue_2}=      Evaluate              ${featureLot.enum[2].value}*${100}
  ${featureLotEnumValue_2}=      Convert To String     ${featureLotEnumValue_2}
  ScrollToElement                      (//*[text()[contains(.,'Вид та розмір забезпечення тендерних пропозицій')]]/..//*[. = 'Вид та розмір забезпечення тендерних пропозицій'])
  WaitVisibilityAndClickElement       xpath=(//*[@data-container='lots-${defoultLot_index}'])
  Wait Until Element Is Visible       name=lots[${defoultLot_index}][features][${featureLot_index}][title]                15
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][title]                ${featureLot.title}
  Run Keyword And Ignore Error    Input Text    name=lots[${defoultLot_index}][features][${featureLot_index}][title_en]   ${featureLot.title_en}
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][description]          ${featureLot.description}
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][0][title]     ${featureLot.enum[0].title}
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][0][value]     ${featureLotEnumValue_0}
  ScrollToElementToFalse                    (//*[@data-container='feature-values-container-lots${defoultLot_index}${featureLot_index}'])
  WaitVisibilityAndClickElement       xpath=(//*[@data-container='feature-values-container-lots${defoultLot_index}${featureLot_index}'])
  Wait Until Element Is Visible       name=lots[${defoultLot_index}][features][${featureLot_index}][values][1][title]     15
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][1][title]     ${featureLot.enum[1].title}
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][1][value]     ${featureLotEnumValue_1}
  ScrollToElementToFalse                    (//*[@data-container='feature-values-container-lots${defoultLot_index}${featureLot_index}'])
  WaitVisibilityAndClickElement       xpath=(//*[@data-container='feature-values-container-lots${defoultLot_index}${featureLot_index}'])
  Wait Until Element Is Visible       name=lots[${defoultLot_index}][features][${featureLot_index}][values][2][title]     15
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][2][title]     ${featureLot.enum[2].title}
  Input Text                          name=lots[${defoultLot_index}][features][${featureLot_index}][values][2][value]     ${featureLotEnumValue_2}

#     Основные данные -->  Документація лоту
Завантажити документ до створення 'Нової закупівлі' - лот
  [Arguments]  ${defoultLot_index}
  ${filepath}=                             get_file_path
  Execute Javascript  window.frames[0]; document.querySelector( "input[id='lots-0-1']" ).style.display = "block";
  Choose File       id=lots-${defoultLot_index}-1           ${filepath}

###########################################################
######################## Items info ########################
#     Основные данные --> Інформація про номенклатуру
#     Основные данные --> Нецінові показники до предмету
#     Основные данные --> Документація товару
###########################################################
#     Основные данные --> Інформація про номенклатуру
Можливість додати потрiбну кількість предметів_items до ЛОТУ
  [Arguments]  ${tender_data}  ${defoultLot_index}
  uatenders.Додати потрiбну кількість предметів_items до лоту   ${tender_data}   ${defoultLot_index}

Додати потрiбну кількість предметів_items до лоту
  [Arguments]  ${tender_data}  ${defoultLot_index}
  ${items}=                Get From Dictionary        ${tender_data.data}           items
  ${items_length}=    Run Keyword IF    '${NUMBER_OF_ITEMS}' == '1'    Run Keyword
  ...   Convert To Integer        ${1}
  ...         ELSE IF                   '${NUMBER_OF_ITEMS}' != '1'    Run Keyword
  ...   Convert To Integer        ${NUMBER_OF_ITEMS}
  :FOR   ${item_index}   IN RANGE   ${items_length}
  \   uatenders.Додати предмет    ${items[${item_index}]}    ${item_index}   ${defoultLot_index}
  \   uatenders.Завантажити документ до створення 'Нової закупівлі' - товар    ${item_index}   ${defoultLot_index}

Додати предмет
  [Arguments]  ${item}  ${item_index}  ${defoultLot_index}
  Run Keyword IF    '${MODE}' == 'negotiation' and '${item_index}' == '0'    Run Keywords
  ...   WaitVisibilityAndClickElement       xpath=(//*[@class='form-group']//a)[@data-lot='${defoultLot_index}']    #индекс items начинается с 0
  ...   AND   uatenders.Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting    ${item}    ${item_index+1}    ${defoultLot_index}
  ...      ELSE IF    '${MODE}' == 'negotiation' and '${item_index}' == '1'    Run Keyword
  ...   uatenders.Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting    ${item}    ${item_index-1}    ${defoultLot_index}
  Run Keyword IF    '${item_index}' == '0' and '${MODE}' != 'negotiation'
  ...   uatenders.Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting    ${item}    ${item_index}    ${defoultLot_index}
  ...    ELSE IF   '${item_index}' != '0' and '${MODE}' != 'negotiation'   Run Keywords
  ...   WaitVisibilityAndClickElement       xpath=(//*[@class='form-group']//a)[@data-lot='${defoultLot_index}']    #индекс items начинается с 0
  ...   AND   uatenders.Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting    ${item}    ${item_index}    ${defoultLot_index}

Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting
  [Arguments]  ${item}  ${item_index}  ${defoultLot_index}
  ${lotRegionName}=                 Get From Dictionary              ${item.deliveryAddress}     region
  ${lotRegionId}=                   get_region_delivery_id           ${lotRegionName}
              #lotItem
  Wait Until Element Is Visible                 name=lots[${defoultLot_index}][items][${item_index}][description]      15
  Input Text                                    name=lots[${defoultLot_index}][items][${item_index}][description]      ${item.description}
  Run Keyword And Ignore Error    Input Text    name=lots[${defoultLot_index}][items][${item_index}][description_en]   ${item.description_en}
  Run Keyword IF    '${MODE}' != 'open_esco'    uatenders.Додати до предмет одиниці виміру   ${item}  ${item_index}  ${defoultLot_index}
              #cpv
  Input text                                    name=lots[${defoultLot_index}][items][${item_index}][cpv]      ${item.classification.id}
  Run Keyword And Ignore Error       WaitVisibilityAndClickElement       xpath=(//*[@class='ui-menu-item'])[last()]
  Run Keyword And Ignore Error       WaitVisibilityAndClickElement       xpath=(//*[@class='ui-menu-item'])[1]
  Run Keyword IF    '${MODE}' != 'open_esco'    uatenders.Додатковий класифікатор   ${item}  ${item_index}  ${defoultLot_index}
              #select Delivery Address
  WaitVisibilityAndClickElement       xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][same_delivery_address]'])[2]
  Run Keyword And Ignore Error        ScrollToElement                  (//*[text()[contains(.,'Документація лоту')]]/..//*[. = 'Документація лоту'])
  Run Keyword If     '${lotRegionName}' == 'місто Київ'         Run Keyword
  ...   Select From List     xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][region_id]'])[3]           26     #26 м. Киев
  ...      ELSE IF   '${lotRegionName}' != 'місто Київ'         Run Keyword
  ...   Select From List     xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][region_id]'])[3]           ${lotRegionId}
  Input Text                 xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][postal_code]'])[2]         ${item.deliveryAddress.postalCode}
  Input Text                 xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][locality]'])[2]            ${item.deliveryAddress.locality}
  Input Text                 xpath=(//*[@name='lots[${defoultLot_index}][items][${item_index}][delivery_address]'])[2]    ${item.deliveryAddress.streetAddress}

Додатковий класифікатор
  [Arguments]  ${item}  ${item_index}  ${defoultLot_index}
  ${addSchemeStatus}=    Run Keyword And Return Status    Get From Dictionary    ${item.additionalClassifications[0]}    scheme
  Run Keyword And Ignore Error    Input Text      name=lots[${defoultLot_index}][items][${item_index}][code_additional_road]      ${item.additionalClassifications[0].id}
  Run Keyword And Ignore Error    Input Text      name=lots[${defoultLot_index}][items][${item_index}][code_additional_gmdn]      ${item.additionalClassifications[0].id}
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement      xpath=(//*[@class='ui-menu-item-wrapper'])[last()]
              #MOZ-z
  Run Keyword And Ignore Error    Input Text       name=lots[${defoultLot_index}][items][${item_index}][code_additional_moz]   ${item.additionalClassifications[0].description}
  Run Keyword And Ignore Error        Press Key    tag=body       \\40
  Run Keyword And Ignore Error    Input Text       xpath=(.//*[@name='lots[${defoultLot_index}][items][${item_index}][codes][2][id]'])[1]    ${item.additionalClassifications[1].id}

Додати до предмет одиниці виміру
  [Arguments]  ${item}  ${item_index}  ${defoultLot_index}
  ${delivery_start_date}=       convert_datetime_for_delivery        ${item.deliveryDate.startDate}
  ${delivery_end_date}=         convert_datetime_for_delivery        ${item.deliveryDate.endDate}
  ${delivery_end_plus_date}=      convert_datetime_for_delivery_plus_25_day      ${delivery_end_date}
  ${lotUnit}=                        Get From Dictionary             ${item.unit}                name
  ${unit_id}=                            get_unit_id                 ${lotUnit}
  ${itemQuantity}=                   Get From Dictionary             ${item}                     quantity
  ${quantity}=                        Convert To String              ${itemQuantity}
  Input Text                                    name=lots[${defoultLot_index}][items][${item_index}][quantity]         ${quantity}
  Select From List                    name=lots[${defoultLot_index}][items][${item_index}][unit_id]    ${unit_id}
  Input Text                          name=lots[${defoultLot_index}][items][${item_index}][delivery_date_start]          ${delivery_start_date}  #${delivery_end_plus_date}
  Input Text                          name=lots[${defoultLot_index}][items][${item_index}][delivery_date_end]            ${delivery_end_date}  #${delivery_end_plus_date}

#     Основные данные --> Нецінові показники до предмету
Можливість в ЛОТI додати потрiбну кількість показників_features до роздiлу IНФОРМАЦIЯ ПРО НОМЕНКЛАТУРУ
  [Arguments]  ${tender_data}  ${defoultLot_index}
  uatenders.Додати потрiбну кількість показників_features до ПРЕДМЕТУ   ${tender_data}  ${tender_data.data.features[${defoultLot_index}]}  ${defoultLot_index}

Додати потрiбну кількість показників_features до ПРЕДМЕТУ
  [Arguments]  ${tender_data}  ${featureItem}  ${defoultLot_index}
  # #значение по счету в дикшинари для lot == 0  (features[0])
  # #значение по счету в дикшинари для tenderer == 1  (features[1])
  # #значение по счету в дикшинари для item == 2  (features[2])
  ${featureItems_length}=    Run Keyword IF    '${NUMBER_OF_ITEMS}' == '1'     Run Keyword
  ...   Convert To Integer        ${1}
  ...         ELSE IF                          '${NUMBER_OF_ITEMS}' == '2'     Run Keyword
  ...   Convert To Integer        ${2}
  :FOR   ${featureItem_index}   IN RANGE   ${featureItems_length}
  \   uatenders.Додати нецінові показники до ПРЕДМЕТУ   ${featureItem}       ${featureItem_index}   ${defoultLot_index}

Додати нецінові показники до ПРЕДМЕТУ
  [Arguments]    ${featureItem}   ${featureItem_index}  ${defoultLot_index}
  ${featureItemEnumValue_0}=      Evaluate              ${featureItem.enum[0].value}*${100}
  ${featureItemEnumValue_0}=      Convert To String     ${featureItemEnumValue_0}
  ${featureItemEnumValue_0}=      Fetch From Left       ${featureItemEnumValue_0}    .
  ${featureItemEnumValue_1}=      Evaluate              ${featureItem.enum[1].value}*${100}
  ${featureItemEnumValue_1}=      Convert To String     ${featureItemEnumValue_1}
  ${featureItemEnumValue_1}=      Fetch From Left       ${featureItemEnumValue_1}    .
  ${featureItemEnumValue_2}=      Evaluate              ${featureItem.enum[2].value}*${100}
  ${featureItemEnumValue_2}=      Convert To String     ${featureItemEnumValue_2}
  ScrollToElementToFalse                 (//*[@data-container='lots-${defoultLot_index}-items-${defoultLot_index}'])[1]
  WaitVisibilityAndClickElement    xpath=(//*[@data-container='lots-${defoultLot_index}-items-${defoultLot_index}'])[1]
  Wait Until Element Is Visible    xpath=(//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]     15
  ScrollToElementToFalse                 (//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]
  Wait Until Element Is Visible    name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][title]               15
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][title]               ${featureItem.title}
  Run Keyword And Ignore Error     Input Text    name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][title_en]    ${featureItem.title_en}
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][description]         ${featureItem.description}
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][0][title]    ${featureItem.enum[0].title}
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][0][value]    ${featureItemEnumValue_0}
  ScrollToElementToFalse                 (//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]
  WaitVisibilityAndClickElement    xpath=(//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]
  Wait Until Element Is Visible    name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][1][title]    15
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][1][title]    ${featureItem.enum[1].title}
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][1][value]    ${featureItemEnumValue_1}
  ScrollToElementToFalse                 (//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]
  WaitVisibilityAndClickElement    xpath=(//*[@data-namespace='lots[0][items][0]'])[contains(text(),'Додати опцію')][last()]
  Wait Until Element Is Visible    name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][2][title]    15
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][2][title]    ${featureItem.enum[2].title}
  Input Text                       name=lots[${defoultLot_index}][items][0][features][${featureItem_index}][values][2][value]    ${featureItemEnumValue_2}

#     Основные данные --> Документація товару
Завантажити документ до створення 'Нової закупівлі' - товар
  [Arguments]  ${item_index}  ${defoultLot_index}
  ${filepath}=                             get_file_path
  Execute Javascript  window.frames[0]; document.querySelector( "input[name='lots[${defoultLot_index}][items][${item_index}][files][]']" ).style.display = "block";
  Choose File       name=lots[${defoultLot_index}][items][${item_index}][files][]        ${filepath}

#######################################################
  # Возможность дождаться кнопки [Опублiкувати] (создание тендера по 2-х факторной)
#######################################################
Дочикатися появи кнопки Опублікувати
  [Arguments]   ${username}
  Wait Until Keyword Succeeds   10 x   10 s     Run Keywords
  ...   Run Keyword IF    '${username}' == 'PASS'    Element Should Be Visible    xpath=(//*[contains(text(),'ID:')])    ID:
  ...   AND   Run Keyword And Ignore Error    Click Element    xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Reload Page
  ...   AND   WaitVisibilityAndClickElement    xpath=//*[contains(text(),'Опублікувати')]
  ...   AND   Sleep  5
  ...   AND   Reload Page
  ...   AND   Wait Until Page Contains  Відмінити закупівлю  5 s

#######################################################
  # Возможность дождаться получения АЙДИ тендера
#######################################################
Дочикатися появи айди тендера tender_uaid
  [Arguments]   ${username}
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[contains(text(),'ID:')])      ID:
  ...   AND   Reload Page
  ...   AND   Sleep  1
  ...   AND   Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])

#######################################################
  # Возможность дождаться получения АЙДИ Плана
#######################################################
Дочикатися появи айди тендера plan_uaid
  [Arguments]   ${username}
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  1
  ...   AND   Element Should Be Visible       xpath=(//*[contains(text(),'UA-P-2')])[1]      UA-P-20

######################################    ПОШУК Тендеру   ################################################
Пошук тендера по ідентифікатору
  [Arguments]   ${username}  ${tender_uaid}  ${second_stage_data}=${EMPTY}
  Switch Browser    1
#############################
  # for exclude Quinta errors added Sleeep for waiting create data
  ${suite_name}=    Fetch From Right    ${SUITE_NAME}   .
  Run Keyword if   'Можливість знайти закупівлю по ідентифікатору' == '${TEST_NAME.replace('\'', '')}' and '${MODE}' == 'open_framework' and '${suite_name}' == 'Contract Signing'
  ...   Sleep  15 min
#############################
  Wait Until Keyword Succeeds   10 x   5 s     Run Keywords
  ...   Run Keyword IF    '${tender_uaid}' == 'PASS'    Input Text    name=search[s]    ${tender_uaid}
  ...   AND   Go To   ${USERS.users['${username}'].homepage}
  ...   AND   Input Text                                  name=search[s]                ${tender_uaid}
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@type,'submit') and contains(.,'Знайти')])
  ...   AND   Wait Until Element Is Visible               xpath=(//*[contains(text(),'Загальна інформація')])[1]    30
  Sleep  2
  Run Keyword And Ignore Error    Click Element           xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Log To Console  _
  Log To Console  tender_id --> ${tender_uaid}

######################################    ПОШУК Плана   ################################################
Пошук плану по ідентифікатору
  [Arguments]   ${username}  ${plan_uaid}
  Wait Until Keyword Succeeds   10 x   5 s     Run Keywords
  ...   Run Keyword IF    '${plan_uaid}' == 'PASS'    Input Text    name=search[s]    ${plan_uaid}
  ...   AND   Go To   ${USERS.users['${username}'].homepage}
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[@class='nav-page-block']//*[contains(text(),'Плани закупівель')])
  ...   AND   Sleep  2
  ...   AND   Input Text                                  name=search[s]                ${plan_uaid}
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@type,'submit') and contains(.,'Знайти')])
  ...   AND   Wait Until Element Is Visible               xpath=(//*[contains(text(),'Інформація про план')])[1]    30
  Log To Console  _
  Log To Console  plan_id --> ${plan_uaid}

######################################    ПОШУК Угоди   ################################################
Пошук угоди по ідентифікатору
  [Arguments]  ${username}  ${agreement_uaid}
  Switch Browser    1
  Log  agreement_id --> ${agreement_uaid}
  ${agreementChangesID}=  Remove String Using Regexp  ${agreement_uaid}  -\\w+\\d$
  Log To Console  _
  Log To Console  agreementChangesID --> ${agreementChangesID}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${agreementChangesID}
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Угоди')]])[1]
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  Sleep  2
  Page Should Contain  ${agreement_uaid}
  Sleep  5
  Run Keyword And Ignore Error    Click Element           xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])

######################################    ОНОВИТИ СТОРІНКУ для Тендера    ################################################
Оновити сторінку з тендером
  [Arguments]   ${username}  ${tender_uaid}
  Switch Browser    1
  Run Keyword And Ignore Error    Click Element           xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  2
  Reload Page
  Sleep  2
######################################    ОНОВИТИ СТОРІНКУ для Плана    ################################################
Оновити сторінку з планом
  [Arguments]   ${username}  ${plan_uaid}
  Switch Browser    1
  Reload Page
  Sleep  2
  Run Keyword And Ignore Error      Click Element                      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
##############################################################################################################
######################################    Отримати інформацію    ################################################
Отримати інформацію із плану
  [Arguments]   ${username}  ${tender_uaid}  ${field_name}
  Switch Browser    1
  Run Keyword And Return    Отримати інформацію про план поля ${field_name}

Отримати інформацію із тендера
  [Arguments]   ${username}  ${tender_uaid}  ${field_name}
  Switch Browser    1
  Run Keyword IF   'Відображення статусу блокування перед початком аукціону' in '${TEST_NAME}'   Wait Until Keyword Succeeds   5 x   35 s   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error      Click Element          xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible         xpath=(//table[@class="clean-table"]//span)[1]      Прекваліфікація (період оскаржень)
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   Run Keyword And Return    Отримати інформацію про замовника ${field_name}
  Run Keyword IF   '${username}' != 'uatenders_Owner' or '${username}' != 'uatenders_Viewer'
  ...   Run Keyword And Return    Отримати інформацію про посточальника ${field_name}

Отримати інформацію із предмету
  [Arguments]   ${username}  ${tender_uaid}  ${item_id}  ${field_name}
  ScrollToElementToFalse                      (//*[contains(text(),'Результати') or contains(text(),'З 8 до 18')])[1]
  ${statusShowLots}=       Run Keyword And Return Status
  ...   Element Should Be Visible    xpath=(.//*[contains(text(),'Переглянути інформацію про лот')]/../*[@style='display: none;'])[1]
  Switch Browser    1
  Sleep  5
  Run Keyword IF   '${statusShowLots}' == 'PASS'   Run Keyword
  ...   WaitVisibilityAndClickElement       xpath=(.//*[contains(text(),'Переглянути інформацію про лот')])[1]
  Run Keyword IF   'items[0].${field_name}' == 'items[0].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля items[0].${field_name}  ${item_id}  ${username}  ${tender_uaid}
  ...    ELSE IF   'items[1].${field_name}' == 'items[1].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля items[0].${field_name}  ${item_id}  ${username}  ${tender_uaid}
  ...    ELSE IF   'items[2].${field_name}' == 'items[2].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля items[0].${field_name}  ${item_id}  ${username}  ${tender_uaid}
  ...    ELSE IF   'items[3].${field_name}' == 'items[3].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля items[0].${field_name}  ${item_id}  ${username}  ${tender_uaid}

Отримати інформацію із запитання
  [Arguments]   ${username}  ${tender_uaid}  ${question_id}  ${field_name}
  Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  1
  Run Keyword IF   'questions[0].${field_name}' == 'questions[0].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля questions[0].${field_name}   ${question_id}   ${username}   ${tender_uaid}
  ...    ELSE IF   'questions[1].${field_name}' == 'questions[1].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля questions[0].${field_name}   ${question_id}   ${username}   ${tender_uaid}
  ...    ELSE IF   'questions[2].${field_name}' == 'questions[2].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля questions[0].${field_name}   ${question_id}   ${username}   ${tender_uaid}
  ...    ELSE IF   'questions[3].${field_name}' == 'questions[3].${field_name}'
  ...  Run Keyword And Return    Отримати значення поля questions[0].${field_name}   ${question_id}   ${username}   ${tender_uaid}

Отримати інформацію із лоту
  [Arguments]   ${username}  ${tender_uaid}  ${lot_id}  ${field}
  Run Keyword IF   '${field}' == 'auctionPeriod.startDate'
  ...       Run Keyword And Return    Отримати інформацію із лоту про замовника lots[0].${field}
  Run Keyword IF   '${field}' != 'auctionPeriod.startDate' or '${field}' != 'lots[0].fundingKind'
  ...       Run Keyword And Return    Отримати інформацію із лоту про замовника lots[0].${field}  ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${field}' == 'lots[0].fundingKind'
  ...       Run Keyword And Return    Отримати інформацію із лоту про замовника ${field}  ${lot_id}  ${username}  ${tender_uaid}

Отримати текст плана із поля
  [Arguments]   ${fieldname}
  Wait Until Element Is Visible         ${locator.planningOwnerViewer.${fieldname}}       10
  Run Keyword And Return    Get Text    ${locator.planningOwnerViewer.${fieldname}}

Отримати текст із поля для замовника
  [Arguments]   ${fieldname}
  Wait Until Element Is Visible         ${locator.ownerViewer.${fieldname}}       10
  Run Keyword And Return    Get Text    ${locator.ownerViewer.${fieldname}}

Отримати текст із поля для посточальника
  [Arguments]   ${fieldname}
  Wait Until Element Is Visible         ${locator.provider.${fieldname}}          10
  Run Keyword And Return    Get Text    ${locator.provider.${fieldname}}

Отримати текст із поля для Claims посточальника
  [Arguments]   ${fieldname}
  Wait Until Element Is Visible         ${locator.claims.provider.${fieldname}}   10
  Run Keyword And Return    Get Text    ${locator.claims.provider.${fieldname}}

Отримати інформацію із угоди
  [Arguments]  ${username}  ${agreement_uaid}  ${field_name}
  uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  ${fieldNum}=    uatenders.Отримати індекс з назви поля  ${field_name}
  Wait Until Keyword Succeeds   20 x   60 s   Run Keywords
  ...   uatenders.Перезавантажити сторінку з угодою
  ...   AND   Element Should Be Visible    xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')])[1]
  uatenders.Переміститься до футера
######################################
  # for exclude Quinta errors added Sleeep for waiting create data
  Run Keyword if   'Відображення обгрунтування зміни partyWithdrawal' == '${TEST_NAME.replace('\'', '')}' and '${ROLE}' == 'viewer'   Run Keywords
  ...   Sleep  10 min
  ...   AND   uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  ...   AND   Sleep  5 min
  ...   AND   uatenders.Перезавантажити сторінку з угодою
  ...   AND   Sleep  2 min
  ...   AND   Log To Console   =======
  ...   AND   uatenders.Перезавантажити сторінку з угодою
  ...   AND   Sleep  1 min
  ...   AND   Reload Page
  ...   AND   Sleep  10
######################################
  Run Keyword And Return If  'rationaleType' in '${field_name}'   Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//*[contains(@class,'rationaleType')])@value
  Run Keyword And Return If  'rationale' in '${field_name}'       Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//*[contains(@class,'rationale')])@value
  Run Keyword And Return If  'status' in '${field_name}'          Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//*[contains(@class,'status')])@value
  Run Keyword And Return If  'modifications[0].itemId' in '${field_name}'      Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//../*[contains(@class,'itemId')])@value
  Run Keyword And Return If  'modifications[0].contractId' in '${field_name}'  Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//../*[contains(@class,'contractId')])@value
  # displaying only @factor@
  Run Keyword And Return If  'modifications[0].addend' in '${field_name}'      Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//../*[contains(@class,'factor')])@value
  Run Keyword And Return If  'modifications[0].factor' in '${field_name}'      Get Element Attribute  xpath=(.//*[contains(@class,'agreementChange ${fieldNum}')]//../*[contains(@class,'factor')])@value

Отримати індекс з назви поля
  [Arguments]  ${field_name}
  ${fieldNum_1}       Fetch From Right     ${field_name}      [
  ${fieldNum_2}       Fetch From Left      ${fieldNum_1}      ]
  Run Keyword And Return    Convert To String    ${fieldNum_2}

Перезавантажити сторінку з угодою
  Reload Page
  Sleep  1
  Run Keyword And Ignore Error      Click Element          xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  1

##################################################################################################################
###############################################      ОТРИМАТИ      ###############################################
##################################################################################################################

##########################################################################################################################
######################################    ОСНОВНI ВIДОБРАЖЕННЯ ТЕНДЕРА    ################################################
##########################################################################################################################
Отримати посилання на аукціон для глядача
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  Sleep  2
  Reload Page
  Sleep  2
  Page Should Contain Element                                 xpath=//a[@class="move-to-auction-page"]
  Run Keyword And Return           Get Element Attribute      xpath=//a[@class="move-to-auction-page"]@href

#############################################################################################################
######################################    ОТРИМАТИ СТАТУС    ################################################
Отримати інформацію про замовника status
  Run Keyword And Ignore Error      WaitVisibilityAndClickElement      xpath=//a[text()[contains(.,'Закупівля')]]
  Run Keyword And Ignore Error      Click Element                      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  2
  Reload Page
  Sleep  2
  ${return_value}=                  Отримати текст із поля для замовника             status
  Run Keyword if   'Неможливість підтвердити постачальника після закінчення періоду кваліфікації' in '${TEST_NAME}'       Sleep  60
  ${return_value}=               convert_status               ${return_value}
  Run Keyword if   'Можливість дочекатися початку періоду очікування' == '${TEST_NAME}'   Wait Until Keyword Succeeds   5 x   1 min   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error      Click Element          xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible         xpath=(//table[@class="clean-table"]//span)[1]      Очікування другого етапу
# Expected error '*' did not occur.
  Run Keyword if   'active.pre-qualification.stand-still' == '${return_value}'    Run Keywords
  ...   Sleep  2
  ...   AND   Run Keyword And Ignore Error      Click Element          xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Reload Page
  ...   AND   Sleep  30
  ...   AND   Reload Page
  ...   AND   Sleep  5
  [Return]    ${return_value}

Отримати інформацію про замовника complaints[${index}].status
  Run Keyword And Ignore Error      Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  2
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement     xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  ${return_value}=                  Отримати текст із поля для замовника             complaints[${index}].status
  Run Keyword And Return            convert_status                 ${return_value}

Отримати інформацію про замовника lots[${index}].status
  ${return_value}=                  Отримати текст із поля для замовника             lots[${index}].status
  Run Keyword And Return            convert_status                 ${return_value}

Отримати інформацію про замовника cancellations[${index}].status
  Reload Page
  Sleep  2
  ${return_value}=                  Отримати текст із поля для замовника             cancellations[${index}].status
  ${return_value}=                  Convert To String                                         ${return_value}
  Run Keyword And Return            convert_status                 ${return_value}

Отримати інформацію про замовника qualifications[${index}].status
  Reload Page
  Sleep  3
  WaitVisibilityAndClickElement     xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])
  ${return_value}=                  Отримати текст із поля для замовника             qualifications[${index}].status
  Run Keyword And Return            convert_status                 ${return_value}

Отримати інформацію про замовника contracts[${index}].status
  ScrollToElementToFalse                (//*[contains(text(),'[ТЕСТУВАННЯ]')])[1]
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${trueStatusCancelled}=       Run Keyword And Return Status
  ...   Element Should Be Visible    xpath=(//*[@class='table table-hover']//*[contains(@class,'label')])[1]    В процесі відхилення
  ${trueStatusBecomingWinner}=       Run Keyword And Return Status
  ...   Element Should Be Visible    xpath=(//*[@class='table table-hover']//*[contains(@class,'label')])[2]    В процесі визначення переможцем
  Run Keyword IF      '${trueStatusCancelled}' == 'True' or '${trueStatusBecomingWinner}' == 'True'         Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  Run Keyword if   'Відображення статусу підписаної угоди з постачальником закупівлі' == '${TEST_NAME.replace('\'', '')}'   Run Keywords
  ...   Sleep  7 min
  ...   AND   Run Keyword And Ignore Error      Click Element                      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Sleep  2
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ${return_value}=                     Отримати текст із поля для замовника              contracts[${index}].status
  Run Keyword And Return               convert_status                  ${return_value}

Отримати інформацію про посточальника status
  Run Keyword And Ignore Error      WaitVisibilityAndClickElement      xpath=//a[text()[contains(.,'ЗакупівляК')]]
  Run Keyword And Ignore Error      Click Element                      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Sleep  2
  Reload Page
  Sleep  2
  ${return_value}=                  Отримати текст із поля для посточальника             status
  Run Keyword And Return            convert_status            ${return_value}

Отримати інформацію про замовника agreements[${index}].status
  WaitVisibilityAndClickElement     xpath=(//*[text()[contains(.,'Угоди')]])
  WaitVisibilityAndClickElement     xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${return_value}=                  Отримати текст із поля для замовника              agreements[${index}].status
  Run Keyword And Return            convert_status                  ${return_value}

#########################  Selections  ##############################
###### owner
Отримати інформацію про замовника agreements[0].agreementID
  Run Keyword If  '${MODE}' == 'open_framework'
  ...     WaitVisibilityAndClickElement        xpath=(//*[text()[contains(.,'Угоди')]])
  ...   ELSE IF   '${MODE}' != 'open_framework'   Run Keywords
  ...   WaitVisibilityAndClickElement          xpath=(.//*[contains(text(),'Перший етап')])
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Угоди')]])
  ${return_value}=                 Отримати текст із поля для замовника               agreements[0].agreementID
# переход на 2-й єтап
  Run Keyword If  '${MODE}' == 'framework_selection'   Run Keyword If
  ...   '${ROLE}' == 'tender_owner' or '${ROLE}' == 'viewer'   Run Keywords
  ...   WaitVisibilityAndClickElement           xpath=(.//*[contains(text(),'Закупівля')])[1]
  ...   AND   WaitVisibilityAndClickElement     xpath=(.//*[contains(text(),'Другі етапи')]/..//./*[@class='row']//a)[last()]
  [Return]    ${return_value}

Отримати інформацію про замовника lots[0].value.amount
  ${return_value}=                 Отримати текст із поля для замовника             lots[0].value.amount
  Run Keyword And Return           Convert To Number                                  ${return_value.replace(' ', '')}
# переход на 2-й єтап
  Run Keyword If  '${MODE}' == 'framework_selection' and '${ROLE}' == 'viewer'
  ...   WaitVisibilityAndClickElement     xpath=(.//*[contains(text(),'Другі етапи')]/..//./*[@class='row']//a)[last()]
  [Return]    ${return_value}

Отримати інформацію про замовника lots[0].minimalStep.amount
  ${return_value}=                  Отримати текст із поля для замовника             lots[0].minimalStep.amount
  Run Keyword And Return           Convert To Number                                  ${return_value.replace(' ', '')}

Отримати інформацію про замовника lots[0].title
  Run Keyword And Return                  Отримати текст із поля для замовника             lots[0].title

Отримати інформацію про замовника procuringEntity.name
  Run Keyword IF  '${MODE}' == 'framework_selection' and '${ROLE}' == 'viewer'  WaitVisibilityAndClickElement  xpath=(.//*[contains(text(),'Закупівля')])[1]
  Run Keyword And Return           Отримати текст із поля для замовника               procuringEntity.name

Отримати інформацію про замовника value.amount
  WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Закупівля')])[1]
  ${return_value}=                 Отримати текст із поля для замовника               value.amount
  Run Keyword And Return           Convert To Number                                  ${return_value.replace(' ', '')}

Отримати інформацію про замовника value.currency
  Run Keyword And Return           Отримати текст із поля для замовника               value.currency

Отримати інформацію про замовника items[0].description
  Run Keyword And Return           Отримати текст із поля для замовника               items[0].description

Отримати інформацію про замовника items[0].quantity
  ${return_value}=                 Отримати текст із поля для замовника               items[0].quantity
  Run Keyword And Return           Convert To Number                                  ${return_value}

###### provider
Отримати інформацію про посточальника agreements[0].agreementID
  WaitVisibilityAndClickElement    xpath=(.//*[@class='show-first-stage'][contains(text(),'Рамкова угода')])
  ${return_value}=                 Отримати текст із поля для посточальника    agreements[0].agreementID
  Go Back
  Sleep  2
  [Return]    ${return_value}

Отримати інформацію про посточальника value.currency
  ${return_value}=                 Отримати текст із поля для посточальника       value.amount
  Run Keyword And Return           convert_currency                               ${return_value}

Отримати інформацію про посточальника value.valueAddedTaxIncluded
  ${return_value}=                 Отримати текст із поля для посточальника       value.valueAddedTaxIncluded
  ${return_value}=                 convert_valueAddedTaxIncluded                  ${return_value}
  Run Keyword And Return           Convert To Boolean                             ${return_value}

Отримати інформацію про посточальника items[${index}].quantity
  WaitVisibilityAndClickElement    xpath=(.//*[@class='show-first-stage'][contains(text(),'Рамкова угода')])
  ${return_value}=                 Отримати текст із поля для посточальника    items[${index}].quantity
  Go Back
  Sleep  2
  [Return]    ${return_value}

Отримати інформацію про посточальника items[${index}].description
  ${return_value}=                 Отримати текст із поля для посточальника    items[${index}].description
  [Return]    ${return_value}

Отримати інформацію про посточальника minimalStep.amount
  Run Keyword And Return           uatenders.Отримати інформацію про посточальника lots[0].minimalStep.amount

Отримати інформацію про посточальника lots[0].minimalStep.amount
  ScrollToElementToFalse                      (//*[contains(text(),'Інформація про замовника')])[1]
  ${statusShowLots}=       Run Keyword And Return Status
  ...   Element Should Be Visible    xpath=(.//*[contains(text(),'Переглянути інформацію про лот')]/../*[@style='display: none;'])[1]
  Run Keyword IF   '${statusShowLots}' == 'PASS'   Run Keyword
  ...   WaitVisibilityAndClickElement       xpath=(.//*[contains(text(),'Переглянути інформацію про лот')])[1]
  Sleep  3
  ${return_value}=    Get Text    xpath=(.//*[contains(text(),'Мінімальний крок пониження')]/..//*[@class='amountValue'])[1]
  ${mainBsup}=        Get Text    xpath=(.//*[contains(text(),'Мінімальний крок пониження')]/..//*[@class='centPrice'])[1]
  ${return_value}=    Catenate    SEPARATOR=.   ${return_value}  ${mainBsup}
  Run Keyword And Return                string_to_float             ${return_value.replace(' ', '')}

#########################  Загальна інформація  ##############################
Отримати інформацію про замовника title
  Run Keyword And Return           Отримати текст із поля для замовника               title

Отримати інформацію про замовника title_en
  Run Keyword And Return           Отримати текст із поля для замовника               title_en

Отримати інформацію про замовника description
  Run Keyword And Return           Отримати текст із поля для замовника               description

Отримати інформацію про замовника tenderId
  WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Закупівля')])[1]
  Run Keyword And Return           Отримати текст із поля для замовника               tenderId

Отримати інформацію про замовника value.valueAddedTaxIncluded
  ${return_value}=                 Отримати текст із поля для замовника               value.valueAddedTaxIncluded
  ${return_value}=                 convert_valueAddedTaxIncluded                      ${return_value}
  Run Keyword And Return           Convert To Boolean                                 ${return_value}

Отримати інформацію про замовника minimalStep.amount
  ${return_value}=                 Отримати текст із поля для замовника               minimalStep.amount
######################################
  # for exclude Quinta errors added Sleeep for waiting create data
  ${suite_name}=    Fetch From Right    ${SUITE_NAME}   .
  Run Keyword IF   '${suite_name}' == 'Selection'   Run Keywords
  ...   Sleep  5 min
  ...   AND   uatenders.Перезавантажити сторінку з угодою
  ...   AND   Sleep  2 min
  ...   AND   Reload Page
  ...   AND   Sleep  10
######################################
  Run Keyword And Return           Convert To Number                                  ${return_value.replace(' ', '')}

Отримати інформацію про замовника procurementMethodType
  ${return_value}=                 Отримати текст із поля для замовника               procurementMethodType
  Run Keyword And Return           convert_method_type                                ${return_value}

Отримати інформацію про замовника mainProcurementCategory
  ${return_value}=                 Отримати текст із поля для замовника               mainProcurementCategory
  Run Keyword And Return           get_mainProcurementCategory                        ${return_value}

Отримати інформацію про замовника NBUdiscountRate
  ${return_value}=                 Отримати текст із поля для замовника               NBUdiscountRate
  ${return_value}=                 Evaluate                       ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                                  ${return_value}

Отримати інформацію про замовника minimalStepPercentage
  ${return_value}=                 Отримати текст із поля для замовника               minimalStepPercentage
  ${return_value}=                 Evaluate                       ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                                  ${return_value}

Отримати інформацію про замовника yearlyPaymentsPercentageRange
  ${return_value}=                 Отримати текст із поля для замовника               yearlyPaymentsPercentageRange
  ${return_value}=                 Evaluate                       ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                                  ${return_value}

Отримати інформацію про замовника fundingKind
  ${return_value}=                 Отримати текст із поля для замовника               fundingKind
  Run Keyword And Return           convert_fundingKind                                ${return_value}

Отримати інформацію із лоту про замовника lots[0].fundingKind
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text   xpath=((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table']//*[contains(text(),'Джерело фінансування лота:')]/../td)[1]
  Run Keyword And Return           convert_fundingKind                                ${return_value}

Отримати інформацію про замовника maxAwardsCount
  ${return_value}=                 Отримати текст із поля для замовника               maxAwardsCount
  Run Keyword And Return           Convert To Integer                                 ${return_value}

Отримати інформацію про замовника agreementDuration
  ${year}      Get Text         xpath=(.//*[@class='ad_years'])[1]
  ${month}     Get Text         xpath=(.//*[@class='ad_years'])[2]
  ${day}       Get Text         xpath=(.//*[@class='ad_years'])[3]
  ${hour}      Get Text         xpath=(.//*[@class='ad_years'])[4]
  ${minute}    Get Text         xpath=(.//*[@class='ad_years'])[5]
  ${second}    Get Text         xpath=(.//*[@class='ad_years'])[6]
  ${year_num}       Fetch From Left      ${year}      ${SPACE}
  ${year_wor}       Fetch From Right     ${year}      ${SPACE}
  ${year_wor_Y}=    Convert To String    Y
  ${month_num}      Fetch From Left      ${month}     ${SPACE}
  ${month_wor}      Fetch From Right     ${month}     ${SPACE}
  ${month_wor_Y}=   Convert To String    M
  ${day_num}        Fetch From Left      ${day}       ${SPACE}
  ${day_wor}        Fetch From Right     ${day}       ${SPACE}
  ${day_wor_Y}=     Convert To String    D
  ${hour_num}       Fetch From Left      ${hour}      ${SPACE}
  ${hour_wor}       Fetch From Right     ${hour}      ${SPACE}
  ${hour_wor_Y}=    Convert To String    H
  ${minute_num}     Fetch From Left      ${minute}    ${SPACE}
  ${minute_wor}     Fetch From Right     ${minute}    ${SPACE}
  ${minute_wor_Y}=  Convert To String    M
  ${second_num}     Fetch From Left      ${second}    ${SPACE}
  ${second_wor}     Fetch From Right     ${second}    ${SPACE}
  ${second_wor_Y}=  Convert To String    S
  ${return_value}     Catenate      P  ${year_num}  ${year_wor_Y}  ${month_num}  ${month_wor_Y}  ${day_num}  ${day_wor_Y}
  # T  ${hour_num}  ${hour_wor_Y}  ${minute_num}  ${minute_wor_Y}  ${second_num}  ${second_wor_Y}
  Run Keyword And Return           Convert To String                            ${return_value.replace(' ','')}

Отримати інформацію про посточальника value.amount
  ${return_value}=                 Отримати текст із поля для посточальника       value.amount
  Run Keyword And Return           Convert To Number                              ${return_value.replace(' ', '')}

Отримати інформацію про посточальника fundingKind
  ${return_value}=                 Отримати текст із поля для посточальника       fundingKind
  Run Keyword And Return           convert_fundingKind                            ${return_value}

Отримати інформацію про посточальника maxAwardsCount
  ${return_value}=                 Отримати текст із поля для посточальника               maxAwardsCount
  Run Keyword And Return           Convert To Integer                                 ${return_value}

Отримати інформацію про посточальника agreementDuration
  ${year}      Get Text         xpath=(.//*[@id='agreementDuration']/span)[1]
  ${month}     Get Text         xpath=(.//*[@id='agreementDuration']/span)[2]
  ${day}       Get Text         xpath=(.//*[@id='agreementDuration']/span)[3]
  # ${hour}      Get Text         xpath=(.//*[@class='ad_years'])[4]
  # ${minute}    Get Text         xpath=(.//*[@class='ad_years'])[5]
  # ${second}    Get Text         xpath=(.//*[@class='ad_years'])[6]
  ${year_num}       Fetch From Left      ${year}      ${SPACE}
  ${year_wor}       Fetch From Right     ${year}      ${SPACE}
  ${year_wor_Y}=    Convert To String    Y
  ${month_num}      Fetch From Left      ${month}     ${SPACE}
  ${month_wor}      Fetch From Right     ${month}     ${SPACE}
  ${month_wor_Y}=   Convert To String    M
  ${day_num}        Fetch From Left      ${day}       ${SPACE}
  ${day_wor}        Fetch From Right     ${day}       ${SPACE}
  ${day_wor_Y}=     Convert To String    D
  # ${hour_num}       Fetch From Left      ${hour}      ${SPACE}
  # ${hour_wor}       Fetch From Right     ${hour}      ${SPACE}
  # ${hour_wor_Y}=    Convert To String    H
  # ${minute_num}     Fetch From Left      ${minute}    ${SPACE}
  # ${minute_wor}     Fetch From Right     ${minute}    ${SPACE}
  # ${minute_wor_Y}=  Convert To String    M
  # ${second_num}     Fetch From Left      ${second}    ${SPACE}
  # ${second_wor}     Fetch From Right     ${second}    ${SPACE}
  # ${second_wor_Y}=  Convert To String    S
  ${return_value}     Catenate      P  ${year_num}  ${year_wor_Y}  ${month_num}  ${month_wor_Y}  ${day_num}  ${day_wor_Y}
  # T  ${hour_num}  ${hour_wor_Y}  ${minute_num}  ${minute_wor_Y}  ${second_num}  ${second_wor_Y}
  Run Keyword And Return           Convert To String                            ${return_value.replace(' ','')}

Отримати інформацію про посточальника procurementMethodType
  ${return_value}=                 Отримати текст із поля для посточальника               procurementMethodType
  Run Keyword And Return           convert_method_type          ${return_value}

#########################  Milestones  ##############################
Отримати інформацію про замовника milestones[${index}].code
  WaitVisibilityAndClickElement                  xpath=//a[text()[contains(.,'Закупівля')]]
  ${return_value}=      Отримати текст із поля для замовника                  milestones[${index}].code
  Run Keyword And Return               get_milestones_code                    ${return_value}

Отримати інформацію про замовника milestones[${index}].title
  ${return_value}=      Отримати текст із поля для замовника                  milestones[${index}].title
  Run Keyword And Return               set_milestones_title                   ${return_value}

Отримати інформацію про замовника milestones[${index}].percentage
  ${return_value}=      Отримати текст із поля для замовника                  milestones[${index}].percentage
  ${return_value}=                     Convert To String                      ${return_value.replace('.00', '')}
  Run Keyword And Return               Convert To Integer                     ${return_value}

Отримати інформацію про замовника milestones[${index}].duration.days
  ${return_value}=      Отримати текст із поля для замовника                  milestones[${index}].duration.days
  Run Keyword And Return               Convert To Integer                     ${return_value}

Отримати інформацію про замовника milestones[${index}].duration.type
  ${return_value}=      Отримати текст із поля для замовника                  milestones[${index}].duration.type
  Run Keyword And Return               get_milestones_duration_type           ${return_value}

Отримати інформацію про посточальника milestones[${index}].code
  ${return_value}=      Отримати текст із поля для посточальника              milestones[${index}].code
  Run Keyword And Return               get_milestones_code                    ${return_value}

Отримати інформацію про посточальника milestones[${index}].title
  ${return_value}=      Отримати текст із поля для посточальника              milestones[${index}].title
  Run Keyword And Return               set_milestones_title                   ${return_value}

Отримати інформацію про посточальника milestones[${index}].percentage
  ${return_value}=      Отримати текст із поля для посточальника              milestones[${index}].percentage
  ${return_value}=                     Convert To String                      ${return_value.replace('.00%', '')}
  Run Keyword And Return               Convert To Integer                     ${return_value}

Отримати інформацію про посточальника milestones[${index}].duration.days
  ${return_value}=      Отримати текст із поля для посточальника              milestones[${index}].duration.days
  ${return_value}=      Fetch From Left                   ${return_value}     ${SPACE}
  Run Keyword And Return               Convert To Integer                     ${return_value}

Отримати інформацію про посточальника milestones[${index}].duration.type
  ${return_value}=      Отримати текст із поля для посточальника              milestones[${index}].duration.type
  ${return_value}=      Remove String                     ${return_value}   ${SPACE}днів
  ${return_value}=      Fetch From Right                   ${return_value}     ${SPACE}
  Run Keyword And Return               get_milestones_duration_type           ${return_value}   #.replace(' ', '')}

#########################  Items  ##############################
Отримати значення поля items[0].description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' == 'uatenders_Provider' or '${username}' == 'uatenders_Provider1' or '${username}' == 'uatenders_Provide2'    Run Keywords
  ...   ScrollToElementToFalse                            (//*[contains(text(),'Інформація про замовника')])[1]
  ...   AND   Run Keyword And Return    Get Text    xpath=(.//*[@class='showLot']//*[contains(text(),'${item_id}')])[1]
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${item_id}')])[1]

Отримати значення поля items[0].description_ru
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${item_id}')]/..//*)[2]

Отримати значення поля items[0].description_en
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${item_id}')]/..//*)[2]

Отримати значення поля items[0].deliveryLocation.latitude
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Pass Execution     Майданчик не використовує deliveryLocation.latitude

Отримати значення поля items[0].deliveryLocation.longitude
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Pass Execution     Майданчик не використовує deliveryLocation.longitude

Отримати значення поля items[0].deliveryAddress.countryName
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.countryName'])

Отримати значення поля items[0].deliveryAddress.postalCode
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.postalCode'])

Отримати значення поля items[0].deliveryAddress.region
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.region'])[1]

Отримати значення поля items[0].deliveryAddress.locality
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.locality'])

Отримати значення поля items[0].deliveryAddress.streetAddress
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[@class='item-deliveryAddress.streetAddress'])

Отримати значення поля items[0].classification.scheme
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/..//*)/..//following-sibling::*//*[contains(@class,'item-classification.scheme')])
  Run Keyword And Return    convert_uatenders_string_to_common_string                         ${return_value}

Отримати значення поля items[0].classification.id
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-cpv'])/span[1]

Отримати значення поля items[0].classification.description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-cpv'])/span[2]
  Run Keyword And Return         convert_uatenders_string_to_common_string                         ${return_value}

Отримати значення поля items[0].additionalClassifications[0].scheme
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[contains(text(),'ДК 021:2015')])
  Run Keyword And Return         convert_uatenders_string_to_common_string                         ${return_value}

Отримати значення поля items[0].additionalClassifications[0].id
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-cpv'])/span[1]

Отримати значення поля items[0].additionalClassifications[0].description
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='item-cpv'])/span[2]

Отримати значення поля items[0].unit.name
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='data-item-amount-code'])
  Run Keyword And Return    convert_uatenders_items                   ${return_value}

Отримати значення поля items[0].unit.code
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  Pass Execution     Майданчик не використовує unit.code

Отримати значення поля items[0].quantity
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='data-item-amount'])
  Run Keyword And Return             Convert To Number                                             ${return_value}

Отримати значення поля items[0].deliveryDate.startDate
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='data-item-delivery-start'])
  Run Keyword And Return                convert_auction_date                                      ${return_value}

Отримати значення поля items[0].deliveryDate.endDate
  [Arguments]   ${item_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='data-item-delivery-end'])
  Run Keyword And Return                convert_auction_date                                      ${return_value}

############################################################################################################
######################################    Lot operations    ################################################
Створити лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot}
  Додати ще один лот_лот №1_lot     ${lot}

Створити лот із предметом закупівлі
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  lot
  ...      ${ARGUMENTS[3]} ==  item
  uatenders.Створити лот       ${ARGUMENTS[0]}   ${ARGUMENTS[1]}   ${ARGUMENTS[2]}
  Додати предмет_items до нового лоту_лот №1_item         ${ARGUMENTS[3]}
  WaitVisibilityAndClickElement               xpath=//*[@type='submit']

Отримати інформацію із лоту про замовника lots[0].title
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' != 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для замовника.title  ${lot_id}
  Run Keyword IF   '${username}' == 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для посточальника.title  ${lot_id}
  [Return]    ${return_value}

Значення поля для замовника.title
  [Arguments]   ${lot_id}
  Run Keyword And Return    Get Text    xpath=(//*[contains(text(),'${lot_id}')])[1]

Значення поля для посточальника.title
  [Arguments]   ${lot_id}
  Run Keyword And Return    Get Text    xpath=(//*[contains(@class,'lotsTitle') and contains(text(),'${lot_id}')])

Отримати інформацію із лоту про замовника lots[0].title_en
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'${lot_id}')])/../*[position() mod 2 = 0])[1]

Отримати інформацію із лоту про замовника lots[0].description
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword And Return    Get Text    xpath=((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='desc'])

Отримати інформацію із лоту про замовника lots[0].value.amount
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' != 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для замовника.value.amount  ${lot_id}
  Run Keyword IF   '${username}' == 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для посточальника.value.amount  ${lot_id}
  [Return]    ${return_value}

Значення поля для замовника.value.amount
  [Arguments]   ${lot_id}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Очікувана вартість закупівлі:')])/..//span[1]
  Run Keyword And Return                Convert To Number                                         ${return_value.replace(' ', '')}

Значення поля для посточальника.value.amount
  [Arguments]   ${lot_id}
  ${return_value}=              Отримати текст із поля для посточальника              value.amount
  ${mainBsup}=                      Get Text                             xpath=(//*[@class='mainBsup'])
  ${return_value}=                  Catenate               SEPARATOR=.   ${return_value}  ${mainBsup}
  Run Keyword And Return                string_to_float             ${return_value.replace(' ', '')}

Отримати інформацію із лоту про замовника lots[0].value.currency
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Очікувана вартість закупівлі:')])/..//span[2]
  Run Keyword And Return                Convert To String                                         ${return_value}

Отримати інформацію із лоту про замовника lots[0].value.valueAddedTaxIncluded
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Очікувана вартість закупівлі:')])/..//span[3]
  ${return_value}=                  Convert To String                                       ${return_value}
  ${return_value}=             convert_valueAddedTaxIncluded                                ${return_value}
  Run Keyword And Return                Convert To Boolean                                  ${return_value}

Отримати інформацію із лоту про замовника lots[0].minimalStep.amount
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' != 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для замовника.minimalStep.amount  ${lot_id}
  Run Keyword IF   '${username}' == 'uatenders_Provider'
  ...     Run Keyword And Return    uatenders.Значення поля для посточальника.minimalStep.amount  ${lot_id}
  [Return]    ${return_value}

Значення поля для замовника.minimalStep.amount
  [Arguments]   ${lot_id}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Розмір мінімального кроку пониження ціни:')])/..//span[1]
  Run Keyword And Return                Convert To Number                                    ${return_value.replace(' ', '')}

Значення поля для посточальника.minimalStep.amount
  [Arguments]   ${lot_id}
  ${return_value}=              Отримати текст із поля для посточальника              minimalStep.amount
  ${mainSup}=                      Get Text                             xpath=(//*[text()[contains(.,'Мінімальний крок пониження')]]/..//*[@class='centPrice'])
  ${return_value}=                  Catenate               SEPARATOR=.   ${return_value}  ${mainSup}
  Run Keyword And Return        string_to_float                          ${return_value.replace(' ', '')}

Отримати інформацію із лоту про замовника lots[0].minimalStep.currency
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Розмір мінімального кроку пониження ціни:')])/..//span[2]
  Run Keyword And Return                Convert To String                                   ${return_value}

Отримати інформацію із лоту про замовника lots[0].minimalStep.valueAddedTaxIncluded
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  Run Keyword And Return        uatenders.Отримати інформацію із лоту про замовника lots[0].value.valueAddedTaxIncluded  ${lot_id}  ${username}  ${tender_uaid}

Отримати інформацію із лоту про замовника lots[0].status
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Статус:')])/..//span[1]
  Run Keyword And Return          convert_status                 ${return_value}

Отримати інформацію із лоту про замовника lots[0].minimalStepPercentage
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Мінімальний крок підвищення показника ефективності:')])/../td[1]
  ${return_value}=                 Evaluate                        ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                        ${return_value}

Отримати інформацію із лоту про замовника lots[0].yearlyPaymentsPercentageRange
  [Arguments]   ${lot_id}  ${username}  ${tender_uaid}
  ${return_value}=    Get Text    xpath=(((//*[contains(text(),'Лоти')]//following::*)[contains(text(),'${lot_id}')]//following::*[@class='clean-table'][1])//*[contains(text(),'Фіксований відсоток суми скорочення витрат замовника:')])/../td[1]
  ${return_value}=                 Evaluate                        ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                        ${return_value}

Отримати інформацію про посточальника lots[0].value.amount
  ${return_value}=              Отримати текст із поля для посточальника              lots[0].value.amount
  Run Keyword And Return                string_to_float             ${return_value.replace(' ', '')}

Отримати інформацію про посточальника minimalStepPercentage
  ${return_value}=    Get Text    xpath=(//*[contains(text(),'Мінімальний крок підвищення показника ефективності:')]/../*[position() mod 2 = 0])
  ${return_value}=                 Evaluate                        ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                        ${return_value}

Отримати інформацію про посточальника yearlyPaymentsPercentageRange
  ${return_value}=    Get Text    xpath=(.//*[@class='totalSumm'])[1]
  ${return_value}=                 Evaluate                        ${return_value.replace(' %', '')}/${100}
  ${return_value}=                 Evaluate              "%.5f" % ${return_value}
  Run Keyword And Return           Convert To Number                        ${return_value}

Змінити лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${fieldname}  ${fieldvalue}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement             xpath=//*[text()='Редагувати']
  ${fieldNameLot}=                    Convert To String                      ${fieldname}
  ${fieldNameLot}=        convert_uatenders_string_to_common_string          ${fieldNameLot}
  ${fieldValueLot}=                   Convert To String                      ${fieldvalue}
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  Run Keyword If    '${fieldname}' == 'value.amount'     Run Keywords
  ...   Input Text                        name=lots[0][${fieldNameLot}]            ${fieldValueLot}
  ...   AND  WaitVisibilityAndClickElement     xpath=(.//*[contains(@class,'budjet-step-interest')])
  ...   AND  WaitVisibilityAndClickElement     name=lots[0][minimal_step]
  ...   ELSE IF      '${fieldname}' == 'minimalStep.amount'     Run Keywords
  ...     Clear Element Text               xpath=(.//*[contains(@class,'budjet-step-interest')])
  ...   AND  Input Text           name=lots[0][${fieldNameLot}]            ${fieldValueLot}
  uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  uatenders.DismissAlertPopUp

Видалити предмет закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${item_id}  ${lot_id}
  ScrollToElementToFalse                          (.//*[contains(text(),'Загальна інформація')])[1]
  WaitVisibilityAndClickElement             xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  ScrollToElementToFalse                                   (.//*[contains(text(),'Конкретна назва предмета закупівлі')])[last()]
  WaitVisibilityAndClickElement             xpath=(.//*[contains(@value,'${item_id}')]/../../..//button)[1]
  uatenders.DismissAlertPopUp

Додати предмет закупівлі в лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}  ${items}
  Run Keyword And Ignore Error         WaitVisibilityAndClickElement      xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  : FOR  ${index}  IN RANGE  1  #${items_count}  #${item_block_count}
  \  WaitVisibilityAndClickElement      xpath=(.//*[@class='item-section well lot-container'])//*[contains(@value,'${lot_id}')]/../../../..//*[contains(@class,'add-item-section')]
  \  Sleep  2
  \  Run Keyword If   '${mode}' != 'negotiation' or '${mode}' != 'negotiation.quick' or '${mode}' == 'reporting'
  \  ...   Додати предмет до EU/UA/Below/NegotiationAndQuick/Reporting   ${items}  ${1}  ${0}
  \  Run Keyword If   '${mode}' == 'negotiation' or '${mode}' == 'negotiation.quick'    Run Keyword
  \  ...    Додати предмет до Negotiation    ${items}  ${1}
  uatenders.DismissAlertPopUp
  uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}

Додати предмет до Negotiation
  [Arguments]  ${item}  ${index_items}
  [Documentation]
  ...   defoultLot_index:  Defoult index of lot (default 0)
  ${lotUnit}=                        Get From Dictionary             ${item.unit}              name
  ${unit_name}=                          get_unit_id                 ${lotUnit}
  ${delivery_end_date}=              Get From Dictionary             ${item.deliveryDate}      endDate
  ${delivery_end_date}=         convert_datetime_for_delivery        ${delivery_end_date}
  ${delivery_end_plus_date}=    convert_datetime_for_delivery_plus_2_day       ${delivery_end_date}
  ${lotRegionName}=                 Get From Dictionary         ${item.deliveryAddress}       region
  ${lotRegionId}=                      get_unit_id                                                   ${lotRegionName}
  #lotItem
  Input Text                                    xpath=(((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Конкретна назва предмета закупівлі')])[${item_index}]//following-sibling::*//*)[1]   ${item.description}
  Input Text                                    xpath=(((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Конкретна назва предмета закупівлі')])[${item_index}]//following-sibling::*/*)[2]    ${item.quantity}
  Select From List                              xpath=(((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Конкретна назва предмета закупівлі')])[${item_index}]//following-sibling::*/*)[3]    ${unit_name}
  #cpv
  ScrollToElement                              (//*[contains(text(),'Інформація про номенклатуру')])[1]/..//*[. = 'Інформація про номенклатуру']
  Input text                                    xpath=(((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Класифікатор')])[${item_index}]//following-sibling::*/*)[1]                          ${item.classification.id}
  Run Keyword And Ignore Error        WaitVisibilityAndClickElement       xpath=(//*[@class='ui-menu-item'])[1]
  Run Keyword And Ignore Error        WaitVisibilityAndClickElement       xpath=(//*[@class='ui-menu-item'])[2]
  Run Keyword And Ignore Error        WaitVisibilityAndClickElement       xpath=(//*[@class='ui-menu-item'])[${item_index}]
  Run Keyword And Ignore Error         Input Text                          xpath=((//*[contains(text(),'Строки поставки')])[${item_index}]//following-sibling::*//input)[2]            ${delivery_end_plus_date}
  #select Delivery Address
  WaitVisibilityAndClickElement       xpath=(((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[. = 'Адреса поставки'])[${item_index}]//following-sibling::*//*)[5]
  Run Keyword If     '${lotRegionName}' == 'місто Київ'           Run Keyword
  ...     Select From List   xpath=((((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Строки поставки')])[${item_index}]/..//following-sibling::*)//*[. = 'Регіон'][1]/.//following-sibling::*/*)[3]      26     #26 м. Киев
  ...      ELSE IF   '${lotRegionName}' != 'місто Київ'         Run Keyword
  ...     Select From List   xpath=((((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Строки поставки')])[${item_index}]/..//following-sibling::*)//*[. = 'Регіон'][1]/.//following-sibling::*/*)[3]         ${lotRegionId}
  Input Text            xpath=((((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Строки поставки')])[${item_index}]/..//following-sibling::*)//*[. = 'Поштовий індекс'][1]/.//following-sibling::*/*)[2]     ${item.deliveryAddress.postalCode}
  Input Text            xpath=((((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Строки поставки')])[${item_index}]/..//following-sibling::*)//*[. = 'Населений пункт'][1]/.//following-sibling::*/*)[2]     ${item.deliveryAddress.locality}
  Input Text            xpath=((((//*[contains(text(),'Інформація про номенклатуру')])[${defoultLot_index}]/..//*[contains(text(),'Строки поставки')])[${item_index}]/..//following-sibling::*)//*[. = 'Поштова адреса'][1]/.//following-sibling::*/*)[2]      ${item.deliveryAddress.streetAddress}

Завантажити документ в лот
  [Arguments]  ${username}  ${filepath}  ${tender_uaid}  ${lot_id}
  Run Keyword if   'Неможливість додати документацію' in '${TEST_NAME}'      Run Keyword
  ...   uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  Run Keyword And Ignore Error         WaitVisibilityAndClickElement               xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    Run Keywords
  ...   ScrollToElement               (.//*[contains(text(),'Дані контактної особи замовника')])[1]
  ...   AND  ClearFildAndInputText    name=contact_name_en    Petrov
  Execute Javascript  window.document.evaluate("//*[@id='edit-form-submit']//b[2]", document, null, XPathResult.FIRST_ORDERED_NODE_TYPE, null).singleNodeValue.scrollIntoView(true);
  Execute Javascript  window.frames[0]; document.querySelector( "input[name='lots[0][files][]']" ).style.display = "block";
  Sleep  1
  Choose File       name=lots[0][files][]           ${filepath}
  Sleep  3
  uatenders.DismissAlertPopUp

Видалити лот
  [Arguments]  ${username}  ${tender_uaid}  ${lot_id}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  uatenders.Скасувати лот     ${username}  ${tender_uaid}  ${lot_id}

Скасувати лот
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  lot_id
  ...      ${ARGUMENTS[3]} ==  cancellation_reason
  ...      ${ARGUMENTS[4]} ==  document
  ...      ${ARGUMENTS[5]} ==  new_description
  ...      ${ARGUMENTS[6]} ==  filepath
  ${ARGUMENTS[6]}=                            get_file_path
  WaitVisibilityAndClickElement                          xpath=(//*[text()[contains(.,'${ARGUMENTS[2]}')]]/following::*[@id='lot-cancel'])
  Sleep  1
  Alert Should Be Present  text=Ви впевнені, що хочете відмінити лот?
  Sleep  1
  Run Keyword if   'Можливість видалення лоту' in '${TEST_NAME}'        Run Keyword
  ...    Input Text                               name=reason           Ви впевнені, що хочете відмінити лот?
  Run Keyword And Ignore Error     Input Text     name=reason            ${ARGUMENTS[5]}
  Execute Javascript  window.frames[0]; document.querySelector( "input[name='cancel']" ).style.display = "block";
  Sleep  1
  Choose File       css=[name*=cancel]           ${ARGUMENTS[6]}
  Sleep  1
  WaitVisibilityAndClickElement                          xpath=//*[@type='submit']
  WaitVisibilityAndClickElement                          xpath=(//*[text()[contains(.,'Активувати заявку')]])

Отримати інформацію з документа до лоту
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  lot_id
  ...      ${ARGUMENTS[3]} ==  doc_id
  ...      ${ARGUMENTS[4]} ==  field
  WaitVisibilityAndClickElement           xpath=(//*[contains(@class,'${ARGUMENTS[2]}')
  ${return_value}=  Run Keyword And Return  uatenders.Отримати інформацію із лоту  ${ARGUMENTS[0]}  ${ARGUMENTS[1]}  ${ARGUMENTS[3]}
  [Return]  ${return_value}

Отримати документ до лоту
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  lot_id
  ...      ${ARGUMENTS[3]} ==  doc_id
  ScrollToElement                                                   (//*[text()[contains(.,'Лоти')]]/..//*[. = 'Лоти'])
  Sleep  1
  WaitVisibilityAndClickElement                               xpath=(//*[contains(@class,'${ARGUMENTS[2]}') and contains(.,'Документація по лоту')])
  ${file_name}=                    Get Text                   xpath=//a[contains(text(),'${ARGUMENTS[3]}')]
  ${url}=                     Get Element Attribute           xpath=//a[contains(text(),'${ARGUMENTS[3]}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}

#########################  Questions  ##############################
Перехід на запитання замовником до тендеру/предмету/лоту
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  #отримати з тендеру
  Run Keyword IF   'запитання на тендер' in '${TEST_NAME}'    Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   ScrollToElement                        (//div[@class='col-md-12']/p)[1]    # заголовок тендера
  ...   AND   Element Should Be Visible        xpath=(//*[contains(@class,'${tender_uaid}') and contains(.,'Запитання')])      Запитання
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'${tender_uaid}') and contains(.,'Запитання')])
  #отримати з лоту
  Run Keyword IF   'на всі лоти' in '${TEST_NAME}'    Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   ScrollToElement                        (//*[text()[contains(.,'Документи')]]/..//*[. = 'Документи'])[1]
  ...   AND   Element Should Be Visible        xpath=(//*[text()[contains(.,'Лоти')]]/..//*[text()[contains(.,'Запитання')]])[1]      Запитання
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Лоти')]]/..//*[text()[contains(.,'Запитання')]])[1]
  #отримати з предмету
  Run Keyword IF   'на всі предмети' in '${TEST_NAME}'    Wait Until Keyword Succeeds   10 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   ScrollToElement                        (//*[text()[contains(.,'Критерії оцінки') or contains(.,'Перелік')]])[1]
  ...   AND   Element Should Be Visible        xpath=(//*[text()[contains(.,'Перелік')]]/..//*[text()[contains(.,'Запитання')]])[1]      Запитання
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Перелік')]]/..//*[text()[contains(.,'Запитання')]])[1]

Перехід на запитання до участником тендеру/предмету/лоту
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'${tender_uaid}') and contains(.,'Запитання')])
  Sleep  2

Отримати значення поля questions[0].title
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання замовником до тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  ...    ELSE IF   '${username}' != 'uatenders_Owner' or '${username}' != 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання до участником тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  ScrollToElementToFalse                             (//*[contains(text(),'${question_id}')]/..//following::*)[1]
  Run Keyword And Return        Get Text       xpath=(//*[contains(text(),'${question_id}')]/..//following::*)[1]

Отримати значення поля questions[0].description
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання замовником до тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' == 'uatenders_Provider' or '${username}' == 'uatenders_Provider1' or '${username}' == 'uatenders_Provider2'
  ...   uatenders.Перехід на запитання до участником тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  ScrollToElementToFalse                             (//*[contains(text(),'${question_id}')]/..//following::*)[2]
  Run Keyword And Return        Get Text           xpath=(//*[contains(text(),'${question_id}')]/..//following::*)[3]

Відповісти на запитання
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}  ${question_id}
  #відповісти на тендер
  Run Keyword IF   'запитання на тендер' in '${TEST_NAME}' or 'запитання до тендера' in '${TEST_NAME}'          Run Keywords
  ...   WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'${tender_uaid}') and contains(.,'Запитання')])
  ...   AND   WaitVisibilityAndClickElement    xpath=//*[text()='Відповісти']
  ...   AND   Input Text                       name=answer                                ${answer_data.data.answer}
  ...   AND   WaitVisibilityAndClickElement    xpath=//*[@class='btn btn-xs btn-default']
  ...   AND   Sleep  3
  #відповісти на предмет
  Run Keyword IF   'запитання на всі предмети' in '${TEST_NAME}'      Run Keywords
  ...   Reload Page
  ...   AND   ScrollToElement                        (//*[text()[contains(.,'Критерії оцінки') or contains(.,'Перелік')]])[1]
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Перелік')]]/..//*[text()[contains(.,'Запитання')]])[1]
  ...   AND   Sleep  1
  ...   AND   WaitVisibilityAndClickElement    xpath=((//*[@id='lotquestions-0-item-0'])//*[contains(text(),'Відповісти')])[1]
  ...   AND   Input Text                       xpath=((//*[@id='lotquestions-0-item-0'])//*[@name='answer'])[1]      ${answer_data.data.answer}
  ...   AND   Sleep  1
  ...   AND   WaitVisibilityAndClickElement    xpath=((//*[@id='lotquestions-0-item-0'])//*[@value='Надіслати'])[1]
  ...   AND   Sleep  3
  #відповісти на лот
  Run Keyword IF   'запитання на всі лоти' in '${TEST_NAME}'          Run Keywords
  ...   ScrollToElementToFalse                       //a[text()[contains(.,'Закупівля')]]
  ...   AND   WaitVisibilityAndClickElement    xpath=//a[text()[contains(.,'Закупівля')]]
  ...   AND   ScrollToElementToFalse                 (//*[text()[contains(.,'Документи')]]/..//*[. = 'Документи'])[1]
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Лоти')]]/..//*[text()[contains(.,'Запитання')]])[1]
  ...   AND   WaitVisibilityAndClickElement    xpath=((//*[@id='lotquestions-0'])//*[contains(text(),'Відповісти')])[1]
  ...   AND   Input Text                       xpath=((//*[@id='lotquestions-0'])//*[@name='answer'])[1]      ${answer_data.data.answer}
  ...   AND   Sleep  1
  ...   AND   WaitVisibilityAndClickElement    xpath=((//*[@id='lotquestions-0'])//*[@value='Надіслати'])[1]
  ...   AND   Sleep  3

Отримати значення поля questions[0].date
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання замовником до тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' != 'uatenders_Owner' or '${username}' != 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання до участником тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  ScrollToElementToFalse                             (//*[contains(text(),'${question_id}')]/..//following::*)[1]
  Run Keyword And Return        Get Text       xpath=(//*[contains(text(),'${question_id}')]/..//following::*)[1]

Отримати значення поля questions[0].answer
  [Arguments]   ${question_id}  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error        Click Element      xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'
  ...   uatenders.Перехід на запитання замовником до тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  Run Keyword IF   '${username}' == 'uatenders_Provider' or '${username}' == 'uatenders_Provider1' or '${username}' == 'uatenders_Provider2'
  ...   uatenders.Перехід на запитання до участником тендеру/предмету/лоту  ${question_id}  ${username}  ${tender_uaid}
  ScrollToElementToFalse                             (//*[contains(text(),'${question_id}')]/..//following::*[@class='bs-callout bs-callout-success']//p)
  Run Keyword And Return        Get Text       xpath=(//*[contains(text(),'${question_id}')]/..//following::*[@class='bs-callout bs-callout-success']//p)

Задати запитання на тендер
  [Arguments]   ${username}  ${tender_uaid}  ${question}
  ScrollToElement                                   (//div[@class='col-md-12']/p)[1]    # заголовок тендера
  Sleep  1
  WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'${tender_uaid}')])[1]
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'questionRightSide')])//*[contains(text(),'Задати запитання')]
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement               xpath=(//*[contains(text(),'По закупівлі')])[1]
  uatenders.Задати запитання на предмет/лот/тендер   ${question}

Задати запитання на лот
  [Arguments]   ${username}  ${tender_uaid}  ${lot_id}  ${question}
  Run Keyword IF   '${username}' != 'uatenders_Provider'   Run Keywords
  ...   Sleep  1
  ...   AND   ScrollToElement       (//*[text()[contains(.,'Нецінові показники')]]/..//*[. = 'Нецінові показники'])
  ...   AND   Sleep  1
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'${lot_id}') and contains(.,'Задати запитання')])
  Run Keyword IF   '${username}' == 'uatenders_Provider'   Run Keywords
  ...   WaitVisibilityAndClickElement                     xpath=(//*[contains(@class,'${tender_uaid}')])[1]
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'questionRightSide')])//*[contains(text(),'Задати запитання')]
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(text(),'По лоту')])[1]
  uatenders.Задати запитання на предмет/лот/тендер   ${question}

Задати запитання на предмет
  [Arguments]   ${username}  ${tender_uaid}  ${item_id}  ${question}
  Run Keyword IF   '${username}' != 'uatenders_Provider'   Run Keywords
  ...   Sleep  1
  ...   AND   ScrollToElement       (//*[text()[contains(.,'Критерії оцінки')]]/..//*[. = 'Критерії оцінки'])
  ...   AND   Sleep  1
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'${item_id}') and contains(.,'Задати запитання')])
  Run Keyword IF   '${username}' == 'uatenders_Provider'   Run Keywords
  ...   WaitVisibilityAndClickElement                     xpath=(//*[contains(@class,'${tender_uaid}')])[1]
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'questionRightSide')])//*[contains(text(),'Задати запитання')]
  ...   AND   WaitVisibilityAndClickElement               xpath=(//*[contains(text(),'По предмету')])[1]
  uatenders.Задати запитання на предмет/лот/тендер   ${question}

Задати запитання на предмет/лот/тендер
  [Arguments]   ${question}
  Input Text                          name=title                                      ${question.data.title}
  Input Text                          name=question                                   ${question.data.description}
  WaitVisibilityAndClickElement               xpath=(//*[contains(@type,'submit') and contains(@value,'Задати')])

#########################  Limited  ##############################
Отримати інформацію про замовника cause
  Run Keyword And Return           Отримати текст із поля для замовника              cause

Отримати інформацію про замовника causeDescription
  Run Keyword And Return           Отримати текст із поля для замовника              causeDescription

Отримати інформацію про замовника procuringEntity.address.countryName
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.address.countryName

Отримати інформацію про замовника procuringEntity.address.locality
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.address.locality

Отримати інформацію про замовника procuringEntity.address.postalCode
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.address.postalCode

Отримати інформацію про замовника procuringEntity.address.region
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.address.region

Отримати інформацію про замовника procuringEntity.address.streetAddress
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.address.streetAddress

# страница Закупівля
Отримати інформацію про замовника procuringEntity.identifier.legalName
  WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Закупівля')]][. = 'Закупівля']))
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.identifier.legalName
Отримати інформацію про замовника procuringEntity.identifier.id
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.identifier.id
Отримати інформацію про замовника procuringEntity.identifier.scheme
  Run Keyword And Return           Convert To String           UA-EDR

Отримати інформацію про замовника procuringEntity.contactPoint.name
  WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Закупівля')]][. = 'Закупівля']))
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.contactPoint.name
Отримати інформацію про замовника procuringEntity.contactPoint.telephone
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.contactPoint.telephone
Отримати інформацію про замовника procuringEntity.contactPoint.email
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.contactPoint.email
Отримати інформацію про замовника procuringEntity.contactPoint.url
  Run Keyword And Return           Отримати текст із поля для замовника              procuringEntity.contactPoint.url

Отримати інформацію про замовника documents[0].title
  Run Keyword And Return           Отримати текст із поля для замовника              documents[0].title

#########################  Даты  ##############################
Отримати інформацію про замовника enquiryPeriod.startDate
  ${return_value}=                     Отримати текст із поля для замовника                enquiryPeriod.startDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника enquiryPeriod.endDate
  ${return_value}=                     Отримати текст із поля для замовника                enquiryPeriod.endDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника tenderPeriod.startDate
  ${return_value}=                     Отримати текст із поля для замовника                tenderPeriod.startDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника tenderPeriod.endDate
  ${return_value}=                     Отримати текст із поля для замовника                tenderPeriod.endDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника complaintPeriod.endDate
  ${return_value}=                     Отримати текст із поля для замовника                complaintPeriod.endDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

# преобразуется с tenderPeriod.endDate
Отримати інформацію про замовника qualificationPeriod.endDate
  Run Keyword And Ignore Error             ScrollToAndClickElement                (//*[text()[contains(.,'Закупівля')]])
  Run Keyword And Ignore Error             WaitVisibilityAndClickElement    xpath=(//*[text()[contains(.,'Закупівля')]])
  ${return_value}=        Отримати текст із поля для замовника                      qualificationPeriod.endDate
  ${return_value}=    Run Keyword If    '${MODE}' == 'open_competitive_dialogue'
  ...     convert_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min       ${return_value}
  ...   ELSE IF    '${MODE}' != 'open_competitive_dialogue'
  ...     convert_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min       ${return_value}
  [Return]         ${return_value}

# нуна добвить путь
Отримати інформацію про замовника enquiryPeriod.clarificationsUntil
  ${return_value}=                     Get Element Attribute           xpath=(//*[contains(@class,'clarificationsUntil')])@class
  ${return_value}=                     Get Element Attribute           xpath=(//*[contains(@class,'clarificationsUntil')])@value
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника auctionPeriod.startDate
  ${return_value}=                     Отримати текст із поля для замовника                auctionPeriod.startDate
  Run Keyword And Return               convert_timeDate                                    ${return_value}

Отримати інформацію про замовника auctionPeriod.endDate
  ${return_value}=   Run Keyword if   '${MODE}' == 'belowThreshold'   Run Keyword
  ...   uatenders.Отримати атрибут з датою
  ...     ELSE IF    '${MODE}' != 'belowThreshold'      Get Text          xpath=(.//*[@class='complaint_date_end'])
  Run Keyword And Return          convert_timeToTime              ${return_value}

Отримати інформацію із лоту про замовника lots[0].auctionPeriod.startDate
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'Дата початку аукціону')])/..//span[2])[1]
  Run Keyword And Return          convert_timeDate                 ${return_value}

Отримати інформацію про посточальника enquiryPeriod.startDate
  ${return_value}=                     Отримати текст із поля для посточальника            enquiryPeriod.startDate
  Run Keyword And Return     provider_convert_enquiry_tender_startDate              ${return_value}

Отримати інформацію про посточальника enquiryPeriod.endDate
  ${return_value}=                     Отримати текст із поля для посточальника            enquiryPeriod.endDate
  Run Keyword And Return     provider_convert_enquiry_tender_endDate                ${return_value}

Отримати інформацію про посточальника tenderPeriod.startDate
  ${return_value}=                     Отримати текст із поля для посточальника            tenderPeriod.startDate
  Run Keyword And Return     provider_convert_enquiry_tender_startDate              ${return_value}

Отримати інформацію про посточальника tenderPeriod.endDate
  ${return_value}=                     Отримати текст із поля для посточальника            tenderPeriod.endDate
  Run Keyword And Return     provider_convert_enquiry_tender_endDate                ${return_value}

# преобразуется с tenderPeriod.endDate
Отримати значення поля посточальника qualificationPeriod.endDate
  WaitVisibilityAndClickElement                                xpath=(//*[text()[contains(.,'Умови')]])[1]
  ${return_value}=        Отримати текст із поля для посточальника          qualificationPeriod.endDate
  Run Keyword And Return    convertTextMonth_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min        ${return_value}

Отримати інформацію про посточальника qualificationPeriod.endDate
  WaitVisibilityAndClickElement                                xpath=(//*[text()[contains(.,'Умови')]])[1]
  ${return_value}=        Отримати текст із поля для посточальника          qualificationPeriod.endDate
  Run Keyword And Return    convertTextMonth_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min        ${return_value}

Отримати інформацію про посточальника complaintPeriod.endDate
  ${return_value}=                     Отримати текст із поля для посточальника                complaintPeriod.endDate
  Run Keyword And Return               provider_convert_enquiry_tender_startDate               ${return_value}

#########################  Awards  ##############################
#  address
Отримати інформацію про замовника awards[0].suppliers[0].address.countryName
  Run Keyword IF    '${MODE}' == 'negotiation'   Run Keywords
  ...      uatenders.Переміститься до хедера
  ...      AND   WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...   ELSE IF     '${MODE}' != 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].address.countryName
Отримати інформацію про замовника awards[0].suppliers[0].address.locality
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].address.locality
Отримати інформацію про замовника awards[0].suppliers[0].address.postalCode
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].address.postalCode
Отримати інформацію про замовника awards[0].suppliers[0].address.region
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].address.region
Отримати інформацію про замовника awards[0].suppliers[0].address.streetAddress
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].address.streetAddress

#  contactPoint (страница Закупівля)_
Отримати інформацію про замовника awards[0].documents[0].title
  Run Keyword IF    '${MODE}' == 'negotiation'   Run Keywords
  ...      uatenders.Переміститься до хедера
  ...      AND   WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...   ELSE IF     '${MODE}' != 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].documents[0].title

Отримати інформацію про замовника awards[0].suppliers[0].contactPoint.telephone
  Run Keyword IF    '${MODE}' == 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...   ELSE IF     '${MODE}' != 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].contactPoint.telephone
Отримати інформацію про замовника awards[0].suppliers[0].contactPoint.name
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].contactPoint.name
Отримати інформацію про замовника awards[0].suppliers[0].contactPoint.email
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].contactPoint.email
Отримати інформацію про замовника awards[0].suppliers[0].contactPoint.url
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].contactPoint.url

#  identifier (страница Переможця)
Отримати інформацію про замовника awards[0].suppliers[0].identifier.legalName
  Run Keyword IF    '${MODE}' == 'negotiation'   Run Keywords
  ...      uatenders.Переміститься до хедера
  ...      AND   WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...   ELSE IF     '${MODE}' != 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].identifier.legalName
Отримати інформацію про замовника awards[0].suppliers[0].identifier.id
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].identifier.id
Отримати інформацію про замовника awards[0].suppliers[0].identifier.scheme
  Run Keyword And Return               Convert To String           UA-EDR

#  страница Переможець
Отримати інформацію про замовника awards[0].status
  Run Keyword IF    '${MODE}' == 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...   ELSE IF     '${MODE}' != 'negotiation'
  ...      WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  ${return_value}=                     Отримати текст із поля для замовника              awards[0].status
  Run Keyword And Return               convert_status                  ${return_value}
Отримати інформацію про замовника awards[0].suppliers[0].name
  Run Keyword And Return               Отримати текст із поля для замовника              awards[0].suppliers[0].name
Отримати інформацію про замовника awards[0].value.valueAddedTaxIncluded
  ${return_value}=                 Отримати текст із поля для замовника              awards[0].value.valueAddedTaxIncluded
  ${return_value}=           Fetch From Right         ${return_value}     (
  ${return_value}=           Fetch From Left         ${return_value}     )
  Run Keyword And Return               convert_valueAddedTaxIncluded              ${return_value}

Отримати інформацію про замовника awards[0].value.currency
  ${return_value}=                 Отримати текст із поля для замовника              awards[0].value.currency
  Run Keyword And Return           Convert To String         ${return_value.split(' (')[1].replace(')', '')}
Отримати інформацію про замовника awards[0].value.amount
  ${return_value}=       Отримати текст із поля для замовника       awards[0].value.amount
  ${return_value}=                  Fetch From Left                 ${return_value}     .
  Run Keyword And Return            string_to_float                 ${return_value.replace(' ', '')}
Отримати інформацію про замовника awards[${index}].complaintPeriod.endDate
  Reload Page
  Sleep  3
  Reload Page
  Sleep  3
  Run Keyword IF    '${MODE}' == 'negotiation'
  ...    WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Учасники')]][. = 'Учасники']))
  ...  ELSE IF     '${MODE}' == 'reporting'
  ...    WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Переможець')]][. = 'Переможець']))
  ...  ELSE IF     '${MODE}' != 'reporting' or '${MODE}' != 'negotiation'
  ...    WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Закупівля')]][. = 'Закупівля']))
# reporting
  ${return_value}=   Run Keyword if   '${MODE}' == 'belowThreshold' or '${MODE}' == 'open_framework'   Run Keyword
  ...   uatenders.Отримати атрибут з датою
  ...    ELSE IF    '${MODE}' != 'belowThreshold' or '${MODE}' != 'open_framework'
  ...   Get Text   xpath=(.//*[contains(@class,'complaint_date_end') or contains(@class,'complaintPeriodEndDate')])
  ${return_value}=   Run Keyword if   '${MODE}' == 'belowThreshold' or '${MODE}' == 'open_framework'
  ...    convert_timeToTime              ${return_value}
  ...   ELSE IF    '${MODE}' != 'belowThreshold' or '${MODE}' != 'open_framework'
  ...    convert_timeDate              ${return_value}

  Run Keyword IF    '${MODE}' == 'open_framework'   Go Back
  [Return]  ${return_value}

Отримати атрибут з датою
  WaitVisibilityAndClickElement     xpath=((//*[contains(text(),'Пропозиції')]))[1]
  Sleep  5
  Run Keyword And Return     Get Element Attribute     xpath=(.//*[@class='hidden complaintEndDate_0'])@value

Отримати інформацію про замовника items[${index}].unit.code
  WaitVisibilityAndClickElement        xpath=((//*[text()[contains(.,'Закупівля')]][. = 'Закупівля']))
  ${return_value}=       Отримати текст із поля для замовника              items[${index}].unit.code
  Run Keyword And Return               convert_unit_code               ${return_value}

##################################################################
#########################  Contracts  ##############################
Отримати інформацію про замовника contracts[${index}].value.amount
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${return_value}=                      Отримати текст із поля для замовника              contracts[${index}].value.amount
 # слип от "Calling method 'get_tender' failed: ConnectionError: ('Connection aborted.', BadStatusLine('No status line received - the server has closed the connection',))"
  Run Keyword IF    '${MODE}' == 'negotiation'   Sleep   700
  Run Keyword And Return                string_to_float                ${return_value}

Отримати інформацію про замовника contracts[${index}].value.amountNet
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${return_value}=                      Отримати текст із поля для замовника              contracts[${index}].value.amountNet
  ${return_value}=                      Fetch From Left                ${return_value}     ${SPACE}
  Run Keyword And Return                string_to_float                ${return_value}

Отримати інформацію про замовника contracts[${index}].dateSigned
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
# документы и дата подписания, для viewer & provider, выводятся после подписания "остоточного рішення" контракта => tests non-critical
  Run Keyword IF   'Відображення дати підписання угоди' == '${TEST_NAME.replace('\'', '')}'   Sleep  15 min
  ${return_value}=                      Отримати текст із поля для замовника              contracts[${index}].dateSigned
  Run Keyword And Return                convert_timeDate               ${return_value}

Отримати інформацію про замовника contracts[${index}].period.startDate
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${return_value}=                      Отримати текст із поля для замовника              contracts[${index}].period.startDate
  Run Keyword And Return                convert_delivery_endDate       ${return_value}

Отримати інформацію про замовника contracts[${index}].period.endDate
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Контракти') or contains(.,'Визначити учасників')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  ${return_value}=                      Отримати текст із поля для замовника              contracts[${index}].period.endDate
  Run Keyword And Return                convert_delivery_endDate       ${return_value}

##################################################################
#########################  Planning  ##############################
Внести зміни в план
  [Arguments]  ${username}  ${tender_uaid}  ${parameter}  ${value}
  uatenders.Пошук плану по ідентифікатору    ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement           xpath=//*[text()='Редагування']
  Run Keyword If  '${parameter}' == 'budget.description'  ClearFildAndInputText  name=description           ${value}
  Run Keyword If  '${parameter}' == 'items[0].quantity'   ClearFildAndInputText  name=items[0][quantity]    ${value}
  ...   ELSE IF   '${parameter}' == 'items[1].quantity'   ClearFildAndInputText  name=items[1][quantity]    ${value}
  ${budgetAmount}=   Run Keyword If  '${parameter}' == 'budget.amount'
  ...   Convert To String      ${value}
  ${budgetAmount}=   Run Keyword If  '${parameter}' == 'budget.amount'   ClearFildAndInputText  name=amount   ${budgetAmount}
  ${deliveryEndDate}=   Run Keyword If   '${parameter}' == 'items[0].deliveryDate.endDate' or '${parameter}' == 'items[1].deliveryDate.endDate'
  ...   convert_items_delivery_endDate   ${value}
  Run Keyword If      '${parameter}' == 'items[0].deliveryDate.endDate'
  ...   ClearFildAndInputText  name=items[0][delivery_end_date]        ${deliveryEndDate}
  ...      ELSE IF   '${parameter}' == 'items[1].deliveryDate.endDate'
  ...   ClearFildAndInputText  name=items[1][delivery_end_date]        ${deliveryEndDate}
  ${budgetStartDate}=  Run Keyword If  '${parameter}' == 'budget.period'  Get From Dictionary  ${value}  startDate
  ${budgetEndDate}=    Run Keyword If  '${parameter}' == 'budget.period'  Get From Dictionary  ${value}  endDate
  ${budgetStartDate}=   Run Keyword If   '${parameter}' == 'budget.period'
  ...   convert_budget_period   ${budgetStartDate}
  ${budgetEndDate}=   Run Keyword If   '${parameter}' == 'budget.period'
  ...   convert_budget_period   ${budgetEndDate}
  Run Keyword If      '${parameter}' == 'budget.period'
  ...   ClearFildAndInputText  name=start_date        ${budgetStartDate}
  ...      ELSE IF   '${parameter}' == 'budget.period'
  ...   ClearFildAndInputText  name=end_date        ${budgetEndDate}
  uatenders.Підписати ЕЦП   ${username}  ${tender_uaid}

Додати предмет закупівлі в план
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  uatenders.Пошук плану по ідентифікатору    ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement           xpath=//*[text()='Редагування']
  ${index_xpath}=   Get Webelements       xpath=(.//*[@class='item-container item-section'])
  ${index}=  Get_Length  ${index_xpath}
  WaitVisibilityAndClickElement           xpath=(.//*[contains(@class,'add-item-section-plan')])[1]
  Input Text                          name=items[${index}][description]              ${item.description}
  ${quantityItems}=                   Convert To String                                ${item.quantity}
  Input Text                          name=items[${index}][quantity]                 ${quantityItems}
  Select From List                    xpath=//*[@name="items[${index}][unit_id]"]    ${item.unit.name}
  ${deliveryEndDate}=  Convert Date   ${item.deliveryDate.endDate}          result_format=%d.%m.%Y
  Input Text                          name=items[${index}][delivery_end_date]        ${deliveryEndDate}
  Input Text                          name=items[${index}][cpv]                      ${item.classification.id}      #24910000-6     #${classificationID}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'ui-menu-item')])[last()]
  uatenders.Підписати ЕЦП   ${username}  ${tender_uaid}

Видалити предмет закупівлі плану
  [Arguments]  ${username}  ${tender_uaid}  ${item}
  uatenders.Пошук плану по ідентифікатору    ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement           xpath=//*[text()='Редагування']
  WaitVisibilityAndClickElement           xpath=(.//*[contains(@value,'${item}')]/../../..//button)[1]
  uatenders.Підписати ЕЦП   ${username}  ${tender_uaid}

Отримати інформацію про план поля status
  ${return_value}=                 Отримати текст плана із поля               status
  Run Keyword And Return           get_status_plan                   ${return_value}

Отримати інформацію про план поля tender.procurementMethodType
  ${return_value}=                 Отримати текст плана із поля               tender.procurementMethodType
  Run Keyword And Return           convert_method_type               ${return_value}

Отримати інформацію про план поля procuringEntity.name
  Run Keyword And Return           Отримати текст плана із поля               procuringEntity.name

Отримати інформацію про план поля procuringEntity.identifier.scheme
  Run Keyword And Return           Convert To String           UA-EDR

Отримати інформацію про план поля procuringEntity.identifier.id
  Run Keyword And Return           Отримати текст плана із поля               procuringEntity.identifier.id

Отримати інформацію про план поля procuringEntity.identifier.legalName
  Run Keyword And Return           Отримати текст плана із поля               procuringEntity.identifier.legalName

Отримати інформацію про план поля classification.description
  ${return_value}=                 Отримати текст плана із поля               classification.description
  Run Keyword And Return           Get Substring         ${return_value}     11

Отримати інформацію про план поля classification.scheme
  ${return_value}=                 Отримати текст плана із поля               classification.scheme
  Run Keyword And Return    convert_uatenders_string_to_common_string                 ${return_value}

Отримати інформацію про план поля classification.id
  ${return_value}=                 Отримати текст плана із поля               classification.id
  Run Keyword And Return           Fetch From Left         ${return_value}     ${SPACE}

Отримати інформацію про план поля budget.amount
  ${return_value}=                 Отримати текст плана із поля              budget.amount
  ${mainSup}=                      Get Text                             xpath=(//*[text()[contains(.,'Планована сума закупівлі')]]/..//*[@class='centPrice'])
  ${return_value}=                 Catenate               SEPARATOR=.   ${return_value}  ${mainSup}
  Run Keyword And Return           string_to_float             ${return_value.replace(' ', '')}
Отримати інформацію про замовника budget.amount
  ${return_value}=                 Отримати текст плана із поля              budget.amount
  ${mainSup}=                      Get Text                             xpath=(//*[text()[contains(.,'Планована сума закупівлі')]]/..//*[@class='centPrice'])
  ${return_value}=                 Catenate               SEPARATOR=.   ${return_value}  ${mainSup}
  Run Keyword And Return           string_to_float             ${return_value.replace(' ', '')}

Отримати інформацію про план поля budget.description
  Run Keyword And Return           Отримати текст плана із поля               budget.description

Отримати інформацію про план поля budget.currency
  ${return_value}=                 Отримати текст плана із поля               budget.currency
  Run Keyword And Return           convert_currency                   ${return_value}

Отримати інформацію про план поля tender.tenderPeriod.startDate
  ${return_value}=                     Отримати текст плана із поля            tender.tenderPeriod.startDate
  Run Keyword IF   '${role}' == 'viewer'   #Run Keyword
  ...   Run Keyword And Return    convert_tenderPeriod_startDate              ${return_value}
  ...  ELSE IF     '${role}' == 'tender_owner'   #Run Keyword
  ...   Run Keyword And Return    provider_convert_enquiry_tender_endDate              ${return_value}

Отримати інформацію про план поля items[${index}].quantity
  ${return_value}=              Отримати текст плана із поля              items[${index}].quantity
  ${return_value}=      Fetch From Left         ${return_value}     ${SPACE}
  Run Keyword And Return        Convert To Number                ${return_value}
  ${return_value}=    Get Text    xpath=((//*[contains(text(),'${item_id}')]/../*)/..//following-sibling::*//*[@class='data-item-amount'])
  Run Keyword And Return          Convert To Number                           ${return_value}

Отримати інформацію про план поля items[${index}].unit.name
  ${return_value}=           Отримати текст плана із поля              items[${index}].unit.name
  ${return_value}=           Fetch From Right         ${return_value}     ${SPACE}
  Run Keyword And Return     convert_uatenders_string_to_ClaimsStatus     ${return_value}

Отримати інформацію про план поля items[${index}].unit.code
  ${return_value}=              Отримати текст плана із поля              items[${index}].unit.code
  ${return_value}=              Fetch From Right      ${return_value}     ${SPACE}
  Run Keyword And Return        convert_unit_code                         ${return_value}

Отримати інформацію про план поля items[${index}].id
  Run Keyword And Return       Отримати текст плана із поля               items[${index}].id

Отримати інформацію про план поля items[${index}].scheme
  Run Keyword And Return       Отримати текст плана із поля               items[${index}].scheme

Отримати інформацію про план поля items[${index}].description
  Run Keyword And Return       Отримати текст плана із поля               items[${index}].description

Отримати інформацію про план поля items[${index}].deliveryDate.endDate
  ${return_value}=             Отримати текст плана із поля               items[${index}].deliveryDate.endDate
  Run Keyword And Return           convert_delivery_endDate               ${return_value}   #.replace(' ,', ',')}

Отримати інформацію про план поля items[${index}].classification.id
  ${return_value}=            Отримати текст плана із поля                items[${index}].classification.id
  Run Keyword And Return      Fetch From Left         ${return_value}     ${SPACE}

Отримати інформацію про план поля items[${index}].classification.description
  Run Keyword And Return     Отримати текст плана із поля                 items[${index}].classification.description

Отримати інформацію про план поля items[${index}].classification.scheme
  ${return_value}=             Отримати текст плана із поля               items[${index}].classification.scheme
  Run Keyword And Return    convert_uatenders_string_to_common_string     ${return_value}

######################################    ЗМІНИТИ    ################################################
Внести зміни в тендер
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  uatenders.Оновити сторінку з тендером  ${username}  ${tender_uaid}
  Run Keyword if   'редагувати тендер після продовження періоду' in '${TEST_NAME}'
  ...   uatenders.Пошук тендера по ідентифікатору     ${username}   ${tender_uaid}
  Run Keyword if   'внести зміни у тендер після запитання' in '${TEST_NAME}'
  ...   uatenders.Пошук тендера по ідентифікатору     ${username}   ${tender_uaid}
  Run Keyword if   'Неможливість редагувати однопредметний тендер менше ніж за 2 дні' in '${TEST_NAME}'    Fail
  ScrollToElementToFalse                        (.//*[contains(text(),'Загальна інформація')])[1]
  WaitVisibilityAndClickElement           xpath=//*[text()='Редагувати']
  ${return_value}=  Run Keyword  Змінити поле в тендері на ${fieldname}  ${fieldvalue}
  ScrollToElementToFalse               (.//h3[contains(text(),'Дати')])
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  Sleep  1
  uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  Run Keyword if   'Можливість змінити дату закінчення періоду подання пропозиції на 10 днів' == '${TEST_NAME.replace('\'', '')}'
  ...   uatenders.Додати дату періоду доставки   ${fieldvalue}
  uatenders.DismissAlertPopUp
  [Return]  ${return_value}

Додати дату періоду доставки
  [Arguments]  ${fieldvalue}
  ${deliveryEndDate}=    Convert Date        ${fieldvalue}            result_format=%d-%m-%Y %H:%M
  ${dateEndDate}=        convert_datetime_for_delivery_plus_25_day    ${deliveryEndDate}
  ${dateStartDate}=      convert_datetime_for_delivery_plus_2_day     ${deliveryEndDate}
  ClearFildAndInputText       xpath=(.//*[@name='lots[0][items][0][delivery_date_end]'])    ${dateEndDate}
  ClearFildAndInputText       xpath=(.//*[@name='lots[0][items][0][delivery_date_start]'])    ${dateStartDate}

Змінити поле в тендері на description
  [Arguments]   ${description}
  Run Keyword And Return    Input Text    name=description         ${description}

Змінити поле в тендері на tenderPeriod.endDate
  [Arguments]   ${endDate}
  ${tenderEndDate}=   convert_enquiry_tenderPeriod    ${endDate}
  Run Keyword And Return    Input Text    name=tender_end_date     ${tenderEndDate}

Змінити поле в тендері на maxAwardsCount
  [Arguments]   ${maxAwardsCount}
  Run Keyword And Return    Input Text    name=max_awards_count    ${maxAwardsCount}

Змінити поле в тендері на items[0].quantity
  [Arguments]   ${items_0_Quantity}
  ${quantityItems}=                   Convert To String                                ${items_0_Quantity}
  Run Keyword And Return    ClearFildAndInputText    xpath=(.//*[@name='lots[0][items][0][quantity]'])[1]    ${quantityItems}

#######################################################
  # Возможность в тендере подписать ЕЦП
#######################################################
Підписати ЕЦП
  [Arguments]  @{ARGUMENTS}
  ${filepath}=                            get_file_path_key
  Run Keyword if   'укласти угоду для закупівлі' in '${TEST_NAME}'       Run Keyword
  ...   WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Підписати договір')])[1]
  ...     ELSE IF  'укласти угоду для закупівлі' != '${TEST_NAME}'       Run Keyword
  ...   WaitVisibilityAndClickElement    xpath=(//*[contains(.,'Підписати ЕЦП') and contains(@class,'btn-success') or contains(@class,'sign-btn') or contains(text(),'Підписати договір') or contains(text(),'Опублікувати') or contains(text(),'Підтвердити кваліфікацію')])[1]
  ${value}=                    Get Text           xpath=(//*[@id='PKStatusInfo'])[1]
  ${value}=                Convert To String        ${value.replace('\'', '')}    #убираем апостраф в слове ім'ям
  Wait Until Keyword Succeeds   10 x   2 s     Run Keyword IF   '${value}' != 'Ключ успішно завантажено'     Run Keywords
  ...   Run Keyword And Ignore Error    Click Element    xpath=(//button[contains(text(),'Зтерти')])[1]
  ...   AND   Select From List                    xpath=(//*[@id='CAsServersSelect'])[1]          Тестовий ЦСК АТ "ІІТ"    #Тестовий ЦСК АТ "ІІТ"
  ...   AND   Execute Javascript  window.frames[0]; document.querySelector( "input[id=PKeyFileInput]" ).style.display = "block";
  ...   AND   Choose File                         css=[id*=PKeyFileInput]                    ${filepath}
  ...   AND   Input Text                          xpath=//*[@id='PKeyPassword']            12345677
  ...   AND   WaitVisibilityAndClickElement       xpath=(//button[contains(text(),'Зчитати')])[1]
  ...   AND   Sleep  2
  ...   AND   Element Text Should Be              xpath=(//*[@id='PKStatusInfo'])[1]         Ключ успішно завантажено
  ...      ELSE IF   '${value}' == 'Ключ успішно завантажено'     Run Keyword
  ...   Element Should Be Visible                 xpath=(//*[@id='PKStatusInfo'])[1]               Ключ успішно завантажено
  Element Should Be Visible                       xpath=(//*[@id='PKStatusInfo'])[1]               Ключ успішно завантажено
  Wait Until Element Is Visible                   xpath=(//*[text()[contains(.,'Накладення ЕЦП')]]/..//*[contains(text(),'Підписати')])[1]     15
  WaitVisibilityAndClickElement                   xpath=(//*[text()[contains(.,'Накладення ЕЦП')]]/..//*[contains(text(),'Підписати')])[1]
  Sleep  2

######################################        ПОДАТИ Пропозицію        ################################################
Подати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}              #    ${lots_ids}=${None}  ${features_ids}=${None}
  uatenders.Пошук тендера по ідентифікатору    ${username}   ${tender_uaid}
  Run Keyword if   '${MODE}' == 'open_esco'
  ...   uatenders.Подати пропозицію на ESCO                    ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}
  ...    ELSE IF   '${MODE}' != 'open_esco'
  ...   uatenders.Подати пропозицію для усіх процедур          ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}

Подати пропозицію для усіх процедур
  [Arguments]  ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}
  Run Keyword if   'Неможливість подати цінову пропозицію' in '${TEST_NAME}'      Fail
  ${filepath}=                              get_file_path
  ${amount}=          Convert To String                   ${bid.data.lotValues[0].value.amount}

  Run Keyword IF   '${username}' == 'uatenders_Provider' or '${username}' == 'uatenders_Provider1' or '${username}' == 'uatenders_Provider2'   Run Keywords
  ...   uatenders.Переміститься до хедера
  ...   AND  WaitVisibilityAndClickElement           xpath=(//*[text()[contains(.,'Подати пропозицію')]])[1]

  Run Keyword IF   '${MODE}' == 'open_competitive_dialogue'
  ...    Run Keyword And Ignore Error    ClearFildAndInputText    css=.input-price    ${amount}
  ...      ELSE IF    '${MODE}' != 'open_competitive_dialogue'    ClearFildAndInputText    css=.input-price    ${amount}

  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[0]'])
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[0]']//option[2])
  Run Keyword And Ignore Error     ScrollToElement                   (//*[text()[contains(.,'Нецінові показники')]]/..//*[. = 'Нецінові показники'])

  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[1]'])
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[1]']//option[3])
  Run Keyword And Ignore Error     ScrollToElement                   (//*[text()[contains(.,'Нецінові показники')]]/..//*[. = 'Нецінові показники'])

  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[2]'])
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@name='values[2]']//option[4])

  Run Keyword IF   '${MODE}' != 'framework_selection'   Run Keywords
  ...   Sleep  1
  ...   AND   Choose File                             css=[name*=files]                         ${filepath}
  ...   AND   Sleep  4
  ...   AND   Select From List                        xpath=//*[@id='out-select']      25    # Технічні специфікації

  Sleep  1
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//label[@class='labelCheck'])
  Run Keyword And Ignore Error              Input Text               xpath=(//*[contains(text(),'Конфіденційні дані')]//..//*[contains(@placeholder,'Причина')])     Конфіденційні дані субпідрядника
  Run Keyword And Ignore Error              Input Text               name=subcontracting_details                        Iнформація про субпідрядника
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@class='consent'])[1]
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[@class='consent'])[2]
  WaitVisibilityAndClickElement                                      xpath=(//*[contains(@type,'submit') and contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни')])
  Run Keyword And Ignore Error     Wait Until Element Is Visible     xpath=(//*[text()[contains(.,'Документи завантажуються до ЦБД Prozorro.')]])     10

  Wait Until Keyword Succeeds   10 x   30 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи реєструються у ЦБД Prozorro.
  ...   AND   Reload Page
  ...   AND   Sleep  1
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію
  WaitVisibilityAndClickElement               xpath=(.//*[@class='returnTotender']/*)[1]
  Sleep  2

Подати пропозицію на ESCO
  [Arguments]  ${username}  ${tender_uaid}  ${bid}  ${lots_ids}=${None}  ${features_ids}=${None}
  ${filepath}=                              get_file_path
  ${yearlyPaymentsPercentageRange}=      Evaluate      ${bid.data.lotValues[0].value.yearlyPaymentsPercentage}*${100}
  ${yearlyPaymentsPercentageRange}=      Convert To String      ${yearlyPaymentsPercentageRange}
  Run Keyword if   'Неможливість подати цінову пропозицію' in '${TEST_NAME}'      Fail
  Run Keyword if   '${username}' == 'uatenders_Provider' or '${username}' == 'uatenders_Provider1' or '${username}' == 'uatenders_Provider2'
  ...     WaitVisibilityAndClickElement           xpath=(//*[contains(text(),'Подати пропозицію')])[1]
  Sleep  5
  Input Text        name=esco_year                         ${bid.data.lotValues[0].value.contractDuration.years}
  Input Text        name=esco_day                          ${bid.data.lotValues[0].value.contractDuration.days}
  Input Text        name=yearly_payments_percentage        ${yearlyPaymentsPercentageRange}
  ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${bid.data.lotValues[0].value}  annualCostsReduction
  @{value}=  Run Keyword If  ${presence}  Get From Dictionary  ${bid.data.lotValues[0].value}  annualCostsReduction
  ${cost_length}=  Get Length  ${value}
  :FOR  ${index}  IN RANGE  0  ${cost_length}
  \  ${cost}=  Convert To String  ${value[${index}]}
  \  ClearFildAndInputText           name=step[${index}]    ${cost}
  ${feature_index}=   Get Matching Xpath Count   xpath=(.//*[contains(@name,'values[')])
  :FOR  ${index}  IN RANGE  0  ${feature_index}
  \  WaitVisibilityAndClickElement     xpath=(//*[@name='values[${index}]'])
  \  WaitVisibilityAndClickElement     xpath=(//*[@name='values[0]']//option[${index+2}])
  \  Run Keyword And Ignore Error     ScrollToElement     (//*[text()[contains(.,'Нецінові показники')]]/..//*[. = 'Нецінові показники'])
  Sleep  1
  Choose File                             css=[name*=files]                         ${filepath}
  Sleep  2
  Select From List                        xpath=//*[@id='out-select']      27    # Цінова пропозиція
  Sleep  1
  ClearFildAndInputText             name=subcontracting_details             Iнформація про субпідрядника
  WaitVisibilityAndClickElement     xpath=(//*[@class='consent'])[1]
  WaitVisibilityAndClickElement     xpath=(//*[@class='consent'])[2]

  WaitVisibilityAndClickElement                                      xpath=(//*[contains(@type,'submit') and contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни') or contains(@value,'Подати пропозицію')])[1]
  Run Keyword And Ignore Error     Wait Until Element Is Visible     xpath=(//*[text()[contains(.,'Документи завантажуються до ЦБД Prozorro.')]])     10
  Wait Until Keyword Succeeds   10 x   15 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи реєструються у ЦБД Prozorro.
  ...   AND   Reload Page
  ...   AND   Sleep  1
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію

  WaitVisibilityAndClickElement               xpath=(.//*[@class='returnTotender']/*)[1]
  Sleep  2

######################################    ЗМІНИТИ    ################################################
Змінити цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}  ${fieldname}  ${fieldvalue}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement         xpath=(.//*[@class='Propoz-panel']//*[contains(text(),'Редагувати') or contains(text(),'Оновити')])
  Sleep  2
  Reload Page
  Sleep  2
  Reload Page
  # Run Keyword And Return If    '${fieldvalue}' == 'None'    uatenders.Дочекатися кнопку Активувати    ${username}  ${tender_uaid}
  Run Keyword And Return If    'після зміни умов тендера' in '${TEST_NAME}'    uatenders.Дочекатися кнопку Активувати    ${username}  ${tender_uaid}
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Активувати')])
  ${amount}=          float_to_string_2f                  ${fieldvalue}
  ${amount}=          Convert To String                   ${amount}
  ClearFildAndInputText                css=.input-price                      ${amount}
  WaitVisibilityAndClickElement        xpath=(.//*[@id='bid']//h1)[1]

  Run Keyword And Ignore Error      WaitVisibilityAndClickElement          xpath=(//*[contains(text(),'Активувати')])
  WaitVisibilityAndClickElement                   xpath=(//*[contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни') or contains(text(),'Оновити')])[1]
  Run Keyword And Ignore Error      Wait Until Element Is Visible          xpath=(//*[text()[contains(.,'Документи завантажуються до')]])     10
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Run Keyword IF    '${username}' == 'PASS'    Element Should Be Visible    xpath=(//*[@class='bidBlock docInfo']/p)[1]    Документи завантажуються до ЦБД Prozorro. Оновіть сторінку через хвилину.
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію

Дочекатися кнопку Активувати
  [Arguments]  ${username}  ${tender_uaid}
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible    xpath=(//*[contains(text(),'Вартість пропозиції')])    Вартість пропозиції
  ...   Reload Page
  ...   AND  Sleep  5
  ...   AND  WaitVisibilityAndClickElement          xpath=(//*[contains(text(),'Активувати')])
  ...   AND  Sleep  5
  ...   AND  Reload Page
  ...   AND  Sleep  5
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

########################################################################################################
######################################    Додати донора    #############################################
Додати донора
  [Arguments]  ${username}  ${tender_uaid}  ${funders_data}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement      xpath=//*[text()='Редагувати']
  WaitVisibilityAndClickElement      name=donor_checkbox
  Run Keyword IF   'Глобальний фонд' == '${funders_data.name}'
  ...   Select From List       name=donor_select       2
  ...    ELSE IF   'Світовий Банк' == '${funders_data.name}'
  ...   Select From List       name=donor_select       1
  uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[@name='lots[0][items][1][same_delivery_address]'])[1]
  WaitVisibilityAndClickElement     xpath=//*[@type='submit']
  Sleep  1
  Dismiss Alert
  Sleep  1

Видалити донора
  [Arguments]  ${username}  ${tender_uaid}  ${funders_data}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement     xpath=//*[text()='Редагувати']
  WaitVisibilityAndClickElement     name=donor_checkbox
  Sleep  2
  uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  WaitVisibilityAndClickElement     xpath=//*[@type='submit']
  Sleep  1
  Dismiss Alert
  Sleep  1

Отримати інформацію про замовника funders[0].name
  ScrollToElementToFalse                 (//*[contains(text(),'Загальна інформація')])[1]
  WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Донор')]/..//*[position() mod 2 = 0]/a)[1]
  Run Keyword And Return           Отримати текст із поля для замовника               funders[0].name

Отримати інформацію про замовника funders[0].address.countryName
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'withoutBorder')]//*[contains(@class,'countryName')])@value

Отримати інформацію про замовника funders[0].address.postalCode
  ${return_value}=                 Отримати текст із поля для замовника               funders[0].address.postalCode
  [Return]          ${return_value.split(',')[1].replace(' ','')}

Отримати інформацію про замовника funders[0].address.region
  ${return_value}=                 Отримати текст із поля для замовника               funders[0].address.region
  [Return]          ${return_value.split(',')[2].replace(' ','')}

Отримати інформацію про замовника funders[0].address.locality
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'withoutBorder')]//*[contains(@class,'localit')])@value

Отримати інформацію про замовника funders[0].address.streetAddress
  ${return_value}=                 Отримати текст із поля для замовника               funders[0].address.streetAddress
  ${return_value_1}=               Convert To String      ${return_value.split(', ')[4]}
  ${return_value_2}=               Convert To String      ${return_value.split(',')[5]}
  Run Keyword And Return           Catenate               SEPARATOR=,   ${return_value_1}  ${return_value_2}

Отримати інформацію про замовника funders[0].contactPoint.url
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(text(),'Сайт')]/..//*[position() mod 2 = 0]/a)@href

Отримати інформацію про замовника funders[0].identifier.legalName
  Run Keyword And Return           Отримати текст із поля для замовника               funders[0].identifier.legalName

Отримати інформацію про замовника funders[0].identifier.id
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'donorIdentifier')])@value

Отримати інформацію про замовника funders[0].identifier.scheme
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'donorScheme')])@value

Отримати інформацію про посточальника funders[0].name
  Run Keyword And Return           Отримати текст із поля для посточальника               funders[0].name

Отримати інформацію про посточальника funders[0].address.countryName
  ScrollToElementToFalse                 (//*[contains(text(),'Загальна інформація')])[1]
  WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Донор')]/..//*[position() mod 2 = 0]/a)[1]
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'withoutBorder')]//*[contains(@class,'countryName')])@value

Отримати інформацію про посточальника funders[0].address.postalCode
  ${return_value}=                 Отримати текст із поля для посточальника               funders[0].address.postalCode
  [Return]          ${return_value.split(',')[1].replace(' ','')}

Отримати інформацію про посточальника funders[0].address.region
  ${return_value}=                 Отримати текст із поля для посточальника               funders[0].address.region
  [Return]          ${return_value.split(',')[2].replace(' ','')}

Отримати інформацію про посточальника funders[0].address.locality
  Run Keyword And Return           Get Element Attribute                     xpath=(//*[contains(@class,'withoutBorder')]//*[contains(@class,'localit')])@value

Отримати інформацію про посточальника funders[0].address.streetAddress
  ${return_value}=                 Отримати текст із поля для посточальника               funders[0].address.streetAddress
  ${return_value_1}=               Convert To String      ${return_value.split(', ')[4]}
  ${return_value_2}=               Convert To String      ${return_value.split(',')[5]}
  Run Keyword And Return           Catenate               SEPARATOR=,   ${return_value_1}  ${return_value_2}

Отримати інформацію про посточальника funders[0].contactPoint.url
  Run Keyword And Return           Get Element Attribute              xpath=(//*[contains(text(),'Сайт')]/..//*[position() mod 2 = 0]/a)@href

Отримати інформацію про посточальника funders[0].identifier.legalName
  Run Keyword And Return           Отримати текст із поля для посточальника               funders[0].identifier.legalName

Отримати інформацію про посточальника funders[0].identifier.id
  Run Keyword And Return           Get Text                           xpath=(.//*[@class='donorModalTable']//td[2])[4]

Отримати інформацію про посточальника funders[0].identifier.scheme
  Run Keyword And Return           Convert To String           XM-DAC

######################################    СКАСУВАННЯ    ################################################
Скасувати цінову пропозицію
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement           xpath=(//*[contains(text(),'Редагувати пропозицію')])[1]
  WaitVisibilityAndClickElement           xpath=(//*[contains(text(),'Видалити пропозицію')])[1]
  Sleep  1
  #pop-up window
  WaitVisibilityAndClickElement           xpath=(//*[contains(@value,'Видалити')])[1]
  Element Should Be Visible       xpath=//*[@class='alert-cont']         Пропозиція надіслана на видалення
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

######################################    ЗАВАНТАЖИТИ    ################################################
Завантажити документ в ставку
  [Arguments]  ${username}  ${filePath}  ${tender_uaid}  ${doc_type}=documents  ${doc_type}=${None}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement                                      xpath=(.//*[@class='Propoz-panel']//*[contains(text(),'Редагувати')])
  Run Keyword And Ignore Error     ScrollToElementToFalse     (//*[contains(text(),'Підтверджую відсутність підстав для відмови')])[1]
  Sleep  1
  Choose File                      css=[name*=files]                 ${filePath}
  Sleep  2
  Run Keyword if   'завантажити фінансовий документ до пропозиції' in '${TEST_NAME}'
  ...   Select From List                 xpath=//*[@id='out-select']       27  #${doc_type}   # financial_documents
  ...     ELSE IF   'завантажити кваліфікаційний документ до пропозиції' in '${TEST_NAME}'
  ...   Select From List                 xpath=//*[@id='out-select']       26  #${doc_type}   # Документи, що підтверджують кваліфікацію
  ...     ELSE IF   'завантажити документ для критеріїв прийнятності до пропозиції' in '${TEST_NAME}'
  ...   Select From List                 xpath=//*[@id='out-select']       29  #${doc_type}   # Документи, що підтверджують відповідність
  ...     ELSE IF   'Відображення зміни' != '${TEST_NAME}'
  ...   Select From List                 xpath=//*[@id='out-select']       27  #${doc_type}   # financial_documents
  Sleep  2
  Run Keyword And Ignore Error      WaitVisibilityAndClickElement          xpath=(//*[contains(text(),'Активувати')])
  WaitVisibilityAndClickElement                   xpath=(//*[contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни') or contains(text(),'Оновити')])[1]
  Run Keyword And Ignore Error     Wait Until Element Is Visible     xpath=(//*[text()[contains(.,'Документи завантажуються до')]])     10
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи завантажуються до ЦБД Prozorro. Оновіть сторінку через хвилину.
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

######################################    Змінити    ################################################
Змінити документ в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${path}  ${doc_id}  ${doc_type}=documents
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${filepath}=              get_file_path
  ${doc_type}=              get_type_document              ${doc_type}
  WaitVisibilityAndClickElement                                      xpath=(//*[contains(text(),'Редагувати пропозицію')])[1]
  ScrollToElementToFalse                                (//*[contains(text(),'З 8 до 18')])[2]
  Sleep  1
  Choose File        css=[name*=files]        ${path}
  Run Keyword And Ignore Error     Select From List     xpath=//*[@id='out-select']       ${doc_type}   #${doc_type} == Цінова пропозиція
  Run Keyword And Ignore Error     Select From List     xpath=//*[@id='out-select']       27   #${doc_type} == Цінова пропозиція
  Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи завантажуються до ЦБД Prozorro. Оновіть сторінку через хвилину.
  Run Keyword And Ignore Error      WaitVisibilityAndClickElement          xpath=(//*[contains(text(),'Активувати')])
  WaitVisibilityAndClickElement                   xpath=(//*[contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни') or contains(text(),'Оновити')])[1]
  Run Keyword And Ignore Error      Wait Until Element Is Visible          xpath=(//*[text()[contains(.,'Документи завантажуються до')]])     10
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи завантажуються до ЦБД Prozorro. Оновіть сторінку через хвилину.
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

Змінити документацію в ставці
  [Arguments]  ${username}  ${tender_uaid}  ${doc_data}  ${doc_id}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${filepath}=              get_file_path
  WaitVisibilityAndClickElement                                      xpath=(//*[contains(text(),'Редагувати пропозицію')])[1]
  ScrollToElementToFalse                                (//*[contains(text(),'З 8 до 18')])[2]
  Sleep  1
  Choose File        css=[name*=files]        ${filepath}
  Sleep  2
  Select From List     xpath=//*[@id='out-select']       27 #  Цінова пропозиція
  WaitVisibilityAndClickElement     xpath=(//label[@class='labelCheck'])
  ClearFildAndInputText               xpath=(//*[contains(text(),'Конфіденційні дані')]//..//*[contains(@placeholder,'Причина')])     ${doc_data.data.confidentialityRationale}
  Run Keyword And Ignore Error      WaitVisibilityAndClickElement          xpath=(//*[contains(text(),'Активувати')])
  WaitVisibilityAndClickElement                   xpath=(//*[contains(@value,'Опублікувати') or contains(text(),'Опублікувати зміни') or contains(text(),'Оновити')])[1]
  Run Keyword And Ignore Error      Wait Until Element Is Visible          xpath=(//*[text()[contains(.,'Документи завантажуються до')]])     10
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[@class='bidBlock docInfo']/p)[1]      Документи завантажуються до ЦБД Prozorro. Оновіть сторінку через хвилину.
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(.//*[@id='bid']//*[contains(text(),'Видалити пропозицію')])[1]         Видалити пропозицію
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

##################################################################################################################
Отримати інформацію із пропозиції
  [Arguments]  ${username}  ${tender_uaid}  ${field}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Return     Отримати значення пропозиції із поля ${field}  ${username}  ${tender_uaid}

Отримати значення пропозиції із поля status
  [Arguments]   ${status}  ${tender_uaid}
  ${status}=                  Get Text              xpath=((.//*[@class='Propoz-body']//*[@class='row']/div[1])[2]/span)[1]
  Run Keyword And Return   convert_status_bids      ${status}

Отримати значення пропозиції із поля lotValues[0].value.amount
  [Arguments]  ${lotValues[0].value.amount}  ${tender_uaid}
  ${amountValue}=             Get Text              xpath=((.//*[@class='Propoz-body']//*[@class='amountValue'])[2])[1]
  ${centPrice}=               Get Text              xpath=((.//*[@class='Propoz-body']//*[@class='centPrice'])[2])[1]
  ${return_value}=            Catenate              SEPARATOR=.   ${amountValue}  ${centPrice}
  Run Keyword And Return   string_to_float          ${return_value.replace(' ', '')}

Отримати значення пропозиції із поля value.amount
  [Arguments]  ${lotValues[0].value.amount}  ${tender_uaid}
  ${amountValue}=             Get Text              xpath=((.//*[@class='Propoz-body']//*[@class='amountValue'])[2])[1]
  ${centPrice}=               Get Text              xpath=((.//*[@class='Propoz-body']//*[@class='centPrice'])[2])[1]
  ${return_value}=            Catenate              SEPARATOR=.   ${amountValue}  ${centPrice}
  Run Keyword And Return   string_to_float          ${return_value.replace(' ', '')}

Отримати посилання на аукціон для учасника
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Page Should Contain Element                       xpath=//a[@class="move-to-auction-page"]
  Run Keyword And Return   Get Element Attribute    xpath=//a[@class="move-to-auction-page"]@href

##################################################################################################################
######################################    Qualification operations    ################################################
##################################################################################################################
Перевірка статусу процедури
  [Arguments]     ${username}  ${tender_uaid}  ${waitStatus}
  Wait Until Keyword Succeeds   10 x   5 min     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[contains(@class,'label') and contains(text(),'${waitStatus}')])     ${waitStatus}
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(//*[contains(@class,'label') and contains(text(),'${waitStatus}')])     ${waitStatus}
  Run Keyword And Return    Get Text          xpath=(//*[contains(text(),'Статус:')]/../*[position() mod 2 = 0]/span)[1]

# TODO: добавить ключевые слова для
Завантажити документ рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${award_num}
  ${filepath}=                            get_file_path
  Wait Until Keyword Succeeds   15 x   1 min     Run Keywords
  ...   uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ...   AND   Element Should Be Visible       xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])[1]
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])
  Sleep  2
  Run Keyword And Ignore Error    Choose File    id=award-0-1             ${document}
  Run Keyword And Ignore Error    Choose File    id=award-1-1             ${document}
  Run Keyword And Ignore Error    Choose File    id=award-2-1             ${document}
  Sleep  2
  Run Keyword And Ignore Error    ScrollToElementToFalse    (//*[@type='submit'])[1]
  WaitVisibilityAndClickElement         xpath=(//*[@type='submit'])[1]

Підтвердити постачальника
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  ${filepath}=               get_file_path
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])[1]
 # Квалификация победителя по Допорогам проходит, через этот кейВорд
  Run Keyword if   'Неможливість' in '${TEST_NAME.replace('\'', '')}'   Run Keyword if   'open_framework' == '${MODE}'   Run Keywords
  ...   Sleep  10 min
  ...   AND   uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ...   AND   Sleep  2
  ...   AND   Reload Page
  ...   AND   Sleep  1

  # Run Keyword if   'Неможливість' in '${TEST_NAME.replace('\'', '')}'    Fail

  Run Keyword if   'підтвердити постачальника' in '${TEST_NAME}'    Run Keywords
  ...   Sleep  1
  ...   AND   Run Keyword And Ignore Error    Choose File    id=award-0-1             ${filepath}
  ...   AND   Run Keyword And Ignore Error    Choose File    id=award-1-1             ${filepath}
  ...   AND   Run Keyword And Ignore Error    Choose File    id=award-2-1             ${filepath}
  ...   AND   Sleep  3
  ...   AND   WaitVisibilityAndClickElement         xpath=(//*[@type='submit'])[1]
  ...   AND   Sleep  4

###################################################
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-xm btn-success') and contains(.,'Визнати переможцем')])[1]
###################################################
  Sleep  3
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     name=qualified
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     name=eligible
# Заявка на підтвердження переможця подана до ЦБД.
  Run Keyword And Ignore Error     Element Should Be Visible         xpath=(.//*[@class='alert alert-success'])[1]    Заявка на підтвердження переможця подана до ЦБД.
  Sleep  2
  Run Keyword And Ignore Error     uatenders.Переміститься до футера
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=//*[@value='Визнати переможцем']
  #Подпись ЕЦП
  uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  Sleep  2
  Reload Page

Дискваліфікувати постачальника
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  award_num
  ${filepath}=               get_file_path
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])
  Sleep  1
  Run Keyword And Ignore Error    Choose File    id=award-0-1             ${filepath}
  Run Keyword And Ignore Error    Choose File    id=award-1-1             ${filepath}
  Run Keyword And Ignore Error    Choose File    id=award-2-1             ${filepath}
  Sleep  3
  WaitVisibilityAndClickElement         xpath=//*[@type='submit']
###################################################
  WaitVisibilityAndClickElement         xpath=(.//*[contains(@class,'btn btn-xm')]//..//*[contains(.,'Відмінити') or contains(.,'Відхилити')])
###################################################
  Alert Should Be Present  text=Шановний користувач, відміна Вашого рішення про відхилення пропозиції можлива лише через процедуру оскарження в уповноваженому органі. Ви впевнені в бажанні відхилити пропозицію?
  Sleep  2
  Run Keyword IF    '${MODE}' == 'open_esco'    Select From List    xpath=//*[@name='unsuccessful_title[]']    4
  ...     ELSE IF   '${MODE}' != 'open_esco'    Select From List    xpath=//*[@name='unsuccessful_title[]']    1
  Sleep  5
  WaitVisibilityAndClickElement           xpath=(//*[@type='submit'])[1]
  #Подпись ЕЦП
  uatenders.Підписати ЕЦП   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}

Скасування рішення кваліфікаційної комісії
  [Arguments]  ${username}  ${tender_uaid}  ${award_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])
###################################################
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'btn btn-danger') and contains(.,'Відмінити результати кваліфікації')])
###################################################
  Sleep  2
  Reload Page
  Sleep  2

Обрати другу кваліфікації
  Run Keyword IF   '${MODE}' != 'open_competitive_dialogue' and '${MODE}' != 'open_framework' and '${MODE}' != 'openeu'   WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  # ...    ELSE IF   '${MODE}' != 'open_framework'              WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  ...    ELSE IF   '${MODE}' == 'open_competitive_dialogue'   WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]
  ...    ELSE IF   '${MODE}' == 'open_framework'              WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]
  ...    ELSE IF   '${MODE}' == 'openeu'              WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]

Обрати третю кваліфікації
  Run Keyword IF   '${MODE}' != 'open_competitive_dialogue' and '${MODE}' != 'open_framework'   WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  # ...    ELSE IF   '${MODE}' != 'open_framework'              WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  ...    ELSE IF   '${MODE}' == 'open_competitive_dialogue'   WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[3]
  ...    ELSE IF   '${MODE}' == 'open_framework'              WaitVisibilityAndClickElement   xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[3]

Підтвердити кваліфікацію
  [Arguments]  ${username}  ${tender_uaid}  ${qualification_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  ${filepath}=                            get_file_path
  WaitVisibilityAndClickElement           xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])[1]
######################################################################################################
  Run Keyword if   'підтвердити першу' in '${TEST_NAME}'
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  Run Keyword if   'підтвердити другу' in '${TEST_NAME}'   uatenders.Обрати другу кваліфікації
  Run Keyword if   'підтвердити третю' in '${TEST_NAME}'   uatenders.Обрати третю кваліфікації
  Sleep  2
  uatenders.Переміститься до футера
  Select From List                        xpath=//*[@name='status']      active    #Допустити до аукціону
  Run Keyword And Ignore Error    Execute Javascript  window.frames[0]; document.querySelector( "input[name='protocol']" ).style.display = "block";
  Sleep  2
  Run Keyword And Ignore Error    Choose File     css=[name*=protocol]     ${filepath}
  Sleep  2
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement            name=qualification_self_qualified
  Sleep  2
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement            name=qualification_self_eligible
  Sleep  2
  WaitVisibilityAndClickElement                                            xpath=//*[@type='submit']
  Sleep  10
  Reload Page
  Sleep  2
  Run Keyword And Ignore Error      uatenders.Переміститься до футера
  Run Keyword if    'open_framework' == '${MODE}'    uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  ...    ELSE IF    'open_framework' != '${MODE}'    Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Підтвердити кваліфікацію')])
  Sleep  60
  Reload Page
  Sleep  2

Відхилити кваліфікацію
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  qualification_num
  ...      ${ARGUMENTS[3]} ==  filepath
  uatenders.Пошук тендера по ідентифікатору   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ${ARGUMENTS[3]}=                            get_file_path
  WaitVisibilityAndClickElement           xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])
######################################################################################################
  Run Keyword if   'відхилити першу пропозицію' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  Run Keyword if   'відхилити другу пропозицію' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]
######################################################################################################
  Sleep  2
  uatenders.Переміститься до футера
  Sleep  5
  Select From List                        xpath=//*[@name='status']      unsuccessful    # Відхилити пропозицію
  Run Keyword And Ignore Error    Execute Javascript  window.frames[0]; document.querySelector( "input[name='protocol']" ).style.display = "block";
  Sleep  5
  Run Keyword And Ignore Error    Choose File             css=[name*=protocol]                   ${ARGUMENTS[3]}
  Sleep  3
  Select From List        name=unsuccessful_title[]              1
  Sleep  2
  WaitVisibilityAndClickElement                                  xpath=(//*[@type='submit'])[1]
  Sleep  10
  Reload Page
  Sleep  2
  Run Keyword And Ignore Error      uatenders.Переміститься до футера
  Sleep  2
  Run Keyword if    'open_framework' == '${MODE}'    uatenders.Підписати ЕЦП   ${ARGUMENTS[0]}   ${ARGUMENTS[1]}
  ...    ELSE IF    'open_framework' != '${MODE}'    Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Підтвердити кваліфікацію')])
  Sleep  60
  Reload Page
  Sleep  2


Завантажити документ у кваліфікацію
  [Arguments]  ${username}  ${document}  ${tender_uaid}  ${qualification_num}
  ${document}=                            get_file_path
  WaitVisibilityAndClickElement                  xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])
######################################################################################################
  Run Keyword if   'пропозиції першого' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  Run Keyword if   'пропозиції другого' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]
######################################################################################################
  Sleep  2
  uatenders.Переміститься до футера
  Sleep  5
  Select From List                        xpath=//*[@name='status']      active    # Допустити до аукціону
  Run Keyword And Ignore Error    Execute Javascript  window.frames[0]; document.querySelector( "input[name='protocol']" ).style.display = "block";
  Sleep  5
  Choose File          css=[name*=protocol]                   ${document}
  Sleep  3
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[@type='submit'])[1]
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

Скасувати кваліфікацію
  [Arguments]  ${username}  ${tender_uaid}  ${qualification_num}
  WaitVisibilityAndClickElement                  xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])
######################################################################################################
  Run Keyword if   'скасувати рішення кваліфікації для першої' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[1]
  Run Keyword if   'скасувати рішення кваліфікації для другої' in '${TEST_NAME}'       Run Keyword
  ...    WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Кваліфікація') or contains(text(),'Прекваліфікація')])[2]
######################################################################################################
  Sleep  2
  uatenders.Переміститься до футера
  WaitVisibilityAndClickElement    xpath=(//*[@value='Відмінити рішення'])[1]
  Sleep  60
  Reload Page
  Sleep  2

Затвердити остаточне рішення кваліфікації
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Прекваліфікація')])
  WaitVisibilityAndClickElement    xpath=(//*[contains(text(),'Пропозицї на розгляді')]/following-sibling::*//*[contains(text(),'Закінчити кваліфікацію') or contains(text(),'Сформувати протокол')])
  Sleep  4
  WaitVisibilityAndClickElement    xpath=(//*[@type='submit'])    # btnValue [Так]
  Sleep  15
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(//a[text()[contains(.,'Закупівля')]])
  Sleep  2
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}

Затвердити постачальників
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Кваліфікація')])[1]
  WaitVisibilityAndClickElement    xpath=(//a[text()[contains(.,'Закінчити кваліфікацію')]])[1]
  WaitVisibilityAndClickElement    xpath=(.//*[@class='modal-footer']/*[contains(@value,'Так')])[1]
#    ${object}' not found.
  Sleep  12 min

Встановити ціну за одиницю для контракту
  [Arguments]  ${username}  ${tender_uaid}  ${contract_data}
  ${filepath}=                            get_file_path
  WaitVisibilityAndClickElement         xpath=(//*[text()[contains(.,'Угоди')]])
  WaitVisibilityAndClickElement         xpath=(//*[contains(text(),'№')]/../../..//a)[1]
  uatenders.Переміститься до футера
  ${index}=  Set Variable If
  ...  'ціну за одиницю для першого контракту' in '${TEST_NAME}'   1
  ...  'ціну за одиницю для другого контракту' in '${TEST_NAME}'   2
  ...  'ціну за одиницю для третього контракту' in '${TEST_NAME}'  3
  WaitVisibilityAndClickElement     xpath=(.//*[@title-data="Редагувати"])[${index}]
  Sleep  3
  Choose File          id=contract-0                   ${filepath}
  Sleep  3
  ${value}=  float_to_string_2f  ${contract_data.data.unitPrices[0].value.amount}
  ${value}=  Evaluate  ${value}/${100}
  ${value}=  Convert To String  ${value}
  ClearFildAndInputText     xpath=(.//*[contains(@name,'prices')])[1]     ${value}
  WaitVisibilityAndClickElement    xpath=(//*[@value='Зберегти'])[1]
  Sleep  5
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Повернутися до угоди')])[1]

Зареєструвати угоду
  [Arguments]  ${username}  ${tender_uaid}  ${period}
  ${filepath}=                            get_file_path
  Sleep  3
  Choose File       id=agreement-0                   ${filepath}
  Sleep  3
  WaitVisibilityAndClickElement     name=date_signed
  Sleep  60
  Input Text        name=agreement_number         1234567890
  ${startDate}=  convert_agreement_delivery  ${period['startDate']}
  ${endDate}=    convert_agreement_delivery  ${period['endDate']}
  ClearFildAndInputText     name=period_start_date   ${startDate}
  ClearFildAndInputText     name=period_end_date     ${endDate}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]
  Sleep  5
  uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  Sleep  3
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Активувати угоду')])[1]
  Sleep  2
  Reload Page
  Sleep  2

Отримати доступ до угоди
  [Arguments]  ${username}  ${agreement_uaid}
  Run Keyword if   'Можливість отримати доступ до угоди' in '${TEST_NAME.replace('\'', '')}'   Sleep  5 min
  Wait Until Keyword Succeeds   15 x   45 s     Run Keywords
  ...   uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible    xpath=(//*[contains(@class,'btn-success') and contains(.,'Виконання угоди')])


Завантажити документ в рамкову угоду
  [Arguments]  ${username}  ${file_path}  ${agreementID}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn-warning') and contains(.,'Внести зміни до угоди')])

  WaitVisibilityAndClickElement   name=change[date_signed]
  ClearFildAndInputText           name=change[agreement_number]    1234567890
  ClearFildAndInputText           name=change[rationale]           Опис змін, що внесені до угоди
  Sleep  2
  Choose File                name=change[files][]             ${file_path}
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти') or contains(@value,'Оновити')])[1]


Внести зміну в угоду
  [Arguments]  ${username}  ${agreement_uaid}  ${change_data}
  ${filepath}=                            get_file_path
  Run Keyword And Ignore Error   WaitVisibilityAndClickElement   xpath=(//*[contains(@class,'btn-warning') and contains(.,'Внести зміни до угоди')])
  ${rationaleType}=  Set Variable  ${change_data.data.rationaleType}
  ${rationaleTypeNum}=   Run Keyword If   '${rationaleType}' == 'itemPriceVariation'   Set Variable   3
  ...   ELSE IF   '${rationaleType}' == 'taxRate'           Set Variable   6
  ...   ELSE IF   '${rationaleType}' == 'thirdParty'        Set Variable   7
  ...   ELSE IF   '${rationaleType}' == 'partyWithdrawal'   Set Variable   9
  Run Keyword If  '${rationaleType}' == 'taxRate' or '${rationaleType}' == 'itemPriceVariation' or '${rationaleType}' == 'thirdParty' or '${rationaleType}' == 'partyWithdrawal'
  ...   Run Keywords
  ...   WaitVisibilityAndClickElement    name=change[date_signed]
  ...   AND   ClearFildAndInputText      name=change[agreement_number]    1234567890
  ...   AND   ClearFildAndInputText      name=change[rationale]           ${change_data.data.rationale}
  ...   AND   Select From List           id=rationale_type_id             ${rationaleTypeNum}
  ...   AND   Choose File                name=change[files][]             ${filepath}
  ...   AND   Sleep   3
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти') or contains(@value,'Оновити')])[1]

  Run Keyword If   '${rationaleType}' == 'itemPriceVariation'   Sleep  3 min

  Sleep  3
  uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  uatenders.Оновити сторінку з тендером    ${username}  ${agreement_uaid}

Оновити властивості угоди
  [Arguments]  ${username}  ${agreement_uaid}  ${change_data}
  ${field_name}=   Run Keyword  get_change_field_name   ${change_data.data.modifications[0]}
  ${field_value}=  Run Keyword  get_change_field_value  ${change_data.data.modifications[0]}
  ${field_value}=  Convert To String  ${field_value}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn-warning') and contains(.,'Редагувати зміни до угоди')])
  Run Keyword If  'itemPriceVariation' in '${TEST_NAME}' or 'thirdParty' in '${TEST_NAME}'  Clear Element Text  xpath=(.//*[@class='form-control modif_value'])
  Run Keyword If  '${field_name}' == 'addend'   Run Keywords
  ...   Select From List              xpath=(.//*[@class='form-control modif_type'])    ${field_name}
  ...   AND   ClearFildAndInputText   xpath=(.//*[@class='form-control modif_value'])   ${field_value}
  Run Keyword If  '${field_name}' == 'factor'   Run Keywords
  ...   Select From List              xpath=(.//*[@class='form-control modif_type'])    ${field_name}
  ...   AND   ClearFildAndInputText   xpath=(.//*[@class='form-control modif_value'])   ${field_value}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Оновити')])[1]
  Sleep  3
  uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  uatenders.Оновити сторінку з тендером    ${username}  ${agreement_uaid}
  Sleep  5
  Reload Page
  Sleep  2

Завантажити документ для зміни у рамковій угоді
  [Arguments]  ${username}  ${file_path}  ${agreement_uaid}  ${item_id}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn-warning') and contains(.,'Редагувати зміни до угоди')])
  Sleep  2
  Choose File                name=change[files][]             ${file_path}
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Оновити')])[1]
  Sleep  3
  uatenders.Пошук угоди по ідентифікатору  ${username}  ${agreement_uaid}
  uatenders.Оновити сторінку з тендером    ${username}  ${agreement_uaid}

Застосувати зміну для угоди
  [Arguments]  ${username}  ${agreement_uaid}  ${dateSigned}  ${status}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn-warning') and contains(.,'Редагувати зміни до угоди')])
  Sleep  3
  ${dateSigned}=    convert_enquiry_tenderPeriod  ${dateSigned}
  ClearFildAndInputText     name=change[date_signed]   ${dateSigned}
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Оновити')])[1]
  Run Keyword If  '${status}' == 'cancelled'   Run Keywords
  ...   WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn-danger') and contains(.,'Скасувати зміну')])
  ...   AND   Sleep  5
  ...   AND   Reload Page
  Run Keyword If  '${status}' == 'active'   Run Keywords
  ...    uatenders.Підписати ЕЦП   ${username}   ${agreement_uaid}
  ...   AND   Sleep  5
  ...   AND   Reload Page
  Sleep  300

####################################################################################################
################################    Вторые этапы    ###########################################
####################################################################################################
Перевести тендер на статус очікування обробки мостом
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   10 x   2 min     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword And Ignore Error    Click Element    xpath=(//span[@class='glyphicon glyphicon glyphicon-refresh'])
  ...   AND   Sleep  3
  ...   AND   WaitVisibilityAndClickElement                    xpath=(//*[contains(@class,'btn-success') and contains(. ,'Оголосити другий етап')])
  Sleep  15
  Reload Page
  Sleep  2

Отримати тендер другого етапу та зберегти його
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Return    Отримати текст із поля для замовника                     tenderIdSecond

Активувати другий етап
  [Arguments]  ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=//*[contains(text(),'Опублікувати')]

############# selections
Створити тендер другого етапу
  [Arguments]  ${username}  ${adapted_data}
  uatenders.Перейти до публікації другого етапу рамок  ${username}  ${TENDER.TENDER_UAID}
  Element Should Be Visible    xpath=(//*[contains(@class,'inline') and contains(.,'Нова закупівля')])
# Інформація
  ClearFildAndInputText     name=title        ${adapted_data.data.title}
  ClearFildAndInputText     name=title_en     ${adapted_data.data.title_en}
  ClearFildAndInputText     name=description        ${adapted_data.data.description}
  ClearFildAndInputText     name=description_en     ${adapted_data.data.description_en}
# Лоти
  ${lots_count}=  Get Length  ${adapted_data.data.lots}
  ${presence}=  Run Keyword And Return Status  List Should Contain Value  ${adapted_data.data}  items
  @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${adapted_data.data}  items
  Run Keyword If    '${NUMBER_OF_ITEMS}' == '1'
  ...   uatenders.Сформувати глобальні змінні по ОДНОМУ предмету    ${items[0]}
  Run Keyword If    '${NUMBER_OF_ITEMS}' == '2'
  ...   uatenders.Сформувати глобальні змінні по ДВОХ предметах     ${items[0]}  ${items[1]}
  @{items}=  Run Keyword If  ${presence}  Get From Dictionary  ${adapted_data.data}  items
  :FOR   ${lots_count}   IN RANGE   ${lots_count}
  \   ClearFildAndInputText       name=lots[${lots_count}][items][0][description]      ${adapted_data.data.lots[0].description}
  \   ClearFildAndInputText       name=lots[${lots_count}][items][0][description_en]   ${adapted_data.data.lots[0].description_en}
  \   uatenders.Додати до предмет одиниці виміру    ${items[0]}  ${0}  ${0}
  \   uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  uatenders.Переміститься до футера
  uatenders.DismissAlertPopUp
  uatenders.Дочикатися появи кнопки Опублікувати  ${username}
    #pop-up window
  Run Keyword And Ignore Error            WaitVisibilityAndClickElement       xpath=(//*[@class='btn btn-primary text-center'])
  # Возможность дождаться получения АЙДИ тендера
  uatenders.Дочикатися появи айди тендера tender_uaid  ${username}
  Run Keyword And Return    Отримати текст із поля для замовника                     tenderIdSecond

Перейти до публікації другого етапу рамок
  [Arguments]  ${username}  ${tender_uaid}
  uatenders.Пошук тендера по ідентифікатору  ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=//*[contains(text(),'Оголосити відбір для закупівлі за рамковою угодою')]

Отримати інформацію про посточальника title
  Run Keyword And Return       Отримати текст із поля для посточальника       title

Отримати інформацію про посточальника description
  Run Keyword And Return       Отримати текст із поля для посточальника       description

Отримати інформацію про посточальника procuringEntity.name
  Switch Browser    1
  Sleep  5
  Run Keyword And Return       Отримати текст із поля для посточальника       procuringEntity.name

####################################################################################################
################################    Awards (Contract)    ###########################################
####################################################################################################

Підтвердити підписання контракту
  [Arguments]     ${username}  ${tender_uaid}  ${contract_num}
  ${index_begin_one}=            get_plus_Index             ${contract_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn btn-warning') and contains(. ,'Визначити')])
  Run Keyword IF     '${mode}' == 'reporting'      Run Keyword
  ...   uatenders.Заповнити поля договору   ${username}  ${tender_uaid}
  Run Keyword IF     '${mode}' == 'negotiation'      Run Keywords
  ...   WaitVisibilityAndClickElement             xpath=(.//*[contains(text(),'Контракти')])[1]
  ...   AND   WaitVisibilityAndClickElement       xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  ...   AND   uatenders.Переміститься до футера
  ...   AND   uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  ...   AND   uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword if   'укласти угоду для закупівлі' in '${TEST_NAME}'       Run Keywords
  ...   WaitVisibilityAndClickElement             xpath=(.//*[@id='btnPlace-tender']//*[contains(text(),'Контракти')])[1]
  ...   AND   WaitVisibilityAndClickElement       xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  ...   AND   uatenders.Переміститься до футера
  ...   AND   uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  ...   AND   Sleep  5
  ...   AND   Run Keyword And Ignore Error   WaitVisibilityAndClickElement   xpath=(.//*[@class='modal-footer']/*[contains(text(),'Так')])[1]
  ...   AND   Sleep  5

Заповнити поля договору
  [Arguments]     ${username}  ${tender_uaid}
  ${filepath}=               get_file_path
  Wait Until Keyword Succeeds   15 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(.//*[contains(text(),'Контракти')])[1]      Контракти
  WaitVisibilityAndClickElement               xpath=(.//*[contains(text(),'Контракти')])[1]
  WaitVisibilityAndClickElement               xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  uatenders.Переміститься до футера
  WaitVisibilityAndClickElement    name=period_date_start
  WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[2]
  WaitVisibilityAndClickElement    name=period_date_end
  WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[3]
  Sleep  2
  Choose File                      name=contract[files][]               ${filepath}
  Sleep  3
  WaitVisibilityAndClickElement    name=date_signed
  WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[1]
  Input Text                       name=contract_number          1234567890
  WaitVisibilityAndClickElement    name=tax
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]
  Sleep  5
  Reload Page
  Sleep  2
  uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}

Редагувати угоду
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${field_name}  ${value}
  ${filepath}=               get_file_path
  ${index_begin_one}=        get_plus_Index              ${contract_num}
  ${value}=                  float_to_string_2f          ${value}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(.//*[contains(text(),'Контракти')])[1]      Контракти
  WaitVisibilityAndClickElement               xpath=(.//*[contains(text(),'Контракти')])[1]
  WaitVisibilityAndClickElement               xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  Sleep  5
  uatenders.Переміститься до футера
  Run Keyword if   'Можливість редагувати вартість угоди без урахування ПДВ' in '${TEST_NAME}'   Sleep  700
  Wait Until Keyword Succeeds   5 x   60 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Run Keyword If     '${field_name}' == 'value.amount'     Run Keyword
  ...      ClearFildAndInputText      name=amount          ${value}
  ...      ELSE IF   '${field_name}' == 'value.amountNet'  Run Keyword
  ...      ClearFildAndInputText      name=amount_net      ${value}
  ...   AND   WaitVisibilityAndClickElement    name=period_date_start
  ...   AND   WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[2]
  ...   AND   WaitVisibilityAndClickElement    name=period_date_end
  ...   AND   WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[3]
  ...   AND   Sleep  2
  ...   AND   Choose File                      name=contract[files][]               ${filepath}
  ...   AND   Sleep  3
  ...   AND   Clear Element Text               name=date_signed
  ...   AND   Click Element                    xpath=(.//*[contains(text(),'Дата підписання')])[last()]
  ...   AND   WaitVisibilityAndClickElement    name=date_signed
  ...   AND   WaitVisibilityAndClickElement    xpath=(.//*[@class='glyphicon glyphicon-calendar'])[1]
  ...   AND   Input Text                       name=contract_number          1234567890
  ...   AND   Sleep  2
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]
  ...   AND   Sleep  3
  ...   AND   uatenders.Переміститься до хедера
  ...   AND   Sleep  3
  ...   AND   Element Should Be Visible       xpath=(.//*[@class='alert-cont']//*[contains(text(),'Дані контракту збережні')])    Дані контракту збережні

Встановити дату підписання угоди
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${dateSigned}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement    xpath=(.//*[@id='btnPlace-tender']//*[contains(text(),'Контракти')])[1]
  WaitVisibilityAndClickElement    xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  Sleep  10
  Clear Element Text               name=date_signed
  Click Element                    xpath=(.//*[contains(text(),'Дата підписання')])[last()]
  WaitVisibilityAndClickElement    name=date_signed
  Input Text                       name=contract_number          1234567890
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]

Вказати період дії угоди
  [Arguments]  ${username}  ${tender_uaid}  ${contract_num}  ${startDate}  ${endDate}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement    xpath=(.//*[@id='btnPlace-tender']//*[contains(text(),'Контракти')])[1]
  WaitVisibilityAndClickElement    xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  WaitVisibilityAndClickElement    name=period_date_start
  WaitVisibilityAndClickElement    name=period_date_end
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]

Завантажити документ в угоду
  [Arguments]  ${username}  ${file_path}  ${tender_uaid}  ${contract_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement    xpath=(.//*[@id='btnPlace-tender']//*[contains(text(),'Контракти')])[1]
  WaitVisibilityAndClickElement    xpath=((//*[contains(text(),'№')]/../../..//a)[position() mod 2 = 1])[1]
  Sleep  2
  Choose File                      name=contract[files][]               ${file_path}
  Sleep  3
  WaitVisibilityAndClickElement    xpath=(//*[contains(@value,'Зберегти')])[1]

##################################################################################################################
######################################    Limited procurement    ################################################
Створити постачальника, додати документацію і підтвердити його
  [Arguments]     ${username}  ${tender_uaid}  ${supplier_data}  ${document}
#адоптация некоторых данных, для процедуры negotiation
  ${supplier_data}=     Run Keyword IF  '${username}' == 'uatenders_Owner'
  ...     adapt_data_supplier_data  ${supplier_data}
  ...     ELSE  Set Variable  ${supplier_data}
  #Місцезнаходження/address
  ${countryName}=          Get From Dictionary      ${supplier_data.data.suppliers[0].address}           countryName
  ${countryName}=          convert_uatenders_string_to_common_string                                     ${countryName}
  ${locality}=             Get From Dictionary      ${supplier_data.data.suppliers[0].address}           locality
  ${postalCode}=           Get From Dictionary      ${supplier_data.data.suppliers[0].address}           postalCode
  ${region}=               Get From Dictionary      ${supplier_data.data.suppliers[0].address}           region
  ${region}=               convert_uatenders_string_to_common_string                                     ${region}
  ${region}=                  get_unit_id                   ${region}
  ${streetAddress}=        Get From Dictionary      ${supplier_data.data.suppliers[0].address}           streetAddress
  #Контактні дані/contactPoint
  ${email}=                Get From Dictionary      ${supplier_data.data.suppliers[0].contactPoint}      email
  ${nameContactPoint}=     Get From Dictionary      ${supplier_data.data.suppliers[0].contactPoint}      name
  ${telephone}=            Get From Dictionary      ${supplier_data.data.suppliers[0].contactPoint}      telephone
  #Інформація про переможця/identifier
  ${id}=                   Get From Dictionary      ${supplier_data.data.suppliers[0].identifier}        id
  ${legalName}=            Get From Dictionary      ${supplier_data.data.suppliers[0].identifier}        legalName
  #Сума/value
  ${amount}=               Get From Dictionary      ${supplier_data.data.value}                          amount

  Wait Until Keyword Succeeds   5 x   15 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[contains(@class,'label-info') and contains(text(),'Активний')])      Активний
  ...   AND   Reload Page
  ...   AND   Element Should Be Visible       xpath=(//*[contains(@class,'label-info') and contains(text(),'Активний')])      Активний

  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Визначити')])[1]
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement     xpath=(//*[contains(@class,'btn btn-warning') and contains(.,'Додати учасника')])
  #Інформація про переможця/identifier
  Input Text                          name=organization[name]                            ${legalName}
  Input Text                          name=organization[identifier]                      ${id}
  #Місцезнаходження/address
  Select From List                    xpath=//select[@name='organization[country_id]']   ${countryName}
  Select From List                    xpath=//select[@name='organization[region_id]']    ${region}
  Input Text                          name=organization[postal_code]                     ${postalCode}
  Input Text                          name=organization[locality]                        ${locality}
  Input Text                          name=organization[street_address]                  ${streetAddress}
  #Контактні дані/contactPoint
  Input Text                          name=organization[contact_name]                    ${nameContactPoint}
  Input Text                          name=organization[contact_phone]                   ${telephone}
  Input Text                          name=organization[contact_email]                   ${email}
  #Сума/value
  Input Text                          name=amount                                        ${amount}
  Execute Javascript  window.frames[0]; document.querySelector( "input[type='file']" ).style.display = "block";
  Sleep  1
  Choose File         css=[type*=file]             ${document}
  Sleep  1
  WaitVisibilityAndClickElement         xpath=(//*[@class='btn btn-danger'])
  Run Keyword And Ignore Error          WaitVisibilityAndClickElement     xpath=(//*[contains(@value,'Продовжити')])[1]
  Sleep  5
  Run Keyword IF      '${MODE}' == 'negotiation'     Run Keywords
  ...   Reload Page
  ...   AND   WaitVisibilityAndClickElement     xpath=(//*[contains(text(),'Переможець')])[1]
  ...   AND   uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}
  # Підтвердити підписання контракту
  Run Keyword IF     '${mode}' == 'reporting'      Run Keywords
  ...   WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'btn btn-warning') and contains(. ,'Визначити')])
  ...   AND   WaitVisibilityAndClickElement       xpath=(//*[contains(text(),'Підтвердити переможця')])[1]
  ...   AND   uatenders.Підписати ЕЦП   ${username}   ${tender_uaid}

Підтвердити визначення участника в закупівлі
  [Arguments]     ${username}  ${tender_uaid}  ${contract_num}
  ${index_begin_one}=            get_plus_Index             ${contract_num}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'btn btn-warning') and contains(. ,'Визначити')])
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'table-hover')]//*[contains(@class,'fl_check')])[1]

Отримати документ до скасування
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...      ${ARGUMENTS[0]} ==  username
  ...      ${ARGUMENTS[1]} ==  tender_uaid
  ...      ${ARGUMENTS[2]} ==  cancellation_id
  ...      ${ARGUMENTS[3]} ==  doc_id
  ${file_name}=                    Get Text                   xpath=//a[contains(text(),'${ARGUMENTS[3]}')]
  ${url}=                     Get Element Attribute           xpath=//a[contains(text(),'${ARGUMENTS[3]}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}


##################################################################################################################
######################################    Feature operations    ################################################
Додати неціновий показник на тендер
  [Arguments]  ${username}  ${tender_uaid}  ${feature}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement             xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  #featereData   index   defoultIndex
  uatenders.Додати нецінові показники до тендеру  ${feature}  ${1}  ${0}
  uatenders.Заповнити поля регіону доставки першого предмета  ${0}
  uatenders.DismissAlertPopUp

Додати неціновий показник на предмет
  [Arguments]  ${username}  ${tender_uaid}  ${feature}  ${item_id}
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement             xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  #featereData   index   defoultIndex
  uatenders.Додати нецінові показники до ПРЕДМЕТУ  ${feature}  ${1}  ${0}
  uatenders.DismissAlertPopUp

Додати неціновий показник на лот
  [Arguments]  ${username}  ${tender_uaid}  ${feature}  ${lot_id}
  Run Keyword And Ignore Error     WaitVisibilityAndClickElement             xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  #featereData   index   defoultIndex
  uatenders.Додати нецінові показники до ЛОТУ  ${feature}  ${1}  ${0}
  uatenders.DismissAlertPopUp

Видалити неціновий показник
  [Arguments]  ${username}  ${tender_uaid}  ${feature_id}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement               xpath=//*[text()='Редагувати']
  Run Keyword If    '${mode}' == 'aboveThresholdEU' or '${mode}' == 'openeu' or '${mode}' == 'open_esco' or '${mode}' == 'closeFrameworkAgreementUA' or '${mode}' == 'open_framework'    ClearFildAndInputText    name=contact_name_en    Petrov
  Run Keyword And Ignore Error         ScrollToElementToFalse         (//*[contains(@class,'${feature_id}')]/..//following-sibling::*//*[. = 'Коментар'])[1]
  WaitVisibilityAndClickElement               xpath=(//*[contains(@class,'${feature_id}')])[1]
  uatenders.Заповнити поля регіону доставки першого предмета   ${0}
  uatenders.DismissAlertPopUp

Отримати інформацію із нецінового показника
  [Arguments]   ${username}  ${tender_uaid}  ${feature_id}  ${field_name}
  uatenders.Оновити сторінку з тендером  ${username}  ${tender_uaid}
  Sleep  2
  Run Keyword And Ignore Error        ScrollToElementToFalse        //h4[text()[contains(.,'Лоти')]]
  Run Keyword And Return If   '${field_name}' == 'title'         Get Text                xpath=(//*[contains(text(),'${feature_id}')]/..//*)[1]
  Run Keyword And Return If   '${field_name}' == 'description'   Get Text                xpath=(//*[contains(text(),'${feature_id}')]/..//*)[2]
  Run Keyword And Return If   '${field_name}' == 'featureOf'     uatenders.Отримати неціновий показник   ${feature_id}

Отримати неціновий показник
  [Arguments]   ${feature_id}
  ${return_value}=     Get Element Attribute     xpath=(//*[contains(text(),'${feature_id}')]/..)@value
  Run Keyword And Return If    '${return_value}' == 'tender'    Convert To String    tenderer
  Run Keyword And Return If    '${return_value}' != 'tender'    Convert To String    ${return_value}

#################################################################################################################
#####################################    Claims    ################################################
Створити чернетку вимоги про виправлення умов закупівлі
  [Arguments]   ${username}  ${tender_uaid}  ${claim}  #${filepath}
  ScrollToElementToFalse                    //h1[text()[contains(.,'[ТЕСТУВАННЯ]')]]
  WaitVisibilityAndClickElement       xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  #Claim закупка
  WaitVisibilityAndClickElement       xpath=(//*[contains(text(),'Подати вимогу')])[1]
  Run Keyword if   'умов закупівлі' in '${TEST_NAME}'   WaitVisibilityAndClickElement   xpath=(.//*[contains(text(),'По закупівлі')])
  ...   ELSE IF    'умов лоту' in '${TEST_NAME}'        WaitVisibilityAndClickElement   xpath=(.//*[contains(text(),'По лоту')])
  Sleep  2
  Input Text                          name=title                                  ${claim.data.title}
  Input Text                          name=description                            ${claim.data.description}
  #UploadFile
  uatenders.Завантажити документацію до вимоги   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@type,'submit') and contains(@value,'Подати')])
  Run Keyword And Ignore Error     uatenders.Дочикатися появи айди тендера complaintID  ${username}  ${claim.data.title}
  Sleep  2
  Reload Page
  Sleep  5

  ${claimTitle}=      Fetch From Left       ${claim.data.title}    :

  ${complaintID}=     Get Element Attribute     xpath=(//*[contains(text(),'${claimTitle}')]/..//../..)@data-complaintid
  [Return]     ${complaintID}

Дочикатися появи айди тендера complaintID
  [Arguments]   ${username}  ${complaintsTitleSearch}
  Wait Until Keyword Succeeds   5 x   20 s     Run Keywords
  ...   Run Keyword IF      '${username}' == 'PASS'     Element Should Be Visible       xpath=(//*[contains(text(),'Вимоги та скарги по закупівлі')])      Вимоги та скарги по закупівлі
  ...   AND   Sleep  5
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible       xpath=(//*[contains(text(),"${complaintsTitleSearch}")])      ${complaintsTitleSearch}

Відрізати текст після опострофу
  [Arguments]   ${complaintsTitle}
# проверяем текст на наличие опострофа
  ${complaintsTitleStatus}=   Run Keyword And Return Status
  ...   Element Should Be Enabled           xpath=(//*[contains(text(),'${complaintsTitle}')])
# если фолс то режим по опострафу
  ${complaintsTitleSearch}=   Run Keyword IF     'True' == '${complaintsTitleStatus}'
  ...   Get Text                      xpath=(//*[contains(text(),'${complaintsTitle}')])
  ...     ELSE IF   'False' == '${complaintsTitleStatus}'
  ...   Fetch From Right         ${complaintsTitle}    '
  [Return]     ${complaintsTitleSearch}

Створити чернетку вимоги про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}
  ${complaintsTitle}=            Get From Dictionary      ${claim.data}          title
  ${complaintsDescription}=      Get From Dictionary      ${claim.data}          description
  #Claim лот
  ScrollToElementToFalse                    //h1[text()[contains(.,'[ТЕСТУВАННЯ]')]]
  WaitVisibilityAndClickElement       xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  WaitVisibilityAndClickElement       xpath=(//*[contains(text(),'Подати вимогу')])[1]
  #По лоту
  WaitVisibilityAndClickElement       xpath=(//*[contains(@class,'switcNotSatisfied') and contains(.,'По лоту')])
  Input Text                          name=title                                  ${complaintsTitle}
  Input Text                          name=description                            ${complaintsDescription}
  uatenders.Завантажити документацію до вимоги   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[contains(@type,'submit') and contains(@value,'Подати')])
  Wait Until Element Is Visible       xpath=(//*[contains(@class,'TitleComplaintAndClaim')])[1]        120
  Capture Page Screenshot
  Run Keyword And Ignore Error     uatenders.Дочикатися появи айди тендера complaintID  ${username}  ${complaintsTitle}
  Run Keyword And Return        Get Element Attribute     xpath=(//*[contains(text(),"${complaintsTitle}")]/..//../..)@data-complaintid

Створити вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${document}=${None}
  Run Keyword And Ignore Error       WaitVisibilityAndClickElement     xpath=//*[text()='Прочитано']
  Run Keyword And Return    uatenders.Створити чернетку вимоги про виправлення умов закупівлі   ${username}  ${tender_uaid}  ${claim}

Створити вимогу про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${lot_id}  ${document}=${None}
  Run Keyword And Return    uatenders.Створити чернетку вимоги про виправлення умов лоту   ${username}  ${tender_uaid}  ${claim}  ${lot_id}

Створити вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${document}=${None}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Run Keyword If    '${mode}' == 'openua'   Run Keywords
  ...    WaitVisibilityAndClickElement                 xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  ...   AND    WaitVisibilityAndClickElement           xpath=(.//*[contains(text(),'Подати вимогу')])[1]
  ...    ELSE IF    '${mode}' != 'openua'    WaitVisibilityAndClickElement    xpath=(.//*[contains(text(),'Вимога щодо переможця')])[1]
  Run Keyword And Ignore Error    WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'switcNotSatisfied') and contains(.,'По лоту')])
  uatenders.Заповнити поля для вимоги/скарги  ${username}  ${tender_uaid}  ${claim}
  Run Keyword And Ignore Error    Run Keyword If    '${document}' != 'None'    Run Keywords
  ...   Sleep  2
  ...   AND   Choose File                      css=[id*=complaint-1]              ${document}
  ...   AND   Sleep  2
  Sleep  5
  WaitVisibilityAndClickElement       xpath=(//*[contains(@type,'submit') and contains(@value,'Подати')])
  Sleep  5
  Reload Page
  Sleep  2
  Run Keyword And Return        Get Element Attribute     xpath=(//*[contains(text(),"${claim.data.title}")]/..//../..)@data-complaintid

Заповнити поля для вимоги/скарги
  [Arguments]  ${username}  ${tender_uaid}  ${claim}
  Input Text                          name=title                                  ${claim.data.title}
  Input Text                          name=description                            ${claim.data.description}
  uatenders.Завантажити документацію до вимоги   ${username}  ${tender_uaid}

Завантажити документацію до вимоги
  [Arguments]  ${username}  ${tender_uaid}
  ${filepath}=                            get_file_path
  Sleep  2
  Choose File                      css=[id*=complaint-1]              ${filepath}
  Sleep  2

Подати вимогу
  [Arguments]  @{ARGUMENTS}
  [Documentation]
  ...    ${ARGUMENTS[0]} ==  username
  ...    ${ARGUMENTS[1]} ==  tender_uaid
  ...    ${ARGUMENTS[2]} ==  complaintID
  ...    ${ARGUMENTS[3]} ==  confirmation_data
  uatenders.Створити вимогу про виправлення умов лоту    ${ARGUMENTS[2]}  ${ARGUMENTS[3]}

Відповісти на вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Page Should Contain Element       xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  ...   AND   WaitVisibilityAndClickElement     xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Page Should Contain Element       xpath=(.//*[contains(@class,'label-') and contains(text(),'Очікує розгляду')])[last()]
  WaitVisibilityAndClickElement           xpath=(.//*[contains(text(),'Детальніше') and contains(@class,'${complaintID}')])[1]
########################
  ${trueStatus}=       Run Keyword And Return Status
  ...   Element Should Be Visible    xpath=(//*[contains(text(),'Дата відповіді:')])[1]    Дата відповіді:
  Wait Until Keyword Succeeds   5 x   10 s     Run Keywords
  ...   Run Keyword IF    '${trueStatus}' != 'True'    Select From List    xpath=(//*[@name='resolution_type'])[1]    ${answer_data.data.resolutionType}
  ...   AND   Input Text                        name=resolution                             ${answer_data.data.resolution}
  ...   AND   uatenders.Завантажити документацію до вимоги   ${username}  ${tender_uaid}
  ...   AND   WaitVisibilityAndClickElement     xpath=(//*[@type='submit'])[1]
  ...   AND   Sleep  2
  ...   AND   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible         xpath=(//*[contains(text(),'Дата відповіді:')])[1]    Дата відповіді:

Скорегувати айди вимоги для замовника
  [Arguments]  ${tender_uaid}  ${complaintID}
  Sleep  2
  Reload Page
  Sleep  2
  ${complaintIDNum}=     Fetch From Right              ${complaintID}      .
  ${complaintIDCat}=     Replace String Using Regexp   ${complaintIDNum}   ([A-Za-z]+)     ${EMPTY}
  ${complaintIDZak}=     Catenate                      SEPARATOR=.         ${tender_uaid}  ${complaintIDCat}
  ${presence}=  Run Keyword And Return Status    Page Should Contain Element    xpath=(//*[contains(@data-complaintid,'${complaintID}') or contains(@class,'${complaintID}')])[1]
  ${convertComplaintID}=   Run Keyword IF   '${presence}' == 'True'
  ...   Convert To String      ${complaintID}
  ...               ELSE IF   '${presence}' == 'False'
  ...   Convert To String      ${complaintIDZak}
  [Return]         ${convertComplaintID}

Відповісти на вимогу про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait Until Keyword Succeeds   15 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Page Should Contain Element       xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  WaitVisibilityAndClickElement                 xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  WaitVisibilityAndClickElement         xpath=(//*[contains(@class,'${complaintID}') and contains(.,'Детальніше')])[1]
  uatenders.Надати відповідь по всім вимогам   ${username}  ${tender_uaid}  ${answer_data}
  Sleep  3
  Wait Until Element Is Visible         xpath=(//*[contains(text(),'Рішення замовника')])[1]      25
  Sleep  3

Відповісти на вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${answer_data}  ${award_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  Wait Until Keyword Succeeds   25 x   5 s     Run Keywords
  ...   Reload Page
  ...   AND   Page Should Contain Element       xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  WaitVisibilityAndClickElement                 xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  Sleep  2
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement                 xpath=(//*[contains(@class,'${complaintID}') and contains(.,'Детальніше')])[1]
  uatenders.Надати відповідь по всім вимогам   ${username}  ${tender_uaid}  ${answer_data}

Надати відповідь по всім вимогам
  [Arguments]  ${username}  ${tender_uaid}  ${answer_data}
  Sleep  1
  Select From List                              xpath=//*[@name='resolution_type']          ${answer_data.data.resolutionType}
  Sleep  2
  Input Text                                    name=resolution                             ${answer_data.data.resolution}
  uatenders.Завантажити документацію до вимоги   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement                 xpath=//*[@type='submit']

Підтвердити вирішення вимоги про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
  ${statusAnswer}=            Run Keyword And Return Status   List Should Contain Value   ${confirmation_data.data}    status
  ${status_1}=    Run Keyword IF   '${statusAnswer}' == 'True'   Get From Dictionary                ${confirmation_data.data}             status
  ${statusAnswerSatisfied}=   Run Keyword And Return Status   List Should Contain Value   ${confirmation_data.data}    satisfied
  ${status_2}=    Run Keyword IF   '${statusAnswerSatisfied}' == 'True'   Get From Dictionary       ${confirmation_data.data}             satisfied
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement            xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  Run Keyword IF   '${status_1}' == 'resolved'
  ...   WaitVisibilityAndClickElement      xpath=(//*[contains(@data-complaintid,'${complaintID}') or contains(@class,'${complaintID}')])[1]//*[contains(text(),'Задоволена замовником')]
# клик по кнопке [Не задоволений]==False, а вот, если то по дефолту выставлена кнопка [Задоволений]==True
  Run Keyword IF   '${status_2}' == 'False'
  ...   WaitVisibilityAndClickElement      xpath=(//*[contains(@value,'${complaintID}') or contains(@data-complaintid,'${complaintID}')]//*[@class='switcNotSatisfied'])[1]
  WaitVisibilityAndClickElement            xpath=(//*[contains(@value,'${complaintID}') or contains(@data-complaintid,'${complaintID}')]//*[@class='btn btn-answer'])[1]
  Run Keyword IF   'Можливість підтвердити задоволення вимоги про виправлення визначення переможця' == '${TEST_NAME.replace('\'', '')}'    Wait Until Keyword Succeeds   25 x   60 s   Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Page Should Contain Element       xpath=(//*[contains(@value,'${complaintID}') or contains(@data-complaintid,'${complaintID}')]//*[contains(@class,'claim') and contains(text(),'Виконана замовником')])[1]
  Sleep  5
  Reload Page
  Sleep  2

Підтвердити вирішення вимоги про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}
  uatenders.Підтвердити вирішення вимоги про виправлення умов закупівлі   ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}

Підтвердити вирішення вимоги про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}  ${award_index}
  uatenders.Підтвердити вирішення вимоги про виправлення умов закупівлі   ${username}  ${tender_uaid}  ${complaintID}  ${confirmation_data}

Скасувати вимогу про виправлення умов закупівлі
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
  ${statusAnswer}=             Get From Dictionary         ${cancellation_data.data}             status
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  Wait Until Keyword Succeeds   5 x   25 s     Run Keywords
  ...   Reload Page
  ...   AND   Run Keyword And Ignore Error    Page Should Contain Element    xpath=(//*[contains(@value,'${complaintID}')]/..//following-sibling::*/*[contains(.,'Розглянуто замовником. Задоволена')])
  ...   AND   Run Keyword And Ignore Error    Page Should Contain Element    xpath=(//*[contains(@value,'${complaintID}')]/..//following-sibling::*/*[contains(.,'Вирішена')])
  ScrollToElementToFalse                (//*[@class='footer'])[1]

  Run Keyword IF   '${statusAnswer}' != 'cancelled' and '${statusAnswer}' != 'stopping'
  ...   uatenders.Заповнити дані по скасуванню вимоги  ${complaintID}  ${cancellation_data}


  Run Keyword IF   '${statusAnswer}' == 'cancelled'   Run Keywords
  ...   WaitVisibilityAndClickElement         xpath=(//*[contains(@data-complaintid,'${complaintID}')]//*[contains(text(),'Відкликати')])[1]
  ...   AND   uatenders.Заповнити дані по скасуванню вимоги  ${complaintID}  ${cancellation_data}

  Run Keyword IF   '${statusAnswer}' == 'stopping' and 'Можливість скасувати скаргу про виправлення визначення переможця' != '${TEST_NAME.replace('\'', '')}' and '${MODE}' != 'openua'  Run Keywords
  ...   WaitVisibilityAndClickElement         xpath=(//*[contains(@data-complaintid,'${complaintID}')]//*[contains(text(),'Відкликати')])[1]
  ...   AND   uatenders.Заповнити дані по скасуванню вимоги  ${complaintID}  ${cancellation_data}
# скасування Скарги в openUA
  Log    MODE ==> ${MODE}
  Run Keyword IF   '${statusAnswer}' == 'stopping' and 'Можливість скасувати скаргу про виправлення визначення переможця' == '${TEST_NAME.replace('\'', '')}' and '${MODE}' == 'openua'
  ...  uatenders.Отримати айди скарги для openua  ${tender_uaid}  ${cancellation_data}

Заповнити дані по скасуванню вимоги
  [Arguments]  ${complaintID}  ${cancellation_data}
  Sleep  2
  WaitVisibilityAndClickElement   xpath=((.//*[@data-complaintid='${complaintID}'])//*[@class='modal-body']/*[@name='cancellation_reason'])[1]
  ClearFildAndInputText           xpath=((.//*[@data-complaintid='${complaintID}'])//*[@class='modal-body']/*[@name='cancellation_reason'])[1]   ${cancellation_data.data.cancellationReason}
  WaitVisibilityAndClickElement   xpath=((.//*[@data-complaintid='${complaintID}'])//*[@class='modal-footer']/*[@type='submit'])[1]
Отримати айди скарги для openua
  [Arguments]  ${tender_uaid}  ${cancellationDataOrFieldName}
  ${complaintID}=    Get Element Attribute     xpath=(//*[contains(text(),'Очікує прийняття до розгляду АМКУ')]//..//../.)@data-complaintid
  Log    complaintID ==> ${complaintID}
  WaitVisibilityAndClickElement         xpath=(//*[contains(@data-complaintid,'${complaintID}')]//*[contains(text(),'Відкликати')])[1]
  uatenders.Заповнити дані по скасуванню вимоги  ${complaintID}  ${cancellationDataOrFieldName}

Скасувати вимогу про виправлення умов лоту
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}
  uatenders.Скасувати вимогу про виправлення умов закупівлі   ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}

Скасувати вимогу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}  ${award_index}
  uatenders.Скасувати вимогу про виправлення умов закупівлі   ${username}  ${tender_uaid}  ${complaintID}  ${cancellation_data}

Створити скаргу про виправлення визначення переможця
  [Arguments]  ${username}  ${tender_uaid}  ${claim}  ${award_index}  ${document}=${None}
  uatenders.Пошук тендера по ідентифікатору   ${username}  ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//*[text()[contains(.,'Оскарження')]])[1]
  WaitVisibilityAndClickElement       xpath=(.//*[contains(text(),'Подати скаргу')])[1]
  uatenders.Заповнити поля для вимоги/скарги  ${username}  ${tender_uaid}  ${claim}
  Sleep  2
  WaitVisibilityAndClickElement       xpath=(//*[contains(@type,'submit') and contains(@value,'Подати')])
  Sleep  5
  Reload Page
  Sleep  2
  ${return_value_1}=   Run Keyword IF   'Можливість створити скаргу про виправлення визначення переможця' == '${TEST_NAME.replace('\'', '')}' and '${MODE}' == 'openua'
  ...   uatenders.Переміститься до футера
  Sleep  2
  ${complaintID}=        Get Element Attribute     xpath=(//*[contains(text(),'${claim.data.title}')]/..//../..)@data-complaintid
  [Return]  ${complaintID}

Отримати інформацію із документа до скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${field_name}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//a[contains(text(),'Вимоги') or contains(text(),'Оскарження')])[1]
  Reload Page
  Sleep  2
  WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'${complaintID}') and contains(.,'Детальніше')])[1]
  Run Keyword And Return           Get Text         xpath=//a[contains(text(),'${doc_id}')]

Отримати документ до скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${doc_id}  ${award_id}=${None}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement                               xpath=//a[text()[contains(.,'Вимоги/Скарги')]]
  ############################################################################################################
# кнопка [Детальніше] локатор по атрибуту complaintID
  WaitVisibilityAndClickElement                 xpath=(//*[@class="table table-striped"])//tr[1]/td[6]/a
  ############################################################################################################
  ${file_name}=                    Get Text                   xpath=//a[contains(text(),'${complaintID}')]
  ${url}=                     Get Element Attribute           xpath=//a[contains(text(),'${complaintID}')]@href
  download   ${url}  ${file_name}  ${OUTPUT_DIR}
  [Return]  ${file_name}

Отримати інформацію із скарги
  [Arguments]  ${username}  ${tender_uaid}  ${complaintID}  ${field_name}  ${award_index}
  uatenders.Пошук тендера по ідентифікатору   ${username}   ${tender_uaid}
  WaitVisibilityAndClickElement       xpath=(//a[contains(text(),'Вимоги') or contains(text(),'Оскарження')])[1]
  Run Keyword IF   '${username}' == 'uatenders_Owner' or '${username}' == 'uatenders_Viewer'    Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   WaitVisibilityAndClickElement    xpath=(//*[contains(@class,'${complaintID}') and contains(.,'Детальніше')])[1]
  ...   AND   Run Keyword And Return    Отримати значення поля complaints[0].${field_name}  ${tender_uaid}    #${complaintIDZak}
  ...   ELSE IF    '${username}' != 'uatenders_Owner' or '${username}' != 'uatenders_Viewer'
  ...         Run Keyword And Return    Отримати значення поля Claims Provider complaints[0].${field_name}  ${tender_uaid}  ${complaintID}  ${field_name}

Отримати значення поля complaints[0].status
  [Arguments]   ${tender_uaid}
  Capture Page Screenshot
  Wait Until Element Is Visible     xpath=(.//h4/*[contains(@class,'label label-')])[1]      25
  Capture Page Screenshot
  ${return_value}=     Get Text     xpath=(.//h4/*[contains(@class,'label label-')])[1]
  Run Keyword IF    'статусу answered вимоги' in '${TEST_NAME.replace('\'', '')}'    Run Keyword And Return    convert_status    ${return_value}
  ...    ELSE IF    'статусу answered вимоги' != '${TEST_NAME.replace('\'', '')}'    Run Keyword And Return    convert_uatenders_string_to_ClaimsStatus    ${return_value}

Отримати значення поля complaints[0].title
  [Arguments]   ${tender_uaid}
  Run Keyword And Return      Get Text      xpath=(//*[contains(text(),'Заголовок:')])[1]//..//*[position() mod 2 = 0]

Отримати значення поля complaints[0].description
  [Arguments]   ${tender_uaid}
  Run Keyword And Return      Get Text      xpath=(//*[contains(text(),'Вимога:')])[1]//..//*[position() mod 2 = 0]

Отримати значення поля complaints[0].satisfied
  [Arguments]   ${tender_uaid}
  Wait Until Keyword Succeeds   5 x   10 s     Run Keywords
  ...   Reload Page
  ...   AND   Sleep  2
  ...   AND   Element Should Be Visible        xpath=(//*[contains(text(),'Оцінка скаржника:')])[1]    Оцінка скаржника:
  ${return_value}=      Get Text      xpath=((//span[contains(@class,'complaint')]))[1]
  Run Keyword And Return      convert_valueAddedTaxIncluded      ${return_value}

Отримати значення поля complaints[0].resolutionType
  [Arguments]   ${tender_uaid}
  ${return_value}=      Get Text      xpath=(//*[contains(text(),'Тип відповіді:')])[1]//..//*[position() mod 2 = 0]
  Run Keyword And Return      convert_uatenders_string_to_ClaimsStatus      ${return_value}

Отримати значення поля complaints[0].resolution
  [Arguments]   ${tender_uaid}  #${complaintID}
  Sleep  2
  Run Keyword And Return      Get Text      xpath=((//*[contains(text(),'Відповідь:')])[1]//..//*[position() mod 2 = 0])/span

Отримати значення поля Claims Provider complaints[0].status
  [Arguments]   ${tender_uaid}  ${complaintID}  ${field_name}
  ${return_value}=     Get Text   xpath=//*[@data-complaintid='${complaintID}']/*[contains(@class,'label')]/span
  ${return_value}=   Run Keyword IF    'вимогу про виправлення умов лоту' in '${TEST_NAME.replace('\'', '')}'   Run Keyword And Return    convert_status    ${return_value}
  ...   ELSE IF   'вимогу про виправлення умов закупівлі' in '${TEST_NAME.replace('\'', '')}'                   Run Keyword And Return    convert_status    ${return_value}
  ...   ELSE IF   'вимогу про виправлення визначення переможця' in '${TEST_NAME.replace('\'', '')}'             Run Keyword And Return    convert_status    ${return_value}
  ...   ELSE IF   'вимогу про виправлення умов лоту' != '${TEST_NAME.replace('\'', '')}' or 'вимогу про виправлення умов закупівлі' != '${TEST_NAME.replace('\'', '')}' or 'вимогу про виправлення визначення переможця' != '${TEST_NAME.replace('\'', '')}' or 'Можливість скасувати скаргу про виправлення визначення переможця' != '${TEST_NAME.replace('\'', '')}'
  ...     Run Keyword And Return   convert_uatenders_string_to_ClaimsStatus    ${return_value}
  [Return]         ${return_value}

Отримати значення поля Claims Provider complaints[0].title
  [Arguments]   ${tender_uaid}  ${complaintID}  ${field_name}
  Run Keyword And Return       Get Text        xpath=//*[@data-complaintid='${complaintID}']//*[@class='TitleComplaint']

Отримати значення поля Claims Provider complaints[0].description
  [Arguments]   ${tender_uaid}  ${complaintID}  ${field_name}
  Run Keyword And Return       Get Text        xpath=//*[@data-complaintid='${complaintID}']//*[@class='DescriptComplaint']

Отримати значення поля Claims Provider complaints[0].docFieldVisibleQuestionClaim
  [Arguments]   ${tender_uaid}  ${complaintID}  ${field_name}
  Run Keyword And Return       Get Text        xpath=(//*[@data-complaintid='${complaintID}']/*[@class='complaintWrapBlock'])//*[@class='ClameDocument']
Отримати значення поля Claims Provider complaints[0].docFieldVisibleAnswerClaim
  [Arguments]   ${tender_uaid}  ${complaintID}  ${field_name}
  Run Keyword And Return       Get Text        xpath=(//*[@data-complaintid='${complaintID}']/*[@class='answerBlock'])//*[@class='ClameDocument']