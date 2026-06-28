// ======================================
// Quran Web GPRO
// Modul Audio
// ======================================

const audio = new Audio();

let currentAudio = "";

// Play
document.getElementById("playAudio").addEventListener("click", function () {

    if (currentAudio !== "") {

        audio.src = currentAudio;
        audio.play();

    } else {

        alert("Pilih surat terlebih dahulu.");

    }

});

// Pause
document.getElementById("pauseAudio").addEventListener("click", function () {

    audio.pause();

});

// Ganti audio sesuai surat
window.setAudio = function(file){

    currentAudio =
    "https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/" + file;

};