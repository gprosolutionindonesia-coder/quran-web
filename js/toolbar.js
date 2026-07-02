// ======================================
// Quran Web GPRO
// Toolbar Engine v3
// ======================================

// ======================================
// Bookmark
// ======================================

document.getElementById("bookmark").addEventListener("click", function () {

    const nama = prompt(

        "Nama Bookmark",

        "Halaman " + Quran.page

    );

    if (nama === null) {

        return;

    }

    addBookmark(nama);

    saveState();

    alert("✅ Bookmark berhasil disimpan.");

});

// ======================================
// Buka Bookmark Terakhir
// ======================================

window.loadBookmark = function () {

    if (Quran.bookmarks.length === 0) {

        return;

    }

    const terakhir = Quran.bookmarks[

        Quran.bookmarks.length - 1

    ];

    if (terakhir) {

        openPage(terakhir.page);

    }

};

// ======================================
// Zoom In
// ======================================

document.getElementById("zoomIn").addEventListener("click", function () {

    Quran.zoom += 0.1;

    if (Quran.zoom > 3) {

        Quran.zoom = 3;

    }

    document.querySelector(".book").style.transform =
        "scale(" + Quran.zoom + ")";

});

// ======================================
// Zoom Out
// ======================================

document.getElementById("zoomOut").addEventListener("click", function () {

    Quran.zoom -= 0.1;

    if (Quran.zoom < 0.5) {

        Quran.zoom = 0.5;

    }

    document.querySelector(".book").style.transform =
        "scale(" + Quran.zoom + ")";

});

// ======================================
// Keyboard Shortcut
// ======================================

document.addEventListener("keydown", function (e) {

    switch (e.key) {

        case "ArrowRight":

            document.getElementById("next").click();

            break;

        case "ArrowLeft":

            document.getElementById("prev").click();

            break;

        case "+":

            document.getElementById("zoomIn").click();

            break;

        case "-":

            document.getElementById("zoomOut").click();

            break;

        case "b":

        case "B":

            document.getElementById("bookmark").click();

            break;

    }

});

console.log("Toolbar Engine v3 Loaded");