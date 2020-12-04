To generate Win 64 executable
windeployqt c:\Temp\Exe  --qmldir c:\Projects\MM\Frontend\Views


QML Code convention. Copy paste it everytime you create a new qml
All UI should be inside .ui.qml

/ ************************  Start Component Initialization *************************** /
Connections {
}
/ ************************  End Component Initialization ***************************** /


/ ************************  Start UI Component Initialization ************************ /
ListModel {
}

/ ************************  Start View Did Load ************************************** /
Component.onCompleted: {

}
/ ************************  End View Did Load **************************************** /

/ ************************  Start View Did Unload ************************************** /


/ ************************  End View Did Unload **************************************** /


/ ************************  Start Event Logic **************************************** /
validateButton.onClicked: {

}
/ ************************  End Event Logic ****************************************** /


/ ************************  Start User function ************************************** /
validateButton.onClicked: {

}

/ ************************  End User function **************************************** /


Class code convention
// Public Methods
// Constructor

// UI Events
viewDidLoad() const

viewDidUnload() const


// Private Methods
void persistData()

void loadData()







