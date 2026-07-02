// ======================================
// Quran Web GPRO
// Data Engine v3
// ======================================

// ======================================
// Global State
// ======================================

window.Quran = {

    // Viewer
    page: 2,
    totalPages: 604,
    gifOffset: 3,
    zoom: 1,

    // Navigation
    surah: 1,
    juz: 1,
    ayah: 1,

    // Audio
    audio: new Audio(),
    currentAudio: "",

    // Bookmark
    bookmarks: [],
    bookmarkKey: "quran-bookmarks-v2",

    // History
    history: [],
    historyKey: "quran-history-v2",

    // Settings
    darkMode: false,
    language: "id"

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
// Bookmark Storage
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
// Add Bookmark
// ======================================

window.addBookmark = function(name){

    const bookmark = {

        id: Date.now(),

        name: name || ("Halaman " + Quran.page),

        page: Quran.page,

        surah: Quran.surah,

        juz: Quran.juz,

        ayah: Quran.ayah,

        created: new Date().toLocaleString()

    };

    Quran.bookmarks.push(bookmark);

    saveBookmarks();

    console.log("Bookmark ditambahkan");

    console.table(bookmark);

};

// ======================================
// Delete Bookmark
// ======================================

window.deleteBookmark = function(id){

    Quran.bookmarks = Quran.bookmarks.filter(function(item){

        return item.id !== id;

    });

    saveBookmarks();

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

    if(Quran.history.length > 100){

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
// Clear History
// ======================================

window.clearHistory = function(){

    Quran.history = [];

    localStorage.removeItem(

        Quran.historyKey

    );

};

// ======================================
// Clear Bookmark
// ======================================

window.clearBookmarks = function(){

    Quran.bookmarks = [];

    saveBookmarks();

};

// ======================================
// Save State
// ======================================

window.saveState = function(){

    localStorage.setItem(

        "quran-last-page",

        Quran.page

    );

};

// ======================================
// Load State
// ======================================

window.loadState = function(){

    const page = localStorage.getItem(

        "quran-last-page"

    );

    if(page){

        Quran.page = Number(page);

    }

};

// ======================================
// Init
// ======================================

loadBookmarks();

loadHistory();

loadState();

console.log("==================================");
console.log("Quran Web GPRO");
console.log("Data Engine v3 Loaded");
console.log("==================================");