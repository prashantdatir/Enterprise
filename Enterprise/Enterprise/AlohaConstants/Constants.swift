//
//  Constants.swift
//  sureEcosystem Inspect
//
//  Created by admin on 16/05/18.
//

import Foundation

//let BASE_URL = "http://192.168.50.114/api/MobileAPI" //Local

//let BASE_URL = "http://54.85.210.18/Inspect/Api/api/MobileAPI" //AWS
//let BASE_URL = "http://18.207.212.164/Inspect/Api/api/MobileAPI"
  let BASE_URL = "http://192.168.8.225:4400/api"
//let BASE_URL = "https://api.sureecosystem.com/inspect/v1/api/mobileapi"  //CC



//let LOGIN_API                = "/login"
let LOGIN_API                  = "/unit/verify"
let CREATE_EVENT_API           = "/event/createEvent"



let GET_EVENT_LIST_API         = "/geteventlist"
let SAVE_ASSET_API             = "/saveassetid"
let GET_NEXT_QUESTION_API      = "/getnextquestion"
let SAVE_ANSWER_API            = "/saveanswer"

let GET_MY_RESPONSE_LIST_API   = "/userresponsetoevent"
let saveAssetID                = "/saveassetId"
let FORGOT_PASSWORD_API        = "/forgotpassword"
let CHANGE_PASSWORD_API        = "/changepassword"
let DOCUMENT_UPLOAD_API        = "/uploadFile"

let APP_NAME                   = "Enterprise"

let MENU_HOME                   = "Home"
let MENU_EVENTS                 = "Events"
let MENU_COMPLETED_EVENTS       = "Completed Events"
let MENU_OVERDUE_EVENTS         = "Overdue Events"
let MENU_FORGOT_PASSWORD        = "Change Password"
let MENU_SETTINGS               = "Settings"
let MENU_LOGOUT                 = "Logout"
let MENU_REQUEST                     = "Request Service"
let MENU_EXISTSERVICE                = "Check Exisiting Service"
let MENU_CONTACTUS      =   "Contact Us"

let ALERT_TITLE         = "Connection Request Timeout"
let ALERT_TITLE_MESSAGE         = "Do you still want to continue?"
let ALERT_TITLE_KEY_MESSAGE     =   "The Key you entered is not a authentic one,Do you want to continue?"

let LOGOUT_ALERT_MESSAGE        = "Do you really want to logout?"
let ALERT_TITLE_YES             = "Yes"
let ALERT_TITLE_CANCEL          = "Cancel"

let START_INSPECTION_TITLE      = "Start Inspection"

let COMPANY_CODE                = "Company Code"
let INSPECTION_EVENT_ID         = "Inspection Event ID"
let ASSET_ID                    = "Asset ID"


//Keys in API
let KEY_CONTEXT_ID = "ContextId"
let KEY_USER_ID    = "userId"
let KEY_COMPANY_ID = "companyId"

let KEY_UNIQUE_ID               = "id"
let KEY_INSPECTION_EVENT_ID     = "inspection_event_id"
let KEY_EVENT_TITLE             = "event_title"
let KEY_EVENT_START_DATE        = "event_start_date"
let KEY_TOTAL_OCCURANCES        = "total_occurance"
let KEY_TOTAL_EVENTS            = "totalEvents"
let KEY_STATUS                  = "status"
let KEY_TOTAL_QUESTION          = "total_questions"
let KEY_OVERDUE_BY              = "overdueby"
let KEY_ASSET_ID                = "asset_id"
let KEY_TOTAL_QUEATIONS         = "totalQuestion"
let KEY_QUESTION_ID             = "inspection_question_id"
let KEY_QUESTION_TEXT           = "text"
let KEY_QUESTION_TYPE_ID        = "question_type_id"
let KEY_TYPE                    = "type"
let KEY_QUESTION_ORDER_ID       = "question_order_id"
let KEY_IS_MANDETORY            = "is_mandatory"
let KEY_FOLLOW_UP_QUESTION_ID   = "follow_up_question_id"
let KEY_SELECT_TYPE             = "select_type"
let KEY_OPTIONS                 = "options"
let KEY_OPTION_ID               = "multiple_choice_option_id"
let KEY_IS_QRCODE_REQUIRED      = "is_qr_required"
let KEY_USER_SURVEY_UNIQUE_ID   = "userSurveyUniqueId"
let KEY_IS_SIGNARTURE_REQUIRED  = "is_signature_required"
let KEY_IS_IMAGE_REQUIRED       = "is_photo_required"
let KEY_IS_DOC_REQUIRED         = "is_document_required"


let KEY_ANSWER_MY_RESPONSE      = "answer"
let KEY_INSPECTION_QUESTION_ANSWER_ID = "inspect_question_answer_id"

let KEY_FOLLOWUP_QUESTIONS      = "followup_questions"
let KEY_QUESTION_TEXT_FOLLOWUP  = "Question_Text"
let KEY_QUESTION_TYPE_FOLLOWUP  = "Question_Type"

let COMPANY_NAME                = "Company Name"
let COMPANY_NAME_OVERDUE        = "Company Name"
let COMPANY_NAME_COMPLETED      = "Company Name"

let AUTH_TOKEN_KEY              = "access_token"

//Error Messages
let LOGIN_ERROR_MESSSAGE  = "Username or Password entered is incorrect. Please try again."

let COMPANY_CODE_TAG            = 1
let INSPECTION_EVENT_ID_TAG     = 2
let ASSET_ID_TAG                = 3

let GET_EVENT_LIST_API_TAG           = 4
let GET_COMPLETED_EVENT_LIST_API_TAG = 5
let GET_OVERDUE_EVENT_LIST_API_TAG   = 6
let SAVE_ASSET_API_TAG               = 7
let GET_NEXT_QUESTION_API_TAG        = 8
let SAVE_ANSWER_API_TAG              = 9
let FORGOT_PASSWORD_API_TAG          = 10
let CHANGE_PASSWORD_API_TAG          = 11

let DATE_TEXT_FIELD_TAG              = 12

let AUTHORISATION_FAILURE_TAG        = 13



//API messages
let ALERT_GET_TITLE     =   "Error while fetching records"
