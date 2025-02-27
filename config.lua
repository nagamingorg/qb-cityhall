Config = Config or {}
Config.UseTarget = GetConvar('UseTarget', 'false') == 'true'

Config.AvailableJobs = {                                     -- Only used when not using qb-jobs.
    ['trucker'] = { ['label'] = 'Trucker', ['isManaged'] = false },
    ['taxi'] = { ['label'] = 'Taxi', ['isManaged'] = false },
    ['tow'] = { ['label'] = 'Tow Truck', ['isManaged'] = false },
    ['reporter'] = { ['label'] = 'News Reporter', ['isManaged'] = false },
    ['garbage'] = { ['label'] = 'Garbage Collector', ['isManaged'] = false },
    ['bus'] = { ['label'] = 'Bus Driver', ['isManaged'] = false },
    ['hotdog'] = { ['label'] = 'Hot Dog Stand', ['isManaged'] = false }
}

Config.Cityhalls = {
  { -- Paleto Bay
    coords = vector3(-145.78, 6304.15, 31.56),
    showBlip = true,
    blipData = {
      sprite = 176,
      display = 4,
      scale = 0.65,
      colour = 0,
      title = "County Services"
    },
    licenses = {
      ["id_card"] = {
        label = "ID Card",
        cost = 50,
      },
      ["driver_license"] = {
        label = "Driver\'s License",
        cost = 150,
        metadata = "driver",
      },
      --[[ ["boat_license"] = {
        label = "Boater\'s License",
        cost = 450,
        metadata = "boat",
      }, ]]--
      ["firearm_license"] = {
        label = "Firearm License",
        cost = 1350,
        metadata = "weapon",
      },
      ["truck_license"] = {
        label = "Truck License [AZ]",
        cost = 2000,
        metadata = "truck",
      },
      ["pilot_license"] = {
        label = "Pilot\'s License",
        cost = 5000,
        metadata = "pilot",
      },
      --[[ ["firearm_restricted_license"] = {
        label = "Firearm [R] License",
        cost = 3550,
        metadata = "weapon_restricted",
      },
      ["outdoor_license"] = {
        label = "Outdoor\'s License",
        cost = 750,
        metadata = "outdoor",
      }, ]]--
    },
  },
  { -- Grapeseed
    coords = vector3(1654.21, 4883.02, 42.16),
    showBlip = true,
    blipData = {
      sprite = 176,
      display = 4,
      scale = 0.65,
      colour = 0,
      title = "County Services"
    },
    licenses = {
      ["id_card"] = {
        label = "ID Card",
        cost = 50,
      },
      ["driver_license"] = {
        label = "Driver\'s License",
        cost = 150,
        metadata = "driver",
      },
      --[[ ["boat_license"] = {
        label = "Boater\'s License",
        cost = 450,
        metadata = "boat",
      }, ]]--
      ["firearm_license"] = {
        label = "Firearm License",
        cost = 1350,
        metadata = "weapon",
      },
      ["truck_license"] = {
        label = "Truck License [AZ]",
        cost = 2000,
        metadata = "truck",
      },
      ["pilot_license"] = {
        label = "Pilot\'s License",
        cost = 5000,
        metadata = "pilot",
      },
      --[[ ["firearm_restricted_license"] = {
        label = "Firearm [R] License",
        cost = 3550,
        metadata = "weapon_restricted",
      },
      ["outdoor_license"] = {
        label = "Outdoor\'s License",
        cost = 750,
        metadata = "outdoor",
      }, ]]--
    },
  },
}

Config.DrivingSchools = {
    /*{ -- Driving School 1
        coords = vec3(240.3, -1379.89, 33.74),
        showBlip = true,
        blipData = {
            sprite = 225,
            display = 4,
            scale = 0.65,
            colour = 3,
            title = 'Driving School'
        },
        instructors = {
            'DJD56142',
            'DXT09752',
            'SRI85140',
        }
    },*/
}

Config.Peds = {
    -- Cityhall Ped
    {
      model = 'a_m_m_hasjew_01',
      coords = vector4(-145.42, 6304.46, 31.56, 308.52),
      scenario = 'WORLD_HUMAN_STAND_MOBILE',
      cityhall = true,
      zoneOptions = { -- Used for when UseTarget is false
        length = 3.0,
        width = 3.0,
        debugPoly = false
      }
    },
    {
      model = 'a_m_m_hasjew_01',
      coords = vector4(1654.32, 4882.97, 42.16, 285.98),
      scenario = 'WORLD_HUMAN_STAND_MOBILE',
      cityhall = true,
      zoneOptions = { -- Used for when UseTarget is false
        length = 3.0,
        width = 3.0,
        debugPoly = false
      }
    },
    /*-- Driving School Ped
    {
        model = 'a_m_m_eastsa_02',
        coords = vec4(240.91, -1379.2, 32.74, 138.96),
        scenario = 'WORLD_HUMAN_STAND_MOBILE',
        drivingschool = true,
        zoneOptions = { -- Used for when UseTarget is false
            length = 3.0,
            width = 3.0
        }
    }*/
}
