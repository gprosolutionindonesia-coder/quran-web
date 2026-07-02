// ======================================
// Quran Web GPRO
// App Engine v3
// ======================================

console.clear();

console.log("==================================");
console.log("Quran Web GPRO v3");
console.log("Application Starting...");
console.log("==================================");

// ======================================
// Init
// ======================================

window.addEventListener("load", function () {

    console.log("Loading Application...");

    // ==========================
    // Load Bookmark
    // ==========================

    loadBookmarks();

    // ==========================
    // Load History
    // ==========================

    loadHistory();

    // ==========================
    // Restore Last State
    // ==========================

    loadState();

    // ==========================
    // Render Viewer
    // ==========================

    updatePages();

    // ==========================
    // Load Last Bookmark
    // ==========================

    loadBookmark();

    console.log("==================================");

    console.log("Viewer Ready");
    console.log("Toolbar Ready");
    console.log("Navigation Ready");
    console.log("Audio Ready");
    console.log("Translation Ready");
    console.log("Bookmark Ready");
    console.log("History Ready");

    console.log("==================================");
    console.log("Quran Web GPRO Ready");
    console.log("==================================");

});

// ======================================
// Before Close
// ======================================

window.addEventListener("beforeunload", function () {

    saveState();

});