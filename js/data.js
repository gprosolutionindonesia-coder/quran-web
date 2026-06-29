// ======================================
// Quran Web GPRO
// Data & Global State
// ======================================

window.Quran = {

    // ==========================
    // Mushaf
    // ==========================

    page: 2,

    zoom: 1,

    totalPages: 604,

    gifOffset: 3,

    // ==========================
    // Audio
    // ==========================

    audio: new Audio(),

    currentAudio: "",

    // ==========================
    // Bookmark
    // ==========================

    bookmarkKey: "bookmarkPage"

};

// ======================================
// Konversi Angka Latin → Arab
// ======================================

window.toArabicNumber = function(num){

    const arabic = [
        "٠","١","٢","٣","٤",
        "٥","٦","٧","٨","٩"
    ];

    return num.toString().replace(/\d/g,function(d){

        return arabic[d];

    });

};

// ======================================
// Konversi Halaman Mushaf → GIF
// ======================================

window.getGifPage = function(page){

    return page + Quran.gifOffset;

};