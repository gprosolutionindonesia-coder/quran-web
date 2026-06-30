// ======================================
// Quran Web GPRO
// Viewer Engine v2
// ======================================

// ======================================
// Element
// ======================================

const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

// ======================================
// Render Viewer
// ======================================

window.updatePages = function () {

    const gif = getGifPage(Quran.page);

    leftPage.src =
        "Medina1/data/N/" +
        String(gif + 1).padStart(4, "0") +
        ".gif";

    rightPage.src =
        "Medina1/data/N/" +
        String(gif).padStart(4, "0") +
        ".gif";

    pageNumber.innerHTML =
        toArabicNumber(Quran.page) +
        " | " +
        toArabicNumber(Quran.page + 1);

    console.log(
        "Viewer Update -> Page:",
        Quran.page
    );

};

// ======================================
// Open Page
// ======================================

window.openPage = function (page) {

    page = Number(page);

    if (page < 2) page = 2;

    if (page > Quran.totalPages)
        page = Quran.totalPages;

    // Viewer selalu dimulai halaman genap
    if (page % 2 !== 0) {

        page--;

    }

    Quran.page = page;

    addHistory();

    updatePages();

};

// ======================================
// Zoom
// ======================================

window.setZoom = function (value) {

    Quran.zoom = value;

    document.querySelector(".book").style.transform =
        "scale(" + Quran.zoom + ")";

};

// ======================================
// Init
// ======================================

updatePages();

console.log("Viewer Engine v2 Loaded");