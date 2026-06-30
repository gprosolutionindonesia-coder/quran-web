// ======================================
// Quran Web GPRO
// Sidebar Module
// ======================================

window.showSurahPanel = function () {

    document.getElementById("surahList").style.display = "";
    document.getElementById("juzList").style.display = "none";

    document.getElementById("showSurah").className =
        "btn btn-primary";

    document.getElementById("showJuz").className =
        "btn btn-outline-primary";

};

window.showJuzPanel = function () {

    document.getElementById("surahList").style.display = "none";
    document.getElementById("juzList").style.display = "";

    document.getElementById("showJuz").className =
        "btn btn-primary";

    document.getElementById("showSurah").className =
        "btn btn-outline-primary";

};

document.getElementById("showSurah").onclick = showSurahPanel;
document.getElementById("showJuz").onclick = showJuzPanel;

console.log("sidebar.js loaded");