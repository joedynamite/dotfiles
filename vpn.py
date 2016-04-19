#!/usr/bin/env python

from __future__ import print_function
from subprocess import call

import cookielib

import bs4
import mechanize

br = mechanize.Browser()

import ssl
ssl._create_default_https_context = ssl._create_unverified_context

cj = cookielib.LWPCookieJar()
br.set_cookiejar(cj)

# br.set_debug_http(True)
# br.set_debug_redirects(True)
# br.set_debug_responses(True)

br.set_handle_robots(False)

LOGIN_PAGE = "https://remote.advancepubs.com/dana-na/auth/url_30/welcome.cgi"

# print('Opening login page')
br.open(LOGIN_PAGE)

br.select_form(name="frmLogin")

br["username"] = 'jbilt'
br["password"] = 'PASSWORD_ONE'
br["realm"] = ['Conde Nast']

# print('Submitting login form #1')
br.submit()

br.select_form(name="frmLogin")

br["user#2"] = 'jbilt'
br["password#2"] = 'PASSWORD_TWO'

# print('Submitting login form #2')
response = br.submit()

if 'welcome.cgi' in br.geturl():  # Hit max sessions
    # print('Hit max sessions, logging others out')

    br.select_form(name='frmConfirmation')  # select all sessions to log out

    # We need to do this because mechanize parses checkbox values to 'on'
    bs = bs4.BeautifulSoup(response.read(), 'lxml')
    checkboxes = bs.find_all('input', type='checkbox')
    for checkbox in checkboxes:
        checkbox_name = checkbox.attrs['name']
        checkbox_value = checkbox.attrs['value']
        br.form.new_control('hidden', checkbox_name, {'value': checkbox_value})

    # print('Submitting request to log all other sessions out')
    br.submit(name='btnContinue')

dsid = ""

for cookie in cj:
    if cookie.name == 'DSID':
        dsid = cookie.value
        print(dsid)
        break

connect_command = 'sudo openconnect --juniper -C "DSID=' + dsid + '" remote.advancepubs.com'
print(connect_command)
call(connect_command, shell=True)
