let addMateBtn = document.getElementById("addMateria"); //Materia sera abreviado como Mate
let mateContainer = document.getElementById("listaMaterias");
let eliminarMateBtnLista = document.getElementsByClassName("eliminarBtn");

function createNomMateLabel(){
    let label = document.createElement("label");
    let pNombre = document.createElement("p")
    let inputNombre = document.createElement("input");

    pNombre.textContent = "Nombre Materia";

    label.setAttribute("class","inputNew");
    label.setAttribute("for","nomMateria");
    inputNombre.setAttribute("type","text");
    inputNombre.setAttribute("id","nomMateria");
    inputNombre.setAttribute("placeholder","Ingles");
    inputNombre.setAttribute("name","nomMateria");

    label.appendChild(pNombre);
    label.appendChild(inputNombre);

    return label
}

function createEstadoInput(){
    let inputEstado = document.createElement("input");

    inputEstado.setAttribute("type","text");
    inputEstado.setAttribute("value","no");
    inputEstado.setAttribute("name","estadoNota");
    inputEstado.hidden = true;

    return inputEstado
}

function createPorInput(){
    let inputPor = document.createElement("input");

    inputPor.setAttribute("type","number");
    inputPor.setAttribute("value","0");
    inputPor.setAttribute("name","porcentaje");
    inputPor.hidden = true;

    return inputPor
}

addMateBtn.addEventListener("click", ()=> {
    let materia = document.createElement("div");
    materia.classList.add("materia");
    mateContainer.insertBefore(materia,mateContainer.lastElementChild);
    addMateBtn.disabled = true;

})

function eliminarNotaEvent(button){
    button.addEventListener("click", () =>{
        const eliminarParent = button.parentNode.parentNode;
        if(eliminarParent.nodeName !="FORM"){
            eliminarParent.removeChild(button.parentNode);
        }
        else{
            eliminarParent.parentNode.removeChild(eliminarParent);
            addMateBtn.disabled = false;
        }
    })
}

Array.from(eliminarMateBtnLista).forEach(eliminarBtn =>{
    eliminarNotaEvent(eliminarBtn);
})