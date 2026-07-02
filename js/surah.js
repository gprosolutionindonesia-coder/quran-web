// ======================================
// Quran Web GPRO
// Modul Daftar Surat + Live Search
// ======================================

let allSurah = [];

// ======================================
// Load Data Surat
// ======================================

async function loadSurah() {

    const response = await fetch("data/surah.json");

    allSurah = await response.json();

    renderSurah(allSurah);

    const search = document.getElementById("searchSurah");

    search.addEventListener("keyup", function(){

        const keyword = this.value.toLowerCase();

        const result = allSurah.filter(function(item){

            return (
                item.name.toLowerCase().includes(keyword) ||
                (item.arabic || "").includes(keyword)
            );

        });

        renderSurah(result);

    });

}

// ======================================
// Open Surah
// ======================================

function openSurah(item){

    Quran.surah = item.id;

    openPage(Number(item.page));

}

// ======================================
// Render Daftar Surat
// ======================================

function renderSurah(data){

    const list = document.getElementById("surahList");

    list.innerHTML = "";

    data.forEach(function(item){

        const a = document.createElement("a");

        a.href = "#";

        a.className = "list-group-item list-group-item-action";

        a.innerHTML =
            "<b>" + item.id + ".</b> " +
            item.name +
            "<br><small>" +
            (item.arabic || "") +
            "</small>";

        a.onclick = function(e){

            e.preventDefault();

            openSurah(item);

        };

        list.appendChild(a);

    });

}

loadSurah();

console.log("surah.js loaded");
// ======================================
// Open Surah
// ======================================

function openSurah(item){

    Quran.surah = item.id;

    let page = Number(item.page);

    // database dimulai dari halaman 1
    // viewer dimulai dari halaman 2

    page = page + 1;

    if(page % 2 !== 0){
        page--;
    }

    openPage(page);

    console.log(
        "Open Surah:",
        item.name,
        "Page:",
        page
    );

}