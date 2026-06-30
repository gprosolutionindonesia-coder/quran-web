// ======================================
// Quran Web GPRO
// Translation Module
// ======================================

window.currentSurah = 1;

// ======================================
// Load Translation
// ======================================

window.loadTranslation = async function (surahNumber) {

    currentSurah = Number(surahNumber);

    console.clear();

    console.log("======================================");
    console.log("LOAD TRANSLATION");
    console.log("======================================");

    console.log("Surah Number :", currentSurah);

    const file =
        "data/translation/id/id_translation_" +
        currentSurah +
        ".json";

    console.log("File :", file);

    const panel = document.getElementById("translationPanel");

    panel.innerHTML = `
        <div class="text-center p-4">

            <div class="spinner-border text-success"></div>

            <br><br>

            Memuat terjemahan...

        </div>
    `;

    try {

        console.log("FETCH...");

        const response = await fetch(file);

        console.log("HTTP Status :", response.status);

        if (!response.ok) {

            throw new Error(
                "HTTP " + response.status
            );

        }

        const data = await response.json();

        console.log("SUCCESS");
        console.log("Nama Surat :", data.name);
        console.log("Jumlah Ayat :", data.count);

        renderTranslation(data);

    }
    catch(err){

        console.error("ERROR :", err);

        panel.innerHTML = `

            <div class="alert alert-danger">

                <h5>Terjadi Kesalahan</h5>

                <hr>

                <b>File :</b>

                <br>

                ${file}

                <hr>

                <b>Error :</b>

                <br>

                ${err}

            </div>

        `;

    }

};

// ======================================
// Render Translation
// ======================================

function renderTranslation(data){

    console.log("RENDER...");

    const panel =
        document.getElementById(
            "translationPanel"
        );

    let html = "";

    html += `

        <h3 class="mb-2">

            📖 ${data.name}

        </h3>

        <div class="text-muted mb-4">

            ${data.count} Ayat

        </div>

    `;

    for(let i=1;i<=data.count;i++){

        html += `

        <div class="card mb-3 shadow-sm">

            <div class="card-body">

                <span class="badge bg-success">

                    Ayat ${i}

                </span>

                <p
                class="mt-3"
                style="
                line-height:2;
                font-size:17px;
                ">

                    ${data.verse["verse_"+i]}

                </p>

            </div>

        </div>

        `;

    }

    panel.innerHTML = html;

    console.log("SELESAI RENDER");

}

// ======================================
// Default
// ======================================

console.log("translation.js berhasil dimuat");