let page = 2;

const leftPage = document.getElementById("leftPage");
const rightPage = document.getElementById("rightPage");
const pageNumber = document.getElementById("pageNumber");

function updatePages(){

    leftPage.src =
    "Medina1/data/N/" +
    String(page).padStart(4,"0") +
    ".gif";

    rightPage.src =
    "Medina1/data/N/" +
    String(page+1).padStart(4,"0") +
    ".gif";

    pageNumber.innerHTML =
    "Halaman " + page + " - " + (page+1);

}

updatePages();

document.getElementById("next").onclick=function(){

    if(page<622){

        page+=2;

        updatePages();

    }

}

document.getElementById("prev").onclick=function(){

    if(page>2){

        page-=2;

        updatePages();

    }

}