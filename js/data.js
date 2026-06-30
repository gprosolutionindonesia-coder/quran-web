// ======================================
// Quran Web GPRO
// Data Engine v2
// ======================================

// ======================================
// Global State
// ======================================

window.Quran = {

    // ==========================
    // Viewer
    // ==========================

    page: 2,
    totalPages: 604,
    gifOffset: 3,

    // ==========================
    // Navigation
    // ==========================

    surah: 1,
    juz: 1,
    ayah: 1,

    // ==========================
    // Viewer
    // ==========================

    zoom: 1,

    // ==========================
    // Audio
    // ==========================

    audio: new Audio(),
    currentAudio: "",

    // ==========================
    // Bookmark
    // ==========================

    bookmarks: [],

    bookmarkKey: "quran-bookmarks",

    // ==========================
    // History
    // ==========================

    history: [],

    historyKey: "quran-history"

};

// ======================================
// Arabic Number
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
// GIF Page
// ======================================

window.getGifPage = function(page){

    return page + Quran.gifOffset;

};

// ======================================
// Bookmark
// ======================================

window.saveBookmarks = function(){

    localStorage.setItem(

        Quran.bookmarkKey,

        JSON.stringify(Quran.bookmarks)

    );

};

window.loadBookmarks = function(){

    const data = localStorage.getItem(

        Quran.bookmarkKey

    );

    if(data){

        Quran.bookmarks = JSON.parse(data);

    }

};

// ======================================
// History
// ======================================

window.addHistory = function(){

    Quran.history.unshift({

        page: Quran.page,

        surah: Quran.surah,

        juz: Quran.juz,

        ayah: Quran.ayah,

        time: new Date().toLocaleString()

    });

    if(Quran.history.length > 30){

        Quran.history.pop();

    }

    localStorage.setItem(

        Quran.historyKey,

        JSON.stringify(Quran.history)

    );

};

window.loadHistory = function(){

    const data = localStorage.getItem(

        Quran.historyKey

    );

    if(data){

        Quran.history = JSON.parse(data);

    }

};

// ======================================
// Init
// ======================================

loadBookmarks();

loadHistory();

console.log("==================================");
console.log("Quran Web GPRO");
console.log("Data Engine v2 Loaded");
console.log("==================================");