local PATH = (...):gsub('%.init$', '')

return {
    ButtonManager = require(PATH..".ButtonManager"),
    PlayerManager = require(PATH..".PlayerManager")
}