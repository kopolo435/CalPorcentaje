let addMateBtn = document.getElementById("addMateria"); //Materia sera abreviado como Mate
let mateContainer = document.getElementById("listaMaterias");
let eliminarMateBtnLista = document.getElementsByClassName("eliminarBtn");
const MateTitleLink= document.getElementsByClassName("titleLink");
const materiaCheckForm = document.getElementById("materiaCheck");

function createNomMateLabel(){
    let label = document.createElement("label");
    let pNombre = document.createElement("p")
    let inputNombre = document.createElement("input");

    pNombre.textContent = "Nombre Materia";

    label.setAttribute("class","inputNew");
    label.setAttribute("for","nomMateria");
    label.classList.add("inputNew");
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

function createTitleLink(title){
    const inputForm = materiaCheckForm.getElementById("titleName");
    inputForm.setAttribute("value",title.textContent);
    materiaCheckFormsubmit();
}

addMateBtn.addEventListener("click", ()=> {
    let materia = document.createElement("div");
    const nombreLabel = createNomMateLabel();
    const estadoInput = createEstadoInput();
    const porInput = createPorInput();
    const eliminarBtn = document.createElement("button");
    const form = document.createElement("form");

    eliminarBtn.textContent = "Eliminar"
    eliminarNotaEvent(eliminarBtn);
    form.setAttribute("id","newMateria");
    form.setAttribute("action","newMateria.jsp");

    eliminarBtn.classList.add("eliminarBtn")
    materia.classList.add("materia");
    materia.appendChild(eliminarBtn);
    materia.appendChild(nombreLabel);
    materia.appendChild(estadoInput);
    materia.appendChild(porInput);
    form.appendChild(materia)
    mateContainer.insertBefore(form,mateContainer.lastElementChild);
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

Array.from(MateTitleLink).forEach(title =>{
    title.addEventListener(()=>{
        createTitleLink(title);
    })
})