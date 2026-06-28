// ======================================
// Quran Web GPRO
// Viewer Mushaf RTL
// ======================================

// Halaman genap pertama
// ======================================
// Mapping Mushaf -> GIF
// ======================================

let pageMap = [];

async function loadPageMap() {

    const response = await fetch("data/pageMap.json");

    pageMap = await response.json();

}
window.page = 2;

// Ambil elemen
const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

// Konversi angka Latin -> Arab
function toArabicNumber(num) {

    const arabic = ["٠","١","٢","٣","٤","٥","٦","٧","٨","٩"];

    return num.toString().replace(/\d/g, function(d){
        return arabic[d];
    });

}

// Update viewer
window.updatePages = function () {
    const map = pageMap.find(p => p.mushaf === page);

if (!map) return;

const gif = map.gif;

    // ============================
    // Mushaf
    // KIRI  = GANJIL
    // KANAN = GENAP
    // ============================

    leftPage.src =
        "Medina1/data/N/" +
        String(gif + 1).padStart(4,"0") +
        ".gif";

    rightPage.src =
        "Medina1/data/N/" +
        String(gif).padStart(4,"0") +
        ".gif";

    // ============================
    // Nomor halaman
    // tampil: ٢ | ٣
    // ============================

    pageNumber.innerHTML =
        toArabicNumber(page) +
        " | " +
        toArabicNumber(page + 1);

}

// Tampilkan pertama kali
loadPageMap().then(() => {

    updatePages();

});

// ============================
// Tombol Berikutnya
// ============================

document.getElementById("next").addEventListener("click", function () {

    if (page <= 622) {

        page += 2;

        updatePages();

    }

});

// ============================
// Tombol Sebelumnya
// ============================

document.getElementById("prev").addEventListener("click", function () {

    if (page > 2) {

        page -= 2;

        updatePages();

    }

});

console.log("Quran Web GPRO Viewer Loaded");
console.log("MASUK KE MODUL BOOKMARK");

// ======================================
// Bookmark Halaman
// ======================================

// Simpan bookmark
document.getElementById("bookmark").addEventListener("click", function () {

    localStorage.setItem("bookmarkPage", page);

    alert("Bookmark disimpan di halaman " + page);

});

// Buka bookmark saat aplikasi dijalankan
const savedPage = localStorage.getItem("bookmarkPage");

if (savedPage !== null) {

    page = parseInt(savedPage);

    updatePages();

}
// ======================================
// Zoom Mushaf
// ======================================

let zoom = 1;

document.getElementById("zoomIn").addEventListener("click", function () {

    zoom += 0.1;

    document.querySelector(".book").style.transform =
        "scale(" + zoom + ")";

});

document.getElementById("zoomOut").addEventListener("click", function () {

    if (zoom > 0.5) {

        zoom -= 0.1;

        document.querySelector(".book").style.transform =
            "scale(" + zoom + ")";

    }

});