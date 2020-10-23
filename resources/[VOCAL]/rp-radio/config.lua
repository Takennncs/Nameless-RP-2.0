radioConfig = {
    Controls = {
        MouseFocus = {
            Name = "INPUT_AIM",
            Key = 25, -- Left Shift
            Enabled = false, -- Require secondary to be pressed to open radio with Activator
        },
        Toggle = { -- Toggle radio on/off
            Name = "INPUT_CONTEXT", -- Control name
            Key = 51, -- E
        },
        Input = { -- Choose Frequency
            Name = "INPUT_FRONTEND_ACCEPT", -- Control name
            Key = 201, -- Enter
            Pressed = false,
        },
        Broadcast = {
            Name = "INPUT_VEH_PUSHBIKE_SPRINT", -- Control name
            Key = 137, -- Caps Lock
        },
    },
    Frequency = {
        Current = {
            F1 = 1, 
            F2 = 1
        },
        volume = {
            F1 = 100, 
            F2 = 100
        }, 
    },
}