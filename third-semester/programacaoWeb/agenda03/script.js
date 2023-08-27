let containerContacts = document.querySelector("#contacts");
let validFields = true;
let listContacts;

window.onload = () => {
    listContacts = document.createElement("ul");
    containerContacts.appendChild(listContacts);
    createInitialStyles();

}

const createInitialStyles = () => {
    let body = document.querySelector("body");
    body.style.width = "30%";
    body.style.padding = "10px";

    containerContacts.style.marginTop = "10px";

    let buttons = document.querySelectorAll("button");
    for (let button of buttons) {
        button.style.marginTop = "10px";
        button.style.marginRight = "20px";
    }

    let inputName = document.querySelector("#name");
    let inputPhone = document.querySelector("#phone");
    inputName.style.margin = "10px 0";
    inputPhone.style.margin = "10px 0";

    let select = document.querySelector("select");
    select.style.margin = "10px 0";

    let firstDiv = document.querySelector("div");
    firstDiv.style.margin = "10px 0";

    let inputsRadio = document.querySelectorAll("input[type='radio']");
    for (let inputRadio of inputsRadio) {
        inputRadio.style.margin = "0.25em 5px 0 20px";
    }

}

const checkFields = () => {
    let inputThemeChecked = document.querySelector('input[name="theme"]:checked');
    let inputName = document.querySelector("#name").value;
    let inputPhone = document.querySelector("#phone").value;
    
    let selectTypeContact = document.getElementById("typeContact");
    let contactSelected = selectTypeContact.options[selectTypeContact.selectedIndex].textContent;
        
    !inputThemeChecked || !inputName || !inputPhone || !contactSelected ? validFields = false : validFields = true;

    !validFields ? showWarningMessage() : sendData(inputThemeChecked.id, inputName, inputPhone, contactSelected);
}

const changeTheme = theme => {
    if (theme) {
        let body = document.querySelector("body");
        let allItemLists = document.querySelectorAll("li");

        if (theme == "lightTheme") {
            body.style.background = "white";
            body.style.color = "black";

            for (let itemlist of allItemLists) {
                itemlist.style.color = "black";
            }
        } else if (theme == "darkTheme") {
            body.style.background = "black";
            body.style.color = "white";
            
            for (let itemlist of allItemLists) {
                itemlist.style.color = "white";
            }
        }
    }
}

const sendData = (inputThemeChecked, inputName, inputPhone, contactSelected) => {
    if (validFields) {
        containerContacts.innerHTML = "";
        let contact = document.createElement("li");
        contact.innerHTML = `${inputName}, ${inputPhone}, ${contactSelected}`;
        contact.style.margin = "10px 0";
        listContacts.appendChild(contact);
        containerContacts.appendChild(listContacts);
        containerContacts.style.color = "black";
        changeTheme(inputThemeChecked);
    }
}

const showWarningMessage = () => {
    if (validFields) return;
    containerContacts.innerHTML = "";
    containerContacts.innerHTML = "Informe dados válidos";
    containerContacts.style.color = "red";
}

const resetContactList = () => {
    containerContacts.querySelector("ul").innerHTML = "";
}