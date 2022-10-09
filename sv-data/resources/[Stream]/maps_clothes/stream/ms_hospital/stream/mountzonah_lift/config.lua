Config                            = {}
Config.DrawDistance               = 30.0
Config.Locale                     = 'de'
Config.showMarker = true

Config.HelicopterSpawner = {
    SpawnPoint = { x = 351.386, y = -588.124, z = 74.165 },
    Heading    = 0.0
}


Config.Zones = {

     Entrance1 = {--
        Marker  = { x = -493.537109375, y = -327.13165283203, z = 41.420713043213  },
        Spawn   = { x = -493.537109375, y = -327.13165283203, z = 42.320713043213 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room1"}
    },

    Entrance2 = {--
        Marker  = { x = -490.51202392578, y = -327.44174194336, z = 41.420713043213 },
        Spawn   = {  x = -490.51202392578, y = -327.44174194336, z = 42.320713043213  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room2"}
    },

    Entrance3 = {--
        Marker  = { x = -487.48541259766, y = -328.02755737305, z = 41.420724487305 },
        Spawn   = { x = -487.48541259766, y = -328.02755737305, z = 42.320724487305 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Room3"}
    },

    UrgenceParking = {--
        Marker  = { x = -436.1484375, y = -359.90380859375, z = 34.009778594971},
        Spawn   = { x = -436.1484375, y = -359.90380859375, z = 34.909778594971 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 350.57266,
		canGoTo = {"Parking"}
    },

    Parking = {--
        Marker  = { x = -418.69403076172, y = -344.67877197266, z = 23.331834411621 },
        Spawn   = { x = -418.69403076172, y = -344.67877197266, z = 24.231834411621},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 106.25228,
		canGoTo = {"UrgenceParking"}
    },
    UrgencePrive = {--
        Marker  = { x = -452.4372253418, y = -288.46655273438, z = 33.894596099854 },
        Spawn   = { x = -452.4372253418, y = -288.46655273438, z = 34.894596099854 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"Operation","RoomPrive","Helipad"}
    },
    Operation = {--
        -- Marker  = { x = -452.52206420898, y = -288.47439575195, z = -129.100 },
		Marker  = { x = -452.52206420898, y = -288.47439575195, z = -131.850 },
        Spawn   = { x = -452.52206420898, y = -288.47439575195, z = -130.850 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"UrgencePrive","RoomPrive","Helipad"}
    },
    RoomPrive = {--
        Marker  = { x = -452.58471679688, y = -288.41131591797, z = 68.604219055176 },
        Spawn   = { x = -452.58471679688, y = -288.41131591797, z = 69.504219055176 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 109.63311,
		canGoTo = {"Operation","UrgencePrive","Helipad"}
    },
    Helipad = {--
        Marker  = { x = -443.96, y = -332.0, z = 77.16 },
        Spawn   = { x = -443.96, y = -332.0, z = 78.16 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 355.23,
        canGoTo = {"Operation","UrgencePrive","RoomPrive"}
    },
    Room1 = {--
        Marker  = { x = -493.62640380859, y = -327.10382080078, z = 68.604829406738 },
        Spawn   = { x = -493.62640380859, y = -327.10382080078, z = 69.504829406738},
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance1"}
    },
    Room2 = {--
        Marker  = { x = -490.54724121094, y = -327.59460449219, z = 68.604783630371 },
        Spawn   = { x = -490.54724121094, y = -327.59460449219, z = 69.504783630371 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance2"}
    },
    Room3 = {--
        Marker  = { x = -487.6123046875, y = -328.17980957031, z = 68.604608154297 },
        Spawn   = { x = -487.6123046875, y = -328.17980957031, z = 69.504608154297 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance3"}
    },
    eleich = {--
        Marker  = { x = -446.25, y = -315.81, z = -131.850 },
        Spawn   = { x = -446.25, y = -315.81, z = -130.850 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"eleich1"}
    },
    eleich1 = {--
        Marker  = { x = 247.26, y = -1371.89, z = 23.54 },
        Spawn   = { x = 247.26, y = -1371.89, z = 24.54 },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"eleich"}
    },
    Entrance20 = {-- 1Floor
        Marker  = { x = -1065.98, y = -833.81, z = 18.04  },
        Spawn   = { x = -1065.98, y = -833.81, z = 19.04  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance24","Entrance23","Entrance22","Entrance21"}
    },
    Entrance21 = {--U3Floor
        Marker  = { x = -1065.98, y = -833.81, z = 14.04  },
        Spawn   = { x = -1065.98, y = -833.81, z = 14.04  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance24","Entrance23","Entrance22","Entrance20"}
    },
    Entrance22 = {--U2Floor
        Marker  = { x = -1065.98, y = -833.81, z = 10.04  },
        Spawn   = { x = -1065.98, y = -833.81, z = 11.04  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance24","Entrance23","Entrance21","Entrance20"}
    },
    Entrance23 = {--O3Floor
        Marker  = { x = -1065.98, y = -833.81, z = 26.04  },
        Spawn   = { x = -1065.98, y = -833.81, z = 27.04  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance24","Entrance22","Entrance21","Entrance20"}
    },
    Entrance24 = {--U1Floor
        Marker  = { x = -1065.98, y = -833.81, z = 04.48  },
        Spawn   = { x = -1065.98, y = -833.81, z = 05.48  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance23","Entrance22","Entrance21","Entrance20"}
    },
    Entrance10 = {--O6Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 37.24  },
        Spawn   = { x = -1096.1, y = -850.35, z = 38.24  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance15","Entrance14","Entrance13","Entrance12","Entrance11"}
    },
    Entrance11 = {--O5Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 33.36  },
        Spawn   = { x = -1096.1, y = -850.35, z = 34.36  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance15","Entrance14","Entrance13","Entrance12","Entrance10"}
    },
        Entrance12 = {--O4Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 29.76  },
        Spawn   = { x = -1096.1, y = -850.35, z = 30.76  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance15","Entrance14","Entrance13","Entrance11","Entrance10"}
    },
    Entrance13 = {--O3Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 25.83  },
        Spawn   = { x = -1096.1, y = -850.35, z = 26.83  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance15","Entrance14","Entrance12","Entrance11","Entrance10"}
    },
    Entrance14 = {--2Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 22.04  },
        Spawn   = { x = -1096.1, y = -850.35, z = 23.04  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance15","Entrance13","Entrance12","Entrance11","Entrance10"}
    },
    Entrance15 = {--O1Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 18.0  },
        Spawn   = { x = -1096.1, y = -850.35, z = 19.0  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance16","Entrance14","Entrance13","Entrance12","Entrance11","Entrance10"}
    },
    Entrance16 = {--U3Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 12.69  },
        Spawn   = { x = -1096.1, y = -850.35, z = 13.69  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance17","Entrance15","Entrance14","Entrance13","Entrance12","Entrance11","Entrance10"}
    },
    Entrance17 = {--U2Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 09.28  },
        Spawn   = { x = -1096.1, y = -850.35, z = 10.28  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance18","Entrance16","Entrance15","Entrance14","Entrance13","Entrance12","Entrance11","Entrance10"}
    },
    Entrance18 = {--U1Floor1
        Marker  = { x = -1096.1, y = -850.35, z = 03.88  },
        Spawn   = { x = -1096.1, y = -850.35, z = 04.88  },
        Size    = { x = 2.0, y = 2.0, z = 1.0 },
        Color   = { r = 255, g = 187, b = 255 },
        Type    = 27,
        Heading = 169.59108,
		canGoTo = {"Entrance17","Entrance16","Entrance15","Entrance14","Entrance13","Entrance12","Entrance11","Entrance10"}
    },
}

--Made By Sarish => AuroraRP