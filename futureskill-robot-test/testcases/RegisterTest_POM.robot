*** Settings ***
Library    SeleniumLibrary
Resource   ../keywords/HomePageKeywords.robot
Resource   ../keywords/RegisterPageKeywords.robot
Resource   ../resources/variables.robot

*** Test Cases ***
Register Future Skill Member
    [Documentation]    Test case for registering a new member using POM
    Open Future Skill Website
    Click Register Button
    Fill Registration Form
    Submit Registration
    Verify OTP Page
    [Teardown]    Close Browser
