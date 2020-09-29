import QtQuick 2.12

CalendarViewForm {
    function getMaidList(cDate) {
        console.log(cDate)
        return "Jean Onari"
    }

    function isDateWeekend(cDate) {
        var day = cDate.getDay();
        var isWeekend = (day === 6) || (day === 0);    // 6 = Saturday, 0 = Sunday
        return isWeekend;
    }
    function isToday(cDate) {
        const today = new Date();
        return cDate.getDate() === today.getDate();
    }

}
