# -*- coding: utf-8 -*-
import pytz
from iso8601 import parse_date
from datetime import datetime, timedelta
import os
import urllib

def get_all_uatenders_dates(tender_data):
    return {
        'StartDate': tender_data['data']['auctionPeriod']['startDate'],
        
    }

def convert_uatenders_string_to_common_string(string):
    string = string.strip()
    return {
        u"килограммы": u"кілограм",
        u"(Не враховуючи ПДВ)": False,
        u"(Враховуючи ПДВ)": True,
        u"Картонки": u"Картонні коробки",
        u"Аукціон відмінено": u"cancelled",
        u"Аукціон завершено": u"complete",
        u"Період уточнень": u"active.enquiries",
        u"Аукціон не відбувся": u"unsuccessful",
        u"Очікування пропозицій": u"active.tendering",
        u"Період аукціону": u"active.auction",
        u"Кваліфікація переможця": u"active.qualification",
        u"Пропозиції розглянуто": u"active",
        u"майна банків": u"dgfOtherAssets",
        u"прав вимоги за кредитами": u"dgfFinancialAssets",
        u"x_nda": u"23",
        u"tenderNotice": u"14",
        u"x_presentation": u"22",
        u"technicalSpecifications": u"15",
        u"Ні": False,
        u"Так": True,
        u"комунальна": [u"комунальна"],
        u"державна": [u"державна"],
        u"приватна": [u"приватна"],            
        u"Підтвердження протоколу": u"pending.verification",
        u"Очікування рішення": u"pending.waiting",
        u"Очікується оплата": u"pending.payment",
        u"Оплачено, очікується підписання договору": u"active",
        u"Відхилено": u"unsuccessful",
        u"Відмінено": u"cancelled",
        u"Скасування активовае": u"active",
        u"Опубліковано": u"pending",
        u"Аукціон": u"active.auction",
        u"Скасування активоване.": u"active",
        u"Переможець": u"active",
        u"Очікується рішення": u"pending",
        #  award
        u"Рішення скасоване": u"unsuccessful",
        u"Відмова від очікування": u"cancelled",
        #  contract
        u"Договір було скасовано до підписання": u"cancelled",
        u"Підписаний всіма учасниками": u"active",
        u"Об’єкт виставлено на продаж": u"active.salable",
        u"Видалено": u"deleted",
        u"Аукціон (Мала приватизація)": u"sellout.english",
        u"Аукціон за методом покрокового зниження стартової ціни та подальшого подання": u"sellout.insider",
        u"Заплановано": u"scheduled",
        #  contract_management
        u"Очікується оплата": u"active.payment",
        u"Виконано": u"met",
        u"Виконано": u"partiallyMet",
        u"Договір оплачено. Очікується наказ": u"active.approval",
        u"Не виконано": u"notMet",
        u"Приватизація об’єкта завершена": u"terminated",
        u"Приватизація об’єкта неуспішна": u"unsuccessful",
                         
    }.get(string, string)

def convert_datetime_for_delivery(isodate):
    iso_dt = parse_date(isodate)
    date_string = iso_dt.strftime("%d-%m-%Y %H:%M")
    return date_string

def adapt_procuringEntity(tender_data):
    tender_data['data']['procuringEntity']['name'] = u'ТОВ "Роги і копита"'
    tender_data['data']['procuringEntity']['address']['countryName'] = u"Україна"
    return tender_data

def adapt_item(tender_data, role_name):
    if role_name != 'viewer':
        if 'unit' in tender_data['data']['items'][0]:
            for i in tender_data['data']['items']:
                i['unit']['name'] = my_dict[i['unit']['name']]
    return tender_data

def convert_bank_identification_date(date):
    date_obj = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S.%f+03:00")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%d.%m.%Y %H:%M:%S")

def convert_contract_Met_date(date):
    date_obj = datetime.strptime(date, "%Y-%m-%dT%H:%M:%S+03:00")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%d.%m.%Y %H:%M:%S")

def convert_auction_date(date):
    date_obj = datetime.strptime(date, "%d.%m.%Y %H:%M")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def convert_date_modified(date):
    date_obj = datetime.strptime(date, "%Y-%m-%d %H:%M:%S")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT%H:%M:%S.%f%z")

def convert_contractPeriod_date(date):
    date_obj = datetime.strptime(date, "%Y-%m-%d %H:%M:%S")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%Y-%m-%dT00:00:00+02:00")

def convert_dateMet(date):
    date_obj = datetime.strptime(date, "%Y-%m-%d %H:%M:%S")
    time_zone = pytz.timezone('Europe/Kiev')
    localized_date = time_zone.localize(date_obj)
    return localized_date.strftime("%d.%m.%Y %H:%M:%S")

def get_unit_id(string):
     return {
        u"послуга": u"8",
        u"метри квадратні": u"28",
        u"штуки": u"14",
        u"гектар": u"15",
        u"notice": u"27",
        u"x_presentation": u"30",
        u"technicalSpecifications": u"28",

    }.get(string, string)

def get_file_path():
    return os.path.join(os.getcwd(), 'src/robot_tests.broker.uatenders/fileupload.txt')

def download(url, file_name, output_dir):
    urllib.urlretrieve(url, ('{}/{}'.format(output_dir, file_name)))

def is_qualified(bid_data, username):
    if username == 'uatenders_Provider':
        if 'qualified' in bid_data['data']:
            return False
    return True

def get_dgf(dgfdate):
    newDate = datetime.strptime(dgfdate, "%Y-%m-%d")
    return newDate.strftime("%d.%m.%Y")

def getIndex(attr):
    return attr[-1]

def get_minus_Index(value):
    return int(value) - 1

def get_question_locator(string):
     return {
        u"title": u"questionTitle-",
        u"description": u"questionDesc-",
    }.get(string, string)
