// ======================================
// Quran Web GPRO
// Toolbar
// Bookmark + Zoom
// ======================================

// ============================
// Bookmark
// ============================

document.getElementById("bookmark").addEventListener("click", function () {

    localStorage.setItem(Quran.bookmarkKey, Quran.page);

    alert("Bookmark disimpan di halaman " + Quran.page);

});

// Load Bookmark
window.loadBookmark = function () {

    const saved = localStorage.getItem(Quran.bookmarkKey);

    if (saved !== null) {

        openPage(parseInt(saved));

    }

};

// ============================
// Zoom
// ============================

document.getElementById("zoomIn").addEventListener("click", function () {

    Quran.zoom += 0.1;

    document.querySelector(".book").style.transform =
        "scale(" + Quran.zoom + ")";

});

document.getElementById("zoomOut").addEventListener("click", function () {

    if (Quran.zoom > 0.5) {

        Quran.zoom -= 0.1;

        document.querySelector(".book").style.transform =
            "scale(" + Quran.zoom + ")";

    }

});