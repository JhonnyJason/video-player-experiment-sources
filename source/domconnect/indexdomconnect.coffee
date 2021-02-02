indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.videoFrame = document.getElementById("video-frame")
    global.playButton = document.getElementById("play-button")
    return
    
module.exports = indexdomconnect