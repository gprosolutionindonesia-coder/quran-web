// ======================================
// Quran Web GPRO
// Viewer Mushaf RTL
// ======================================

// Halaman genap pertama
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

    // ============================
    // Mushaf
    // KIRI  = GANJIL
    // KANAN = GENAP
    // ============================

    leftPage.src =
        "Medina1/data/N/" +
        String(page + 1).padStart(4, "0") +
        ".gif";

    rightPage.src =
        "Medina1/data/N/" +
        String(page).padStart(4, "0") +
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
updatePages();

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
