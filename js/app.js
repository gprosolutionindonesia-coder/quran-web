let page = 1;

const img = document.getElementById("page");

document.getElementById("next").onclick = function(){

    if(page < 624){

        page++;

        img.src =
        "Medina1/data/N/" +
        String(page).padStart(4,"0") +
        ".gif";

    }

}

document.getElementById("prev").onclick = function(){

    if(page > 1){

        page--;

        img.src =
        "Medina1/data/N/" +
        String(page).padStart(4,"0") +
        ".gif";

    }

}