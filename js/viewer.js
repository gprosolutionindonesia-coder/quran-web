// ======================================
// Quran Web GPRO
// Viewer Mushaf
// ======================================

// Ambil elemen
const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

// ======================================
// Render Mushaf
// ======================================

window.updatePages = function () {

    const gif = getGifPage(Quran.page);

    // ==========================
    // DEBUG
    // ==========================

    console.log("----------------------------");
    console.log("Mushaf Page :", Quran.page);
    console.log("GIF Page    :", gif);
    console.log("Left GIF    :", gif + 1);
    console.log("Right GIF   :", gif);

    // ==========================
    // Halaman kiri (ganjil)
    // ==========================

    leftPage.src =
        "Medina1/data/N/" +
        String(gif + 1).padStart(4, "0") +
        ".gif";

    // ==========================
    // Halaman kanan (genap)
    // ==========================

    rightPage.src =
        "Medina1/data/N/" +
        String(gif).padStart(4, "0") +
        ".gif";

    // ==========================
    // Nomor halaman
    // ==========================

    pageNumber.innerHTML =
        toArabicNumber(Quran.page) +
        " | " +
        toArabicNumber(Quran.page + 1);

};

// ======================================
// Buka halaman tertentu
// ======================================

window.openPage = function(page){

    console.log("================================");
    console.log("openPage() dipanggil");
    console.log("Page dari surah :", page);

    if(page < 2){
        page = 2;
    }

    if(page > 604){
        page = 604;
    }

    if(page % 2 !== 0){
        page--;
    }

    console.log("Page setelah koreksi :", page);

    Quran.page = page;

    updatePages();

};

// ======================================
// Render pertama
// ======================================

updatePages();

console.log("viewer.js loaded");