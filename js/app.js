// Quran Web GPRO
// Viewer RTL Mushaf

let page = 2;

// Elemen
const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

// Konversi angka Latin ke angka Arab
function toArabicNumber(num) {

    const arabic = ["٠","١","٢","٣","٤","٥","٦","٧","٨","٩"];

    return num.toString().replace(/\d/g, d => arabic[d]);

}

// Update tampilan
function updatePages() {

    // Halaman kiri = ganjil
    leftPage.src =
        "Medina1/data/N/" +
        String(page + 1).padStart(4, "0") +
        ".gif";

    // Halaman kanan = genap
    rightPage.src =
        "Medina1/data/N/" +
        String(page).padStart(4, "0") +
        ".gif";

    // Nomor halaman
    pageNumber.innerHTML =
        toArabicNumber(page) +
        " | " +
        toArabicNumber(page + 1);

}

// Tampilkan pertama kali
updatePages();

// Tombol Berikutnya
document.getElementById("next").onclick = function () {

    if (page < 622) {

        page += 2;

        updatePages();

    }

};

// Tombol Sebelumnya
document.getElementById("prev").onclick = function () {

    if (page > 2) {

        page -= 2;

        updatePages();

    }

};