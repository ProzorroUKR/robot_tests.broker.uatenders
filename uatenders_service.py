# -*- coding: utf-8 -*-
import pytz
from iso8601 import parse_date
from datetime import datetime, timedelta
import os
import urllib
import sys

def get_scenarios_name():
    name = ''
    for param in sys.argv:
        if 'txt' in param:
            name = param
    return name

def get_milestones_title(string):
    string = string.strip()
    return {
       u'signingTheContract': u'підписання договору',
        u'deliveryOfGoods': u'поставка товару',
        u'submissionDateOfApplications': u'дата подання заявки',
        u'endDateOfTheReportingPeriod': u'дата закінчення звітного періоду',
        u'dateOfInvoicing': u'дата виставлення рахунку',
        u'executionOfWorks': u'виконання робіт',
        u'submittingServices': u'надання послуг',
        u'anotherEvent': u'інша подія',
    }.get(string, string)

def set_milestones_title(string):
    string = string.strip()
    return {
       u'підписання договору': u'signingTheContract',
        u'поставка товару': u'deliveryOfGoods',
        u'дата подання заявки': u'submissionDateOfApplications',
        u'дата закінчення звітного періоду': u'endDateOfTheReportingPeriod',
        u'дата виставлення рахунку': u'dateOfInvoicing',
        u'виконання робіт': u'executionOfWorks',
        u'надання послуг': u'submittingServices',
        u'інша подія': u'anotherEvent',
    }.get(string, string)

def get_milestones_code(string):
    string = string.strip()
    return {
        u'Аванс': u'prepayment',
        u'Пiсляоплата': u'postpayment',
    }.get(string, string)

def get_milestones_duration_type(string):
    string = string.strip()
    return {
        u'робочі': u'working',
        u'банківські': u'banking',
        u'календарні': u'calendar',
        u'робочих': u'working',
        u'банківських': u'banking',
        u'календарних': u'calendar',
    }.get(string, string)

def get_mainProcurementCategory(string):
    string = string.strip()
    return {
        u'Закупівля товарів': u'goods',
        u'Закупівля робіт': u'works',
        u'Закупівля послуг': u'services',
    }.get(string, string)

def get_status_plan(string):
    string = string.strip()
    return {
        u'Чернетка': u'draft',
        u'Запланований': u'scheduled',
        u'Оголошено тендер': u'complete',
     }.get(string, string)

def get_type_document(string):
    return {
        u"qualification_documents": u"26",
        u"documents": u"27",
        u"financial_documents": u"27",
        u"eligibility_documents": u"29",
        u"None": u"27",
        u"27": u"None",
    }.get(string, string)

def get_changesRationaleType(string):
    string = string.strip()
    return {
        u'Зміна ціни за одиницю товару': u'itemPriceVariation',
        u'Зміна ціни у зв’язку із зміною ставок податків і зборів': u'taxRate',
        u'Зміна сторонніх показників (курсу, тарифів...)': u'thirdParty',
        u'Припинення участі у рамковій угоді учасника': u'partyWithdrawal',
    }.get(string, string)

def get_change_field_name(change_dict):
    return list(change_dict.keys())[1]

def get_change_field_value(change_dict):
    return list(change_dict.values())[1]

def convert_enquiry_tenderPeriod(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d.%m.%Y %H:%M")
    return date_string

def convert_agreement_delivery(date):
    date_obj = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S.%f+02:00")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(minutes=5)    
    return localized_date.strftime("%d.%m.%Y %H:%M")

def convert_items_delivery_endDate(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d.%m.%Y")
    return date_string

def convert_budget_period(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%Y")
    return date_string

def convert_timeToTime(date):
    date_obj = datetime.strptime(date, "%Y-%m-%d %H:%M:%S")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def convert_timeDate(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def convert_delivery_endDate(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S+02:00")

def provider_convert_enquiry_tender_startDate(date_str):
    date_str = date_str.encode('UTF-8')
    date_str = value_from_ua_month(date_str)
    date_obj = datetime.strptime(date_str, "%d %m, %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(minutes=-15)    
    return localized_date.strftime("2020-%m-%dT%H:%M:%S.%f+02:00")

def provider_convert_enquiry_tender_endDate(date_str):
    date_str = date_str.encode('UTF-8')
    date_str = value_from_ua_month(date_str)
    date_obj = datetime.strptime(date_str, "%d %m, %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)    
    return localized_date.strftime("2020-%m-%dT%H:%M:%S.%f+02:00")

def convert_tenderPeriod_startDate(date_str):
    date_str = date_str.encode('UTF-8')
    date_str = value_from_ua_month(date_str)
    date_obj = datetime.strptime(date_str, "%d %m, %Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)    
    return localized_date.strftime("2020-%m-%dT00:00:00+02:00")

def value_from_ua_month(date_str):
    for oldMonth, newNumber in UA_MONTH_NUMBERS.items():
        date_str = date_str.replace(oldMonth, str(newNumber))
    return date_str

UA_MONTH_NUMBERS = {
    'січня': 1,
    'лютого': 2,
    'березня': 3,
    'квітня': 4,
    'травня': 5,
    'червня': 6,
    'липня': 7,
    'серпня': 8,
    'вересня': 9,
    'жовтня': 10,
    'листопада': 11,
    'Листопад': 11,
    'грудня': 12,
    }

def convert_plan_startDate(date):
    date_obj = datetime.strptime(date, "%d %m, %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("2020-%m-01T%H:%M:%S.%f+02:00")

def convert_status_bids(string):
    string = string.strip()
    return {
        u"Опублікована": u"active",
        u"Не опублікована": u"invalid",

    }.get(string, string)

def adapt_plan_data(initial_data):
    # set user name
    initial_data['procuringEntity']['name'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'
    initial_data['procuringEntity']['identifier']['id'] = u'31648966'
    initial_data['procuringEntity']['identifier']['legalName'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'
    # buyers
    initial_data['buyers'][0]['name'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'
    initial_data['buyers'][0]['identifier']['id'] = u'31648966'
    initial_data['buyers'][0]['identifier']['legalName'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'

    return initial_data

def adapt_tender_data(initial_data):
    # set user name
    initial_data['procuringEntity']['name'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'
    initial_data['procuringEntity']['identifier']['id'] = u'31648966'
    initial_data['procuringEntity']['identifier']['legalName'] = u'ТОВАРИСТВО З ОБМЕЖЕНОЮ ВІДПОВІДАЛЬНІСТЮ \"ЗАКУПІВЛІ ЮА\"'
    # address
    initial_data['procuringEntity']['address']['postalCode'] = u'04444'
    initial_data['procuringEntity']['address']['region'] = u'Львівська область'
    initial_data['procuringEntity']['address']['locality'] = u'Львів'
    initial_data['procuringEntity']['address']['streetAddress'] = u'вулиця Тестова, 32'
    # contactPoint
    initial_data['procuringEntity']['contactPoint']['email'] = u'test_owner_arm@ukr.net'
    initial_data['procuringEntity']['contactPoint']['telephone'] = u'+380630000000'
    initial_data['procuringEntity']['contactPoint']['name'] = u'R2-D2'

    return initial_data

def convert_currency(string):
    string = string.strip()
    return {
        u"грн.": u"UAH",
    }.get(string, string)

def convert_unit_code(string):
    string = string.strip()
    return {
        u"штуки": u"H87",
        u"упаковка": u"PK",
        u"кілограми": u"KGM",
        u"лот": u"LO",
        u"набір": u"SET",
    }.get(string, string)

def convert_fundingKind(string):
    string = string.strip()
    return {
        u"Cпівфінансування з бюджетних коштів": u"budget",
        u"Фінансування виключно за рахунок Учасника": u"other",
    }.get(string, string)

def convert_valueAddedTaxIncluded(string):
    string = string.strip()
    return {
        # owner
        u"Не враховуючи ПДВ": False,
        u"Враховуючи ПДВ": True,
        # provider
        u"без ПДВ": False,
        u"з ПДВ": True,
        # claim
        u"Вимогу задоволено": True,

    }.get(string, string)

def convert_method_type(string):
    string = string.strip()
    return {
        u"Допорогова закупівля": u"belowThreshold",
        u"Відкриті торги": u"aboveThresholdUA",
        u"Відкриті торги з публікацією англ.мовою": u"aboveThresholdEU",
        u"Відкриті торги з публікацією англійською мовою": u"aboveThresholdEU",
        u"Конкурентний діалог": u"competitiveDialogueUA",
        u"Конкурентний діалог з публікацією англ. мовою": u"competitiveDialogueEU",
        u"Переговорна процедура": u"negotiation",
        u"Скорочена переговорна процедура": u"negotiation.quick",
        u"Звіт про укладений договір": u"reporting",
        u"Переговорна процедура для потреб оборони": u"aboveThresholdUA.defense",
        u"Закупівля енергосервісу (ESCO)": u"esco",
        u"Укладання рамкової угоди": u"closeFrameworkAgreementUA",
    }.get(string, string)

def convert_status(string):
    string = string.strip()
    return {
        u"Аукціон відмінено": u"cancelled",
        u"Аукціон завершено": u"complete",
        u"Період уточнень": u"active.enquiries",
        u"Аукціон не відбувся": u"unsuccessful",
        u"Період аукціону": u"active.auction",
        u"Кваліфікація переможця": u"active.qualification",
        u"Кваліфікація": u"active.qualification",
        u"Прекваліфікація": u"active.pre-qualification",
        u"Прекваліфікація (період оскаржень)": u"active.pre-qualification.stand-still",
        u"Кваліфікація переможця (період оскаржень)": u"active.qualification.stand-still",
        u"Пропозиції розглянуто": u"active",
        u"Чорновик": u"draft",
        u"Вимога": u"claim",
        u"Дано відповідь": u"answered",
        u"вирішено": u"resolved",
        u"resolved": u"Вирішено",
        u"відкликано": u"cancelled",
        u"не вирішено, ще обробляється": u"pending",
        u"Відмінена": u"cancelled",

        u"Відкликана": u"cancelled",
        u"Не задоволена замовником": u"answered",
        u"Відхилена замовником": u"answered",
# Cтатус в процедуре: -> reporting
        u"Підписаний всіма учасниками": u"active",
        u"Допустити до аукціону": u"active",
        u"Відхилити пропозицію": u"unsuccessful",
        u"Активна": u"active",
        u"Пропозицію не розглянуто": u"pending",
        u"потребує підтвердження": u"invalid",
# Cтатус в процедуре: -> negotiation
        u"active": u"Розглядається",
# Cтатус в новой карточке тендера в Мои пропозиции
        u"Потребує підтвердження": u"invalid",
        u"Опублікована": u"invalid",
# Cтатус в процедуре: -> below
        u"Уточнення": u"active.enquiries",
# потребує підтвердження (invalid)
        u"В очікуванні": u"invalid",
        u"Неактивна": u"invalid",
# Для участника Provider
        u"Прийом пропозицій": u"active.tendering",
        u"Очікування пропозицій": u"active.tendering",
# Конвертация для Negotiation
        u"Дискваліфікована": u"cancelled",
        # u"Відхилена": u"cancelled",
        u"Переможець": u"active",
        u"Обрано переможцем": u"active",
# Конвертация для Reporting
        u"Завершена закупівля": u"complete",
        u"Очікується підписання": u"pending",
# Конвертация для Complaints
        u"Задоволена замовником": u"answered",
# Конвертация для Selection
        u"Період запрошень": u"active.enquiries",
        u"Укладена рамкова угода": u"active",
        # u"Укладена рамкова угода": u"complete",

        u"Очікування другого етапу": u"active.stage2.pending",

    }.get(string, string)

def convert_uatenders_string_to_common_string(string):
    string = string.strip()
    return {
        u"килограммы": u"кілограм",
        u"Картонки": u"Картонні коробки",
        u'ДК 021:2015': u'ДК021',    
        u'Код ДК 021:': u'ДК021',    
        u'Код ДК 021': u'ДК021',    
        u'місто Київ': u'м. Київ',
        u'Київ': u'м. Київ',
# unit
        u'штуки': u'Штуки',
        u'упаковка': u'Упаковка',
        u'кілограми': u'Кілограми',
        u'набір': u'Набір',
        u'лот': u'Лот',
        u'Україна': u'UA',
        u'Не визначено': u'Не відображене в інших розділах',
# Cтатус в процедуре: -> reporting
        u"value.amount": u"amount",
        u"minimalStep.amount": u"minimal_step",

    }.get(string, string)

def convert_uatenders_items(string):
    string = string.strip()
    return {
 # unit
        u'Штуки': u'штуки',
        u'Упаковка': u'упаковка',
        u'Кілограми': u'кілограми',
        u'Набір': u'набір',
        u'Лот': u'лот',

    }.get(string, string)

def convert_uatenders_string_to_ClaimsStatus(string):
    string = string.strip()
    return {
# TODO: -> Конвертация для Claims
        u"Відхилена": u"invalid",
        u"Виконана замовником": u"resolved",
        u"Очікує розгляду": u"claim",
        u"Задоволена": u"resolved",
        u"Вирішено": u"resolved",
        u"Відкликана": u"cancelled",
        u"Відкликано": u"cancelled",
        u"Відхилена замовником": u"invalid",
        u"Не задоволена замовником": u"declined",
        u"Задоволена замовником": u"resolved",
        u"Залишена без відповіді": u"ignored",
        u"Не задоволена": u"declined",
        u"Відкликана, очікується рішення про припинення розгляду": u"stopping",

    }.get(string, string)

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y %H:%M")
    return date_string

def convert_datetime_for_delivery_plus_2_day(date):
    date_obj = datetime.strptime(date, "%d-%m-%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(days=2)    
    return localized_date.strftime("%d-%m-%Y %H:%M")
def convert_datetime_for_delivery_plus_25_day(date):
    date_obj = datetime.strptime(date, "%d-%m-%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(days=25)    
    return localized_date.strftime("%d-%m-%Y %H:%M")

#Время для старой карточки тендера
def convert_auction_date(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def convert_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(minutes=+8)    
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")
    
def get_unit_id(string):
     return {
        u"набір": u"3",
        u"упаковка": u"5",
        u"послуга": u"9",
        u"метри кубічні": u"10",
        u"метри квадратні": u"13",
        # u"штуки": u"15",
        u"Штуки": u"15",
        u"лот": u"17",
        u"кілограми": u"20",
        u"0.05": u"5",
        u"0.01": u"1",
        u"5": u"0.05",
        u"1": u"0.01",
        u"artContestIP": u"1",
        u"noCompetition": u"2",
        u"quick": u"3",
        u"twiceUnsuccessful": u"4",
        u"additionalPurchase": u"5",
        u"additionalConstruction": u"6",
        u"stateLegalServices": u"7",
        u"лютого": u"02",
        u"червня": u"06",
        u"липня": u"07",
        u"серпня": u"08",
        u"вересня": u"09",
        u"жовтня": u"10",
        u"листопада": u"11",
        u"грудня": u"12",

    }.get(string, string)

def get_region_delivery_id(string):
     return {
        u"Закарпатська область": u"1",
        u"Львівська область": u"2",
        u"Волинська область": u"3",
        u"Тернопільська область": u"5",
        u"Чернівецька область": u"6",
        u"Рівненська область": u"7",
        u"Хмельницька область": u"8",
        u"Вінницька область": u"9",
        u"Житомирська область": u"10",
        u"Київська область": u"11",
        u"Черкаська": u"12",
        u"Одеська область": u"13",
        u"Кіровоградська область": u"14",
        u"Миколаївська област": u"15",
        u"Чернігівська область": u"16",
        u"Полтавська область": u"17",
        u"Сумська область": u"18",
        u"Дніпропетровська область": u"19",
        u"Херсонська область": u"20",
        u"Запорізька область": u"22",
        u"Харківська область": u"23",
        u"Донецька область": u"24",
        u"Луганська область": u"25",
        u"м. Київ": u"26",
        u"місто Київ": u"26",
    }.get(string, string)

def get_file_path():
    return os.path.join(os.getcwd(), 'src/robot_tests.broker.uatenders/fileupload.txt')

def get_file_path_key():
    return os.path.join(os.getcwd(), 'src/robot_tests.broker.uatenders/testKey-6.dat')

def download(url, file_name, output_dir):
    urllib.urlretrieve(url, ('{}/{}'.format(output_dir, file_name)))

def get_plus_Index(value):
    return int(value) + 1

def get_minus_Index(value):
    return int(value) - 1

def string_to_float(string):
    return float(string)

def float_to_string_2f(value):
    return '{:.2f}'.format(value)

#Данные, которые приходят с "supplier_data"
def adapt_data_supplier_data(supplier_data):
    data = supplier_data['data']
  # address
    if 'address' in data['suppliers'][0]:
        for i in data['suppliers']:
            i['address']['region'] = u'Київ'
  # contactPoint
    if 'contactPoint' in data['suppliers'][0]:
        for i in data['suppliers']:
            i['contactPoint']['telephone'] = u'+380001112233'
    return supplier_data

#Время для новой карточки тендера
def convertTextMonth_qualificationPeriod_endDate_getTenderPeriodEnd_plus10min(date_str):
    date_str = date_str.encode('UTF-8')
    date_str = value_from_ua_month(date_str)
    date_obj = datetime.strptime(date_str, "%d %m, %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj) + timedelta(minutes=+8)     
    return localized_date.strftime("2020-%m-%dT%H:%M:%S.%f+0300")
