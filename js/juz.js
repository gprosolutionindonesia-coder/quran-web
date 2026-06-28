// ======================================
// Quran Web GPRO
// Modul Daftar Juz
// ======================================

async function loadJuz() {

    const response = await fetch("data/juz.json");
    const juz = await response.json();

    const list = document.getElementById("juzList");

    list.innerHTML = "";

    juz.forEach(item => {

        const a = document.createElement("a");

        a.href = "#";

        a.className = "list-group-item list-group-item-action";

        a.innerHTML = "Juz " + item.juz;

        a.addEventListener("click", function (e) {

            e.preventDefault();

            page = item.page;

            // Viewer selalu mulai dari halaman genap
            if (page % 2 !== 0) {
                page--;
            }

            updatePages();

        });

        list.appendChild(a);

    });

}

// ======================================
// Tombol Surat
// ======================================

document.getElementById("showSurah").onclick = function () {

    document.getElementById("surahList").style.display = "";
    document.getElementById("juzList").style.display = "none";

    this.className = "btn btn-primary";
    document.getElementById("showJuz").className =
        "btn btn-outline-primary";

};

// ======================================
// Tombol Juz
// ======================================

document.getElementById("showJuz").onclick = function () {

    document.getElementById("surahList").style.display = "none";
    document.getElementById("juzList").style.display = "";

    this.className = "btn btn-primary";
    document.getElementById("showSurah").className =
        "btn btn-outline-primary";

};

loadJuz();