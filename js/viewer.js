// ======================================
// Quran Web GPRO
// Viewer Engine v3
// ======================================

// ======================================
// Element
// ======================================

const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

// ======================================
// Render Mushaf
// ======================================

window.updatePages = function () {

    const gifPage = getGifPage(Quran.page);

    // Halaman kiri
    leftPage.src =
        "Medina1/data/N/" +
        String(gifPage + 1).padStart(4, "0") +
        ".gif";

    // Halaman kanan
    rightPage.src =
        "Medina1/data/N/" +
        String(gifPage).padStart(4, "0") +
        ".gif";

    // Nomor halaman
    pageNumber.innerHTML =
        toArabicNumber(Quran.page) +
        " | " +
        toArabicNumber(Quran.page + 1);

    // Simpan halaman terakhir
    saveState();

    console.log("==================================");
    console.log("Mushaf Viewer");
    console.log("Page :", Quran.page);
    console.log("GIF  :", gifPage);
    console.log("==================================");

};

// ======================================
// Open Page
// ======================================

window.openPage = function(page){

    page = Number(page);

    if(isNaN(page)){

        return;

    }

    if(page < 1){
    page = 1;
}

    if(page > Quran.totalPages){

        page = Quran.totalPages;

    }

    // Viewer selalu membuka halaman genap



    Quran.page = page;

    addHistory();

    updatePages();

};

// ======================================
// Next
// ======================================

window.nextPage = function(){

    if(Quran.page < Quran.totalPages){

        openPage(Quran.page + 2);

    }

};

// ======================================
// Previous
// ======================================

window.prevPage = function(){

    if(Quran.page > 2){

        openPage(Quran.page - 2);

    }

};

// ======================================
// Zoom
// ======================================

window.setZoom = function(value){

    Quran.zoom = value;

    document.querySelector(".book").style.transform =
        "scale(" + Quran.zoom + ")";

};

// ======================================
// Refresh
// ======================================

window.refreshViewer = function(){

    updatePages();

};

// ======================================
// Init
// ======================================

refreshViewer();

console.log("Viewer Engine v3 Loaded");