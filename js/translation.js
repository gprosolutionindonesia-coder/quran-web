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

    const panel = document.getElementById("translationPanel");

    panel.innerHTML = `
        <div class="text-center p-3">
            Memuat terjemahan...
        </div>
    `;

    try {

        const response = await fetch(
            "data/translation/id/id_translation_" +
            surahNumber +
            ".json"
        );

        const data = await response.json();

        renderTranslation(data);

    } catch (err) {

        panel.innerHTML = `
            <div class="alert alert-danger">
                Gagal memuat terjemahan.
            </div>
        `;

        console.error(err);

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

                <span
                    class="badge bg-success mb-2">

                    Ayat ${i}

                </span>

                <div
                    style="
                    line-height:1.8;
                    font-size:16px;">

                    ${data.verse["verse_" + i]}

                </div>

            </div>

        </div>

        `;

    }

    panel.innerHTML = html;

}

// ======================================
// Default
// ======================================

loadTranslation(1);

console.log("translation.js loaded");