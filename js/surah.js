// ======================================
// Quran Web GPRO
// Modul Daftar Surat
// ======================================

let allSurah = [];

// ======================================
// Load Data Surat
// ======================================

async function loadSurah() {

    try {

        const response = await fetch("data/surah.json");

        if (!response.ok) {
            throw new Error("Gagal membaca data surah.json");
        }

        allSurah = await response.json();

        renderSurah(allSurah);

        const search = document.getElementById("searchSurah");

        if (search) {

            search.addEventListener("keyup", function () {

                const keyword = this.value.trim().toLowerCase();

                const result = allSurah.filter(item => {

                    return (
                        item.name.toLowerCase().includes(keyword)
                    );

                });

                renderSurah(result);

            });

        }

        console.log("✔ Data Surah berhasil dimuat.");

    } catch (err) {

        console.error("Surah Error :", err);

    }

}

// ======================================
// Render Daftar Surat
// ======================================

function renderSurah(data) {

    const list = document.getElementById("surahList");

    if (!list) {
        console.warn("surahList tidak ditemukan.");
        return;
    }

    list.innerHTML = "";

    data.forEach(item => {

        const a = document.createElement("a");

        a.href = "#";

        a.className = "list-group-item list-group-item-action";

        a.innerHTML = `
            <b>${item.id}.</b> ${item.name}
        `;

        a.addEventListener("click", function (e) {

            e.preventDefault();

            openSurah(item);

        });

        list.appendChild(a);

    });

}

// ======================================
// Buka Surat
// ======================================

function openSurah(item) {

    if (!item) return;

    Quran.surah = item.id;

    let page = Number(item.page);

    // Database halaman dimulai dari 1
    // Viewer dimulai dari halaman 2

    page++;

    // Viewer selalu membuka halaman kiri
    if (page % 2 !== 0) {
        page--;
    }

    openPage(page);

    console.log(
        `Open Surah ${item.id} - ${item.name} | Viewer Page ${page}`
    );

}