// ======================================
// Quran Web GPRO
// Modul Daftar Surat + Live Search
// ======================================

let allSurah = [];

async function loadSurah() {

    const response = await fetch("data/surah.json");
    allSurah = await response.json();

    renderSurah(allSurah);

    const search = document.getElementById("searchSurah");

    search.addEventListener("keyup", function(){

        const keyword = this.value.toLowerCase();

        const result = allSurah.filter(function(item){

            return item.name.toLowerCase().includes(keyword);

        });

        renderSurah(result);

    });

}

function renderSurah(data){

    const list = document.getElementById("surahList");

    list.innerHTML = "";

    data.forEach(function(item){

        const a = document.createElement("a");

        a.href = "#";

        a.className = "list-group-item list-group-item-action";

        a.innerHTML = item.id + ". " + item.name;

        a.onclick = function(e){

            e.preventDefault();

            openPage(item.page);

// Ganti audio sesuai surat
setAudio(item.audio);

        };

        list.appendChild(a);

    });

}