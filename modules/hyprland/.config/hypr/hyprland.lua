------------------
---- MONITORS ----
------------------

hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})

-------------------
---- AUTOSTART ----
-------------------

require("autostart")

-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

require("env")

-----------------------
---- LOOK AND FEEL ----
-----------------------

require("style")

---------------
---- INPUT ----
---------------

require("input")

---------------------
---- KEYBINDINGS ----
---------------------

require("binds")

--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

require("rules")


-- For Noctalia Color templates
require("noctalia").apply_theme()
