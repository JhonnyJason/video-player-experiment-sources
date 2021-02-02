indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.videoplayer = document.getElementById("videoplayer")
    global.playButton = document.getElementById("play-button")
    return
    
module.exports = indexdomconnect