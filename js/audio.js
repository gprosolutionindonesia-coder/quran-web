// ======================================
// Quran Web GPRO
// Audio Engine v2
// ======================================

// ======================================
// Play
// ======================================

document.getElementById("playAudio").addEventListener("click", function () {

    if (Quran.currentAudio === "") {

        alert("Pilih surat terlebih dahulu.");

        return;

    }

    Quran.audio.src = Quran.currentAudio;

    Quran.audio.play();

});

// ======================================
// Pause
// ======================================

document.getElementById("pauseAudio").addEventListener("click", function () {

    Quran.audio.pause();

});

// ======================================
// Stop
// ======================================

window.stopAudio = function(){

    Quran.audio.pause();

    Quran.audio.currentTime = 0;

};

// ======================================
// Set Audio
// ======================================

window.setAudio = function(file){

    Quran.currentAudio =
        "https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/" +
        file;

    console.log("Audio :", Quran.currentAudio);

};

// ======================================
// Resume
// ======================================

window.resumeAudio = function(){

    if(Quran.currentAudio !== ""){

        Quran.audio.play();

    }

};

console.log("Audio Engine v2 Loaded");