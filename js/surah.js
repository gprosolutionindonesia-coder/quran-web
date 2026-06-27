// ======================================
// Quran Web GPRO
// Modul Daftar Surat
// ======================================

async function loadSurah() {

    const response = await fetch("data/surah.json");
    const surah = await response.json();

    const list = document.getElementById("surahList");

    list.innerHTML = "";

    surah.forEach(item => {

        const a = document.createElement("a");

        a.href = "#";

        a.className = "list-group-item list-group-item-action";

        a.innerHTML = item.id + ". " + item.latin;

        a.addEventListener("click", function(e){

            e.preventDefault();

            page = item.page;

            // Viewer selalu mulai dari halaman genap
            if(page % 2 !== 0){
                page--;
            }

            updatePages();

        });

        list.appendChild(a);

    });

}