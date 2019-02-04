local PATH = (...):gsub('%.init$', '')

return {
    UIManager = require(PATH..".UIManager"),
    PlayerManager = require(PATH..".PlayerManager"),
    PlayerController = require(PATH..".PlayerController"),
    Gravity = require(PATH.. ".Gravity"),
    CameraController = require(PATH.. ".CameraController"),
    ProjectileController = require(PATH.. ".ProjectileController"),
    LevelManager = require(PATH.. ".LevelManager")
}