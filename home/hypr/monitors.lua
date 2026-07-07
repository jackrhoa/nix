
-- See https://wiki.hypr.land/Configuring/Basics/Monitors/

-- left monitor
hl.monitor({
    output   = "desc:Samsung Electric Company LS27B61x H4TW400936",
    mode     = "2560x1440",
    position = "0x0",
    scale    = "auto",
    -- reserved space for Mac screen
    reserved_area = {
      top = 0, bottom = 0, left = 0, right = 1150

    }
})

-- right monitor (USB-C monitor, connected w/ DP)
hl.monitor({
    output   = "desc:Samsung Electric Company LS27D80xU HCNY500207",
    mode     = "3840x2160",
    position = "2560x0",
    scale    = "2",
    reserved_area = 0
})

-- CATCH-ALL for new setups
hl.monitor({
    output = "",
    mode = "preferred",
    position = "0x0",
    scale = "auto"
})
