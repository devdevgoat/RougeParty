local PATH = (...):gsub('%.init$', '')
return {
    Player = require(PATH..".Player"),
    MainMenu =  require(PATH..".MainMenu"),
}