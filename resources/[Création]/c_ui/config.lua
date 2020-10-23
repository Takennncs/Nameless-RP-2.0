-- Menu configuration, array of menus to display
menuConfigs = {
    ['menu'] = {
        enableMenu = function()
            return true
        end,
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#5e5e5e', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8 },
                    hover = { ['fill'] = '#363535', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:bag.png", "imgsrc:what.png"},
                    commands = {"submenu4", "submenu5"}
                }
            }
        }
    }
}

-- Submenu configuration
subMenuConfigs = {
    ['submenu1'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#5e5e5e', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8 },
                    hover = { ['fill'] = '#363535', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:bag.png", "imgsrc:what.png"},
                    commands = {"submenu4", "submenu5"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {--[["imgsrc:piggy.png",]] "imgsrc:otage.png"},
                    commands = {--[["porter",]] "otage"}
                }
            }
        }
    },
    ['submenu3'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#5e5e5e', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8 },
                    hover = { ['fill'] = '#363535', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:bag.png", "imgsrc:what.png"},
                    commands = {"phonexenon", "submenu4", "submenu5"}
                },
            
            }
        }
    },
    ['submenu4'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#5e5e5e', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8 },
                    hover = { ['fill'] = '#363535', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:bag.png", "imgsrc:what.png"},
                    commands = {"submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"imgsrc:divers.png", "imgsrc:opti.png", "imgsrc:infoperso.png"},
                    commands = {"menuf5divers", "opti", "perso"}
                }
            }
        }
    },
    ['submenu5'] = {
        data = {
            keybind = "~",
            style = {
                sizePx = 600,
                slices = {
                    default = { ['fill'] = '#5e5e5e', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8 },
                    hover = { ['fill'] = '#363535', ['stroke'] = '#000000', ['stroke-width'] = 0, ['opacity'] = 0.8},
                    selected = { ['fill'] = '#000000', ['stroke'] = '#000000', ['stroke-width'] = 1, ['opacity'] = 0.3 }
                },
                titles = {
                    default = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    hover = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' },
                    selected = { ['fill'] = '#ffffff', ['stroke'] = 'none', ['font'] = 'Helvetica', ['font-size'] = 14, ['font-weight'] = 'bold' }
                },
                icons = {
                    width = 64,
                    height = 64
                }
            },
            wheels = {
                {
                    navAngle = 40,
                    minRadiusPercent = 0.0,
                    maxRadiusPercent = 0.12,
                    labels = {"imgsrc:quit.png"},
                    commands = {"closemenu"}
                },
                {
                    navAngle = 270,
                    minRadiusPercent = 0.32,
                    maxRadiusPercent = 0.55,
                    labels = {"imgsrc:bag.png", "imgsrc:what.png"},
                    commands = {"submenu4", "submenu5"}
                },
                {
                    navAngle = 288,
                    minRadiusPercent = 0.6,
                    maxRadiusPercent = 0.9,
                    labels = {"Question", "Ban", "Demande", "Aide", "Bug"},
                    commands = {"report J'ai une question", "report Je voudrais parler d'un ban", "report Je voudrais vous faire une demande", "report J'ai besoin d'aide", "report j'ai trouvé un bug"}
                }
            }
        }
    },
}
