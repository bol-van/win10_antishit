rem default - demand
sc config dssvc start= disabled
sc stop dssvc
rem default - demand
sc config homegroupprovider start= disabled                                            		
sc stop homegroupprovider
rem default - demand
sc config ssdpsrv start= disabled
sc stop ssdpsrv
rem default - demand
sc config upnphost start= disabled
sc stop upnphost
rem default - demand
sc config SensorService start= disabled
sc stop SensorService
rem default - demand
sc config sensrsvc start= disabled
sc stop sensrsvc
rem LIVEID signin. Probably needed by Store.
rem default - demand
sc config wlidsvc start= disabled
sc stop wlidsvc
