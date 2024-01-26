if not Quests then
    Game.createQuest("Tibia Tales", {
        storageId = 51480,
        storageValue = 1,
    
        missions = {
            {
                name = "The Exterminator",
                storageId = 51488,
                startValue = 1,
                endValue = 3,
                ignoreEndValue = false,
                description = {
                    "Padreia in Carlin asked you to exterminate the slimes in the sewers of Carlin by poisoning their spawn pool.",
                    "You poisoned the spawn pool of the slimes in the sewers of Carlin. Report to Padreia about your mission.",
                    "You successfully helped Padreia in saving Carlin from a slimy disease."
                }
            }
        }
    }):register()