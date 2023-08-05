const addPorcentajeBtn = document.getElementById("addPorcentaje"); //Boton que añade form de nuevo porcentaje
const materiasCon = document.getElementById("materiasCon");        //Contenedor que almacena los todos los porcentajes
const addNotaList = document.getElementsByClassName("addNota");    //Lista de botones de añadir una nueva nota
let  eliminarPorBtnLista = document.getElementsByClassName("eliminarPorBtn"); //Lista de botones de eliminar una porcentaje
let eliminarNotaBtnLista = document.getElementsByClassName("eliminarBtn");  //Botones para eliminar una nota
let mostrarNotaList = document.getElementsByClassName("showNotas");  //Botones para mostrar las notas


/*
Funcion que crea la label que contiene el input de nombre del porcentaje, devuelve la label
con todos sus elementos
*/
function createLabelNombrePor(){ 
    const label =document.createElement("label");
    const pNombre = document.createElement("p");
    const inputNombre = document.createElement("input");

    
    pNombre.textContent = "Nombre Porcentaje"; 

    inputNombre.setAttribute("name", "nombrePor"); //Coloca los atributos necesarios del input
    inputNombre.setAttribute("type", "text");   
    inputNombre.setAttribute("id", "nombrePor");
    inputNombre.setAttribute("placeholder","Portafolio");

    label.setAttribute("id","labelNombrePor");//Coloca los atributos necesarios del label
    label.setAttribute("class","inputNew");
    label.setAttribute("for","nombrePor");

    label.appendChild(pNombre);
    label.appendChild(inputNombre);

    return label
}

/*
Funcion que crea la label que contiene input del valor del porcentaje, devuelve la label
con todos sus elementos
*/
function createLabelValPor(){
    const label = document.createElement("label");
    const pVal = document.createElement("p");
    const inputVal = document.createElement("input");
    const container = document.createElement("div");
    const pPorncetaje = document.createElement("p");

    pVal.textContent = "Valor Porcentaje"; //Coloca texto necesario
    pPorncetaje.textContent = "%";

    inputVal.setAttribute("name", "valPor"); //Coloca los atributos necesarios del input
    inputVal.setAttribute("type", "number");   
    inputVal.setAttribute("id", "valPor");
    inputVal.setAttribute("placeholder","0");

    label.setAttribute("id","labelValPor");//Coloca los atributos necesarios del label
    label.setAttribute("class","inputNew");
    label.setAttribute("for","valPor");

    label.appendChild(pVal); //Añade los elementos
    container.appendChild(inputVal);
    container.appendChild(pPorncetaje);
    label.appendChild(container);
    return label
}

/*
Funcion que crea el form que almacenara las distintas labels
*/
function createNewElementForm(){
    const form = document.createElement("form");

    form.setAttribute("id","newForm");
    form.setAttribute("action","newPor.jsp");
    return form
}

/*
Crea input que contendra como value el nombre de la materia a la cual se le agrega
un porcentaje
*/
function createNombreMateInput(){
    const input = document.createElement("input");
    const nombreMate = document.getElementById("nombreMate");

    input.setAttribute("type","text");
    input.setAttribute("name","nombreMate");
    input.setAttribute("value",nombreMate.textContent);
    input.hidden = true;

    return input
}

/*
Funcion que se encarga de eliminar del contenedor .materiasContainer toda
la informacion del porcentaje al cual se le hizo click de eliminar.
Toma como argumento el boton de eliminar y se le agrega el event de click
*/
function EliminarPorEvent(button){
    button.addEventListener("click", ()=>{
        const eliminarParent = button.parentNode.parentNode;
        if (eliminarParent.nodeName != "FORM"){
            enviarIdPorcentaje(button);
            eliminarParent.parentNode.removeChild(eliminarParent);
        }
        else{
            eliminarParent.parentNode.parentNode.removeChild(eliminarParent.parentNode);
            addPorcentajeBtn.disabled = false;
            changeDisabledNota(false);
        }
    })
}

//Funcion que envia el id del Porcentaje que se quiere eliminar
function enviarIdPorcentaje(button){
    const porcentajeContainer = button.closest(".infoPorcentaje");
    const idOcultoContainer = porcentajeContainer.getElementsByClassName("idOculto");
    const idPorcentaje = idOcultoContainer[0].textContent;

    const deleteForm = document.createElement("form");
    const idInput = document.createElement("input");
    
    idInput.setAttribute("value",idPorcentaje);
    idInput.setAttribute("type","text");
    idInput.setAttribute("name","idPorcentaje");
    deleteForm.setAttribute("action","deletePorcentaje.jsp");

    deleteForm.appendChild(idInput);
    porcentajeContainer.appendChild(deleteForm);

    deleteForm.submit();
}

/*
Funcion que se encarga de eliminar del contenedor .notasContainer toda
la informacion de la nota a la cual se le hizo click de eliminar.
Toma como argumento el boton de eliminar y se le agrega el event de click
*/
function eliminarNotaEvent(button){
    button.addEventListener("click", () =>{
        const eliminarParent = button.parentNode;
        if(eliminarParent.nodeName !="FORM"){
        	enviarIdNota(button);
            eliminarParent.parentNode.removeChild(eliminarParent);
        }
        else{
            eliminarParent.parentNode.parentNode.removeChild(eliminarParent.parentNode);
            changeDisabledNota(false);
            addPorcentajeBtn.disabled = false;
        }
    })
}

//Funcion que envia el id de la nota que se quiere eliminar
function enviarIdNota(button){
    const NotaContainer = button.closest(".nota");
    const idOcultoContainer = NotaContainer.getElementsByClassName("idOculto");
    const idNota = idOcultoContainer[0].textContent;

    const deleteForm = document.createElement("form");
    const idInput = document.createElement("input");
    
    idInput.setAttribute("value",idNota);
    idInput.setAttribute("type","text");
    idInput.setAttribute("name","idNota");
    deleteForm.setAttribute("action","deleteNota.jsp");

    deleteForm.appendChild(idInput);
    NotaContainer.appendChild(deleteForm);

    deleteForm.submit();
}

/*
Crea la label que contiene el input de la nota obtenida, devuelve la label
*/
function createLabelNotaObt(){
    const label = document.createElement("label");
    const notaObt = document.createElement("p");
    const inputNotaObt = document.createElement("input");

    notaObt.textContent = "Nota obtenida";

    label.setAttribute("id","labelNotaObt");
    label.setAttribute("class","notaObt inputNew");
    label.setAttribute("for","notaObt");
    inputNotaObt.setAttribute("type","number");
    inputNotaObt.setAttribute("id","notaObt");
    inputNotaObt.setAttribute("name","notaObt");
    inputNotaObt.setAttribute("placeholder","0");

    label.appendChild(notaObt);
    label.appendChild(inputNotaObt);
    
    return label

}

/*
Crea la label que contiene el input de la nota posible, devuelve la label
*/
function createLabelNotaPos(){
    const label = document.createElement("label");
    const notaPos = document.createElement("p");
    const inputNotaPos = document.createElement("input");

    notaPos.textContent = "Nota Posible";

    label.setAttribute("id","labelNotaPos");
    label.setAttribute("class","notaPos inputNew");
    label.setAttribute("for","notaPos");
    inputNotaPos.setAttribute("type","number");
    inputNotaPos.setAttribute("id","notaPos");
    inputNotaPos.setAttribute("name","notaPos");
    inputNotaPos.setAttribute("placeholder","0");

    label.appendChild(notaPos);
    label.appendChild(inputNotaPos);
    
    return label

}
/*
Crea la label que contiene el input del nombre de la nota, devuelve la label
*/
function createLabelNombreNota(){
    const label = document.createElement("label");
    const nombreNota = document.createElement("input");
    const pNombre = document.createElement("p");

    pNombre.textContent = "Nombre nota"

    label.setAttribute("class","inputNew nombreNota");
    label.setAttribute("for","nombreNota");
    nombreNota.setAttribute("type","text");
    nombreNota.setAttribute("placeholder","Portafolio");
    nombreNota.setAttribute("name","nombreNota");
    nombreNota.setAttribute("id","nombreNota");

    label.appendChild(pNombre);
    label.appendChild(nombreNota);

    return label
}
/*
Crea el input que contendra el nombre del porcentaje al cual se le agrega la nota
toma como argumento el container de los porcentajes para realizar una busqueda del
titulo del porcentaje
*/
function createNombrePorInput(porContainer){
    const input = document.createElement("input");
    let nombrePor = porContainer.getElementsByClassName("infoPorcentaje");
    nombrePor = nombrePor[0].getElementsByClassName("nombrePorcentaje");
    nombrePor = nombrePor[0];

    input.setAttribute("type","text");
    input.setAttribute("name","nombrePor");
    input.setAttribute("value",nombrePor.textContent);
    input.hidden = true;

    return input
}
/*
Crea la el elemento que contendra el form de la nota que se quiere crear
*/
function createNota(porContainer){
    const nota = document.createElement("div");
    const form = document.createElement("form");
    const eliminarBtn = document.createElement("button");
    const notaObt = createLabelNotaObt();
    const notaPos = createLabelNotaPos();
    const nombreLabel = createLabelNombreNota();
    const nombrePorInput = createNombrePorInput(porContainer);

    eliminarBtn.textContent = "Eliminar"
    eliminarNotaEvent(eliminarBtn);
    
    nota.setAttribute("class","nota");
    form.setAttribute("class","nota");
    form.setAttribute("id","newForm");
    form.setAttribute("action","newNota.jsp");
    eliminarBtn.setAttribute("class","eliminarBtn");

    form.appendChild(eliminarBtn);
    form.appendChild(nombreLabel);
    form.appendChild(notaObt);
    form.appendChild(notaPos);
    form.append(nombrePorInput);
    nota.appendChild(form);

    return nota
}

/*
Modifica el disabled de los botones de agregar nota, toma como argumento
un booleano que indica a que estado se quiere colocarlos
*/
function changeDisabledNota(boolean){
    const addNotaBtnLista = document.getElementsByClassName("addNota");
    Array.from(addNotaBtnLista).forEach(button =>{
        button.disabled = boolean;
    })
}

/*
Añade evento de click al boton de añadir porcentaje, realiza la creacion de todos los
elementos necesarios que debe contener el form que se le mostrara al usuario
*/
addPorcentajeBtn.addEventListener("click", ()=>{
    const form = createNewElementForm();
    const nombreLabel = createLabelNombrePor();
    const valLabel = createLabelValPor();
    const eliminarBtn = document.createElement("button");
    const porcentajeContainer = document.createElement("div");
    const infoPorContainer = document.createElement("div");
    const nombreMateInput = createNombreMateInput();

    eliminarBtn.textContent = "Eliminar";
    eliminarBtn.setAttribute("class","eliminarPorBtn");
    EliminarPorEvent(eliminarBtn);
    porcentajeContainer.setAttribute("class","porcentajeContainer");
    infoPorContainer.setAttribute("class", "infoPorcentaje");
    
    infoPorContainer.appendChild(eliminarBtn);
    infoPorContainer.appendChild(nombreLabel);
    infoPorContainer.appendChild(valLabel);
    form.append(infoPorContainer);
    form.append(nombreMateInput);
    porcentajeContainer.append(form);

    materiasCon.insertBefore(porcentajeContainer,materiasCon.lastElementChild);
    addPorcentajeBtn.setAttribute("disabled","true");
    changeDisabledNota(true);
})

//Añade a cada elemento del nodeList de añadir nota, la funcionalidad
//De crear el form mediante un evento
Array.from(addNotaList).forEach(addBtn =>{
    addBtn.addEventListener("click",()=>{
        const notasContainer = addBtn.closest(".notasContainer");
        const porContainer = addBtn.closest(".porcentajeContainer");
        const nota = createNota(porContainer);

        notasContainer.insertBefore(nota,notasContainer.lastElementChild);

        addPorcentajeBtn.disabled = true;
        changeDisabledNota(true);

    })
})


/*
Toma la nodelist de los botones de mostrar notas y les agrega un evento
click para mostrar o ocultar el display de las notas
*/
Array.from(mostrarNotaList).forEach(button => {

    button.addEventListener("click", ()=>{
    // Find the parent porcentajeContainer element
    const parentPorcentajeContainer = button.closest(".porcentajeContainer");

    // Find the child notasContainer element within the parent porcentajeContainer
    const notasContainer = parentPorcentajeContainer.querySelector(".notasContainer");
    // Toggle the display property for the notasContainer
    notasContainer.style.display = notasContainer.style.display === "none" ? "grid" : "none";
    })
});

//Agrega a los botones de eliminar nota la funcionalidad de eliminar
Array.from(eliminarNotaBtnLista).forEach(eliminarBtn =>{
    eliminarNotaEvent(eliminarBtn);
})
//Agrega a los botones de eliminar porcentaje la funcionalidad de eliminar
Array.from(eliminarPorBtnLista).forEach(eliminarBtn =>{

    EliminarPorEvent(eliminarBtn);
});
