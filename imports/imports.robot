*** Settings ***
Library    SeleniumLibrary
Library    Collections
Library    String

Resource    ${CURDIR}/../keywords/common.robot

Resource    ${CURDIR}/../keywords/pages/home_page.robot
Resource    ${CURDIR}/../keywords/pages/shopeemall_page.robot
Resource    ${CURDIR}/../keywords/pages/all_brand_page.robot

Resource    ${CURDIR}/../keywords/features/home_feature.robot
Resource    ${CURDIR}/../keywords/features/shopeemall_feature.robot
Resource    ${CURDIR}/../keywords/features/all_brand_feature.robot

Variables    ${CURDIR}/../testdata/testdata.yaml