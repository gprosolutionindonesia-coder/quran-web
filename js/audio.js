// ======================================
// Quran Web GPRO
// Modul Audio
// ======================================

const audio = new Audio();

// Audio contoh (Al-Fatihah)
audio.src =
"https://download.quranicaudio.com/quran/mishaari_raashid_al_3afaasee/001.mp3";

// Tombol Play
document.getElementById("playAudio").addEventListener("click", function(){

    audio.play();

});

// Tombol Pause
document.getElementById("pauseAudio").addEventListener("click", function(){

    audio.pause();

});