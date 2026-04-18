var plasma = getApiVersion(1);

var layout = {
    "desktops": [
        {
            "applets": [
                {
                    "config": {
                        "/": {
                            "CurrentPreset": "org.kde.plasma.systemmonitor",
                            "UserBackgroundHints": "ShadowBackground"
                        },
                        "/Appearance": {
                            "chartFace": "org.kde.ksysguard.piechart",
                            "title": "memória"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/FaceGrid/Appearance": {
                            "chartFace": "org.kde.ksysguard.linechart",
                            "showTitle": "false"
                        },
                        "/FaceGrid/SensorColors": {
                            "memory/physical/used": "83,85,93"
                        },
                        "/FaceGrid/Sensors": {
                            "highPrioritySensorIds": "[\"memory/physical/used\"]"
                        },
                        "/SensorColors": {
                            "memory/physical/used": "83,85,93"
                        },
                        "/Sensors": {
                            "highPrioritySensorIds": "[\"memory/physical/used\"]",
                            "lowPrioritySensorIds": "[\"memory/physical/total\"]",
                            "totalSensors": "[\"memory/physical/usedPercent\"]"
                        }
                    },
                    "geometry.height": 0,
                    "geometry.width": 0,
                    "geometry.x": 0,
                    "geometry.y": 0,
                    "plugin": "org.kde.plasma.systemmonitor.memory",
                    "title": "Monitor do sistema"
                },
                {
                    "config": {
                        "/": {
                            "CurrentPreset": "org.kde.plasma.systemmonitor",
                            "UserBackgroundHints": "ShadowBackground"
                        },
                        "/Appearance": {
                            "chartFace": "org.kde.ksysguard.piechart",
                            "title": "CPU"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/SensorColors": {
                            "cpu/all/usage": "83,85,93"
                        },
                        "/Sensors": {
                            "highPrioritySensorIds": "[\"cpu/all/usage\"]",
                            "lowPrioritySensorIds": "[\"cpu/all/cpuCount\",\"cpu/all/coreCount\"]",
                            "totalSensors": "[\"cpu/all/usage\"]"
                        }
                    },
                    "geometry.height": 0,
                    "geometry.width": 0,
                    "geometry.x": 0,
                    "geometry.y": 0,
                    "plugin": "org.kde.plasma.systemmonitor.cpu",
                    "title": "Monitor do sistema"
                }
            ],
            "config": {
                "/": {
                    "ItemGeometries-1920x1080": "Applet-989:1584,752,160,208,0;Applet-988:1760,752,160,192,0;",
                    "ItemGeometriesHorizontal": "Applet-989:1584,752,160,208,0;Applet-988:1760,752,160,192,0;",
                    "formfactor": "0",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                },
                "/ConfigDialog": {
                    "DialogHeight": "630",
                    "DialogWidth": "810"
                },
                "/General": {
                    "changedPositions": "{\"desktop:/curseforge.desktop\":[\"1920x1080\",\"2\",\"9\"],\"desktop:/firefox.desktop\":[\"1920x1080\",\"3\",\"1\"],\"desktop:/google-chrome.desktop\":[\"1920x1080\",\"3\",\"0\"],\"desktop:/heroic.desktop\":[\"1920x1080\",\"3\",\"10\"],\"desktop:/kitty.desktop\":[\"1920x1080\",\"0\",\"1\"],\"desktop:/minecraft-launcher.desktop\":[\"1920x1080\",\"2\",\"10\"],\"desktop:/net.lutris.Lutris.desktop\":[\"1920x1080\",\"3\",\"9\"],\"desktop:/org.godotengine.Godot.desktop\":[\"1920x1080\",\"0\",\"14\"],\"desktop:/org.kde.spectacle.desktop\":[\"1920x1080\",\"0\",\"3\"],\"desktop:/steam.desktop\":[\"1920x1080\",\"3\",\"11\"],\"desktop:/virtualbox.desktop\":[\"1920x1080\",\"1\",\"0\"]}",
                    "iconSize": "2",
                    "lastResolution": "1920x1080",
                    "positions": "{\"1920x1080\":[\"4\",\"20\",\"desktop:/curseforge.desktop\",\"2\",\"9\",\"desktop:/minecraft-launcher.desktop\",\"2\",\"10\",\"desktop:/google-chrome.desktop\",\"3\",\"0\",\"desktop:/kitty.desktop\",\"0\",\"1\",\"desktop:/firefox.desktop\",\"3\",\"1\",\"desktop:/org.kde.dolphin.desktop\",\"0\",\"2\",\"desktop:/systemsettings.desktop\",\"0\",\"0\",\"desktop:/heroic.desktop\",\"3\",\"10\",\"desktop:/virtualbox.desktop\",\"1\",\"0\",\"desktop:/org.godotengine.Godot.desktop\",\"0\",\"14\",\"desktop:/org.kde.spectacle.desktop\",\"0\",\"3\",\"desktop:/steam.desktop\",\"3\",\"11\",\"desktop:/code.desktop\",\"0\",\"13\",\"desktop:/net.lutris.Lutris.desktop\",\"3\",\"9\"]}",
                    "sortMode": "-1"
                },
                "/Wallpaper/org.kde.image/General": {
                    "Image": "file:///usr/share/wallpapers/cachyos-wallpapers/Cachyadventure219.png",
                    "SlidePaths": "/home/samns/.local/share/wallpapers/,/usr/share/wallpapers/"
                }
            },
            "wallpaperPlugin": "org.kde.image"
        }
    ],
    "panels": [
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "451",
                            "popupWidth": "560"
                        },
                        "/Appearance": {
                            "autoFontAndSize": "false",
                            "boldText": "true",
                            "customDateFormat": "ddd d MMM",
                            "dateDisplayFormat": "BelowTime",
                            "dateFormat": "custom",
                            "displayTimezoneFormat": "UTCOffset",
                            "fontStyleName": "bold",
                            "fontWeight": "700",
                            "showSeconds": "Always",
                            "use24hFormat": "2"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        }
                    },
                    "plugin": "org.kde.plasma.digitalclock"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.panelspacer"
                },
                {
                    "config": {
                        "/": {
                            "CurrentPreset": "org.kde.plasma.systemmonitor",
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/Appearance": {
                            "chartFace": "org.kde.ksysguard.piechart",
                            "title": "Uso total da CPU"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/SensorColors": {
                            "memory/physical/used": "83,85,93"
                        },
                        "/Sensors": {
                            "highPrioritySensorIds": "[\"cpu/all/usage\"]",
                            "lowPrioritySensorIds": "[\"cpu/all/cpuCount\",\"cpu/all/coreCount\"]",
                            "totalSensors": "[\"cpu/all/usage\"]"
                        }
                    },
                    "plugin": "org.kde.plasma.systemmonitor.memory"
                },
                {
                    "config": {
                        "/": {
                            "CurrentPreset": "org.kde.plasma.systemmonitor",
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/Appearance": {
                            "chartFace": "org.kde.ksysguard.piechart",
                            "title": "Uso da memória"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/SensorColors": {
                            "memory/physical/used": "83,85,93"
                        },
                        "/Sensors": {
                            "highPrioritySensorIds": "[\"memory/physical/used\"]",
                            "lowPrioritySensorIds": "[\"memory/physical/total\"]",
                            "totalSensors": "[\"memory/physical/usedPercent\"]"
                        }
                    },
                    "plugin": "org.kde.plasma.systemmonitor.memory"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.systemtray"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "400",
                            "popupWidth": "560"
                        },
                        "/General": {
                            "elements": "19,20,10,9,2,25,8,23,21",
                            "selected_theme": "Custom",
                            "xElements": "0,1,2,2,0,0,1,3,2",
                            "yElements": "1,1,1,2,0,3,3,3,3"
                        }
                    },
                    "plugin": "Plasma.Flex.Hub"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 2.6666666666666665,
            "hiding": "dodgewindows",
            "location": "top",
            "maximumLength": 106.66666666666667,
            "minimumLength": 106.66666666666667,
            "offset": 0
        },
        {
            "alignment": "center",
            "applets": [
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                },
                {
                    "config": {
                        "/": {
                            "popupHeight": "559",
                            "popupWidth": "663"
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "favoritesPortedToKAstats": "true",
                            "icon": "org.cachyos.hello",
                            "systemFavorites": "suspend\\,hibernate\\,reboot\\,shutdown"
                        }
                    },
                    "plugin": "org.kde.plasma.kickoff"
                },
                {
                    "config": {
                        "/": {
                            "launchers": ""
                        },
                        "/ConfigDialog": {
                            "DialogHeight": "630",
                            "DialogWidth": "810"
                        },
                        "/General": {
                            "iconSpacing": "0",
                            "indicateAudioStreams": "false",
                            "launchers": "applications:org.kde.dolphin.desktop,applications:firefox.desktop,applications:google-chrome.desktop,applications:hydralauncher.desktop,applications:com.hypixel.HytaleLauncher.desktop,applications:steam.desktop,applications:kitty.desktop,applications:code.desktop,applications:idea.desktop,applications:org.godotengine.Godot.desktop,applications:org.kde.gwenview.desktop,applications:systemsettings.desktop,applications:com.obsproject.Studio.desktop,applications:org.kde.kwrite.desktop",
                            "maxStripes": "1"
                        }
                    },
                    "plugin": "org.kde.plasma.icontasks"
                },
                {
                    "config": {
                    },
                    "plugin": "org.kde.plasma.marginsseparator"
                }
            ],
            "config": {
                "/": {
                    "formfactor": "2",
                    "immutability": "1",
                    "lastScreen": "0",
                    "wallpaperplugin": "org.kde.image"
                }
            },
            "height": 3.7222222222222223,
            "hiding": "dodgewindows",
            "location": "bottom",
            "maximumLength": 106.66666666666667,
            "minimumLength": 106.66666666666667,
            "offset": 0
        }
    ],
    "serializationFormatVersion": "1"
}
;

plasma.loadSerializedLayout(layout);
