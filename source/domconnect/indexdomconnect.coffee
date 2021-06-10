indexdomconnect = {name: "indexdomconnect"}

############################################################
indexdomconnect.initialize = () ->
    global.videoplayerAutoplay = document.getElementById("videoplayer-autoplay")
    global.videoplayer = document.getElementById("videoplayer")
    return
    
module.exports = indexdomconnect