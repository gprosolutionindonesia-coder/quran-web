// ======================================
// Quran Web GPRO
// Data & Global State
// ======================================

window.Quran = {

    page: 2,

    zoom: 1,

    totalPages: 604,

    audio: new Audio(),

    currentAudio: "",

    bookmarkKey: "bookmarkPage"

};

// ======================================
// Angka Arab
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
// Konversi Mushaf → GIF
// ======================================

window.getGifPage = function(page){

    switch(page){

        case 2: return 2;
        case 4: return 4;

        default:
            return page;

    }

};