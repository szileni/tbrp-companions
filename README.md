#  REDM - TBRP-COMPANIONS - A script for RSG framework

## Description

With this script players are able to own pets that can retrieve hunted prey, track targets or even attack your enemies. Pets need to be raised as well as require food every so often and won't retrieve hunted prey if they are hungry. Pets can be set to automatically hostile targets that attack you as well. Simply look at your pet and hold right-click to access the many different options. Doing the same on other targets will show you their attack/track prompts.

## Features

• Purchase pets

• Raise pets by feeding them when they're hungry

• Pets will grow in size as they get older

• Full grown pets gain new abilities

• Give commands like sit and follow

• Pets can retrieve hunted animals (Hunt Mode)

• Pets can be set to track targets

• Pets can be set to attack targets

• Pets will hostile anyone in combat with owner

• Hungry pets won't retrieve

• /callpet to spawn your pet

• /fleepet to make your pet flee

• Optimized - Idles at 0.01ms with pet out	

• Almost everything can be toggled in the config

• Locale config.
    - Currently supports [en] and [hu]


## How to Install
1. Put tbrp_companions in your `resources` folder
2. Enter `ensure tbrp_companions` in your server.cfg
3. Import the `companions.sql`
4. Go through `config.lua` before restarting your server

## RSG-Radialmenu

    [6] = { -- Change it to your side
        id = 'pet',
        title = 'Pet menu',
        icon = 'dog',
        items = {
            {
                id = 'loadpet',
                title = 'Call pet',
                icon = 'dog',
                type = 'server',
                event = 'tbrp_companions:loaddog',
                shouldClose = true
            }, {
                id = 'petawaypet',
                title = 'Putaway pet',
                icon = 'dog',
                type = 'client',
                event = 'tbrp_companions:putaway',
                shouldClose = true
            },
        },
    },

## Disclaimers and Credits
- This is a heavy modification of [rdn_companions] and [bwrp_animalshelter], converted to RSG and modified by [Szileni]
