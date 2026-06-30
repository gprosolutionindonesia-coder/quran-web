// ======================================
// Quran Web GPRO
// Navigation Engine
// ======================================

// ======================================
// Buka Surat
// ======================================

window.openSurah = function (surah) {

    // Halaman Mushaf
    openPage(surah.page);

    // Audio
    if (surah.audio) {
        setAudio(surah.audio);
    }

    // Terjemahan
    if (typeof loadTranslation === "function") {
        loadTranslation(surah.id);
    }

};

// ======================================
// Berikutnya
// ======================================

document.getElementById("next").addEventListener("click", function () {

    if (Quran.page < 604) {

        openPage(Quran.page + 2);

    }

});

// ======================================
// Sebelumnya
// ======================================

document.getElementById("prev").addEventListener("click", function () {

    if (Quran.page > 2) {

        openPage(Quran.page - 2);

    }

});

console.log("navigation.js loaded");