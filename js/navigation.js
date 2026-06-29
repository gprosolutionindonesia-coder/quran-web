// ======================================
// Quran Web GPRO
// Navigation
// ======================================

// Tombol Berikutnya
document.getElementById("next").addEventListener("click", function () {

    if (Quran.page < 604) {

        openPage(Quran.page + 2);

    }

});

// Tombol Sebelumnya
document.getElementById("prev").addEventListener("click", function () {

    if (Quran.page > 2) {

        openPage(Quran.page - 2);

    }

});