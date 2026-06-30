// ======================================
// Quran Web GPRO
// Translation Module
// ======================================

window.currentSurah = 1;

// ======================================
// Load Translation
// ======================================

window.loadTranslation = async function (surahNumber) {

    currentSurah = surahNumber;

    console.log("==============================");
    console.log("loadTranslation()");
    console.log("Surah Number :", surahNumber);

    const file =
        "data/translation/id/id_translation_" +
        surahNumber +
        ".json";

    console.log("File :", file);

    const panel = document.getElementById("translationPanel");

    panel.innerHTML = `
        <div class="text-center p-3">
            Memuat terjemahan...
        </div>
    `;

    try {

        const response = await fetch(file);

        console.log("Status :", response.status);

        if (!response.ok) {
            throw new Error("File tidak ditemukan");
        }

        const data = await response.json();

        console.log("Nama Surat :", data.name);

        renderTranslation(data);

    } catch (err) {

        console.error(err);

        panel.innerHTML = `
            <div class="alert alert-danger">
                Gagal memuat terjemahan<br>
                <small>${file}</small>
            </div>
        `;

    }

};

// ======================================
// Render Translation
// ======================================

function renderTranslation(data) {

    const panel = document.getElementById("translationPanel");

    let html = "";

    html += `
        <h4 class="mb-3">
            📖 ${data.name}
        </h4>

        <div class="text-muted mb-4">
            ${data.count} Ayat
        </div>
    `;

    for (let i = 1; i <= data.count; i++) {

        html += `
        <div class="card mb-3 shadow-sm">

            <div class="card-body">

                <span class="badge bg-success mb-2">
                    Ayat ${i}
                </span>

                <div style="line-height:1.8;font-size:16px;">
                    ${data.verse["verse_" + i]}
                </div>

            </div>

        </div>
        `;

    }

    panel.innerHTML = html;

}

loadTranslation(1);

console.log("translation.js loaded");