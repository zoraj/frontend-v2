import QtQuick 2.12

PlanningViewForm {

    Component.onCompleted: {
        toolBar.visible = true
        tabBar.visible = true
        drawPlanningContainer()
        drawReservation()
    }

    newNoteButton.onClicked: {
        onClicked: mainStackView.push(null, "qrc:/View/Pms/Resa/BookingDetailView.qml")
    }

    function getDate(index) {
        var dateClient = new Date();
        dateClient.setDate(dateClient.getDate() + index)
        return dateClient.toDateString()
    }

    function getRoom(index) {
        var rooms = ["T_1","T_2","T_3","T_4","T_5","T_6","T_7","T_8","T_9","T_10","T_11","T_12","T_13","T_14","T_15","T_16","T_17","T_18","T_17","T_18","T_19","T_20"];
        return rooms[index];
    }

    function dateToPos() {

    }

    function roomToPos() {

    }

    function dayDiff(d1, d2)
    {
        d1 = d1.getTime() / 86400000;
        d2 = d2.getTime() / 86400000;
        let diff = Number(d2 - d1).toFixed(0);
        return diff;
    }

    function drawPlanningContainer() {

    }

    function drawReservation() {
        var rooms = ["T_1","T_2","T_3","T_4","T_5","T_6","T_7","T_8","T_9","T_10","T_11","T_12","T_13","T_14","T_15","T_16","T_17","T_18","T_17","T_18","T_19","T_20"];
        var reservations = [
                    {"dateArrivee":"2020-09-19", "dateDepart":"2020-09-20","name":"Jean Onari","nbNuitee":5,"chambre":"T_1"},
                    {"dateArrivee":"2020-09-18", "dateDepart":"2020-09-19","name":"Amanda","nbNuitee":6,"chambre":"T_10"},
                    {"dateArrivee":"2020-09-17", "dateDepart":"2020-09-17","name":"Elinah","nbNuitee":6,"chambre":"T_20"}
                ];

        reservations.forEach(function (reservation) {
            var i = 0;
            console.log(rooms.indexOf(reservation.chambre));
            let roomIndex = rooms.indexOf(reservation.chambre);
            let dateClient = new Date();
            let arrivalDate = new Date(reservation.dateArrivee);
            let diff = dayDiff(dateClient, arrivalDate);
            console.log("DIFF:" + diff);

            console.log("Date client:" + dateClient);
            let arrivalIndex = reservation.dateArrivee;

            Qt.createComponent("qrc:/View/Component/MmcPlanningItem.qml").createObject(containerPlanningRectangle,
                                                                {"x": 0 + diff * 10,
                                                                 "y": 0 + roomIndex * 30,
                                                                 "bookingName": reservation.name,
                                                                 "coeff": 3
                                                                });
            i++;
        });

        /*
        for(var reservation in reservations) {
            console.log("name:" + reservation.dateArrivee);
            Qt.createComponent("PlanningItem.qml").createObject(container,
                                                                {"x": 300,
                                                                 "y": 300,
                                                                 "bookingName": reservation.name,
                                                                 "coeff": 3
                                                                });

        }*/
        /*
        Qt.createComponent("PlanningItem.qml").createObject(container, {
                                                                "x": 500,
                                                                "y": 500,
                                                                "bookingName": "Elinah Rabalison",

                                                            });*/
    }
}
