local PATH = (...):gsub('%.init$', '')



return {
    Position = require(PATH..".Position"),
    Area = require(PATH..".Area"),
    Color = require(PATH..".Color"),
    Button = require(PATH..".Button"),
    Sprite = require(PATH..".Sprite"),
}