// ======================================
// Quran Web GPRO
// Navigation Engine v2
// ======================================

// ======================================
// Open Surah
// ======================================

window.openSurah = function (surah) {

    // Simpan state
    Quran.surah = Number(surah.id);
    Quran.juz = Number(surah.juz);
    Quran.ayah = 1;

    // Halaman Mushaf
    openPage(surah.page);

    // Audio
    setAudio(surah.audio);

    // Translation
    if (typeof loadTranslation === "function") {

        loadTranslation(Quran.surah);

    }

    console.log("==========================");
    console.log("Surah :", Quran.surah);
    console.log("Page  :", Quran.page);
    console.log("Juz   :", Quran.juz);

};

// ======================================
// Next
// ======================================

document.getElementById("next").addEventListener("click", function () {

    if (Quran.page < Quran.totalPages) {

        openPage(Quran.page + 2);

    }

});

// ======================================
// Previous
// ======================================

document.getElementById("prev").addEventListener("click", function () {

    if (Quran.page > 2) {

        openPage(Quran.page - 2);

    }

});

console.log("Navigation Engine v2 Loaded");