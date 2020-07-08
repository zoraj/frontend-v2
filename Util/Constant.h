#pragma once

#include <QString>

namespace Constant {

#ifdef QT_DEBUG
    static const QString WS_ROOT_URL = "http://localhost:8080/api";
    static const QString WS_E_URL = "http://localhost:8080/e/api"; // e for Establishment
    static const QString MESSAGE_ENQ_URI = "ws://localhost:8080/messaging/?api-key=%1";
#else
    static const QString WS_ROOT_URL = "https://api.bymmc.com";
    static const QString WS_E_URL = "https://bymmc.com";
    static const QString MESSAGE_ENQ_URI = "wss://messaging.bymmc.com/push-notification?api-key=%1";
#endif
    static const QString DB_CACHE = "mmc.prod.db3";

    // WS PATH
    // AUTHENTICATION
    static const QString WS_METHOD_LOGIN                  = "/users/signin";

    //CLIENT
    static const QString WS_METHOD_CLIENT                  = "/clients";
    static const QString WS_METHOD_CLIENT_TYPE             = "/clients/type-client";
    static const QString WS_METHOD_CLIENT_SEGMENT          = "/clients/segment-client";
    static const QString WS_METHOD_CLIENT_PRESCRIPTEUR     = "/clients/prescripteur";
    //ROOM
    static const QString WS_METHOD_ROOM                    = "/rooms/";
    static const QString WS_METHOD_ROOM_CATEGORIES         = "/rooms/categories";
    static const QString WS_METHOD_ROOM_TYPES              = "/rooms/type";
    //SECTION SERVICE
    static const QString WS_METHOD_SECTIONS_ACTIVITIES     = "/sections/activities";
    static const QString WS_METHOD_SECTIONS_POSTES         = "/sections/postes";
    static const QString WS_METHOD_SECTIONS_SITES          = "/sections/sites";
    //PRODUCT
    static const QString WS_METHOD_PRODUCTS_POS            = "/products/pos";
    static const QString WS_METHOD_PRODUCTS_GROUPS         = "/products/groups";
    static const QString WS_METHOD_PRODUCTS_PMS            = "/products/pms";
    static const QString WS_METHOD_PRODUCTS_SIRUP_PARFUME  = "/products/sirup-parfume";
    //NOTES
    static const QString WS_METHOD_NOTES_POS_DETAILS       = "/notes/pos/details";
    static const QString WS_METHOD_NOTES_POS_HEADER        = "/notes/pos/header";
    static const QString WS_METHOD_NOTES_PMS_DETAILS       = "/notes/pms/details";
    static const QString WS_METHOD_NOTES_PMS_HEADER        = "/notes/pms/header";
    //HOUSEKEEPING
    static const QString WS_METHOD_CLEANING_SCHEDULE       = "/cleaning-schedule";
    //CASHING
    static const QString WS_METHOD_CASHING_MODE            = "/cashing/mode";
    static const QString WS_METHOD_CASHING_PMS             = "/cashing/pms";
    static const QString WS_METHOD_CASHING_POS             = "/cashing/pos";
    // ESTABLISHMENT SERVICE
    static const QString WS_REGISTER_NEW_ESTABLISHMENT     = "/e";
    static const QString WS_CODE_CONFIRM_NEW_DEVICE        = "/devices/activate?activation-code=%1";
    //FAMILY
    static const QString WS_METHOD_FAMILY                  = "/families";
    static const QString WS_METHOD_SUB_FAMILY              = "/families/sub-families";


    enum HttpStatusCode {
        OK = 200,
        Created  = 201,
        BadRequest = 400,
        Unauthorized = 401,
        NotFound = 404,
        InternalServerError = 501,
        HostNotFound = 503,
        UnknownError,
    };

    enum Module {
        Unknown =  -1,
        POS_TRADITIONAL = 0,
        RECEP = 1,
        RESA = 2,
        HOUSEKEEPING = 3,
        POS_COLLECTIVITE = 4,
        PMS = 5
    };
}

