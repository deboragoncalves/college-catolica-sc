let containerDays = document.getElementById("containerDays");

window.onload = () => {
    containerDays.style.display = "none";
    countainDays();
}

const countainDays = () => {
    let dateNow = new Date();
    let currentYear = dateNow.getFullYear();
    let currentMonth = dateNow.getMonth() + 1;
    let currentDay = dateNow.getDate();

    let finalDate = new Date(currentYear, 12, 31);
    let currentDate = new Date(currentYear, currentMonth, currentDay);

    let differenceDays = (finalDate - currentDate) / 86400000;
    
    if (differenceDays) {
        containerDays.style.display = "flex";
        document.getElementById("countainDays").innerHTML = differenceDays;
    }
}