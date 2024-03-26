
//json centre d'interet

json = {
    "Sport": [
        "Football",
        "Basketball",
        "Baseball",
        "Soccer",
        "Hockey",
        "Tennis",
        "Golf",
        "Swimming",
        "Track",
        "Volleyball"
    ],
    "Music": [
        "Rock",
        "Country",
        "Rap",
        "Classical",
        "Jazz",
        "Blues",
        "Reggae",
        "Pop",
        "Techno",
        "Metal"
    ],
    "Food": [
        "Pizza",
        "Hamburger",
        "Hot Dog",
        "Pasta",
        "Salad",
        "Steak",
        "Chicken",
        "Fish",
        "Tacos",
        "Sushi"
    ]
}

// Récupération des centres d'intérêt et creation de cases 


// Récupération du bouton d'ajout de photo
if (document.getElementById('btn-picture') !== null)
document.getElementById('btn-picture').addEventListener('click', function (event) {
    event.preventDefault();
    var input = document.createElement('input');
    input.type = 'file';
    input.accept = 'image/*';
    input.click();
    input.addEventListener('change', function (event) {
        var file = event.target.files[0];
        var reader = new FileReader();
        reader.onload = function (e) {
            var img = document.createElement('img');
            img.width = 200;
            img.src = e.target.result;
            img.classList.add('rounded', 'mx-auto', 'd-block'); // Ajoute les classes
            document.getElementById('btn-container').appendChild(img);
        };
        if (file) {
            reader.readAsDataURL(file);
            document.getElementById('btn-picture').style.display = 'none';
        }
    });
});

// Récupération du bouton Suivant
if (document.getElementById('btnNext') !== null)
document.getElementById('btnNext').addEventListener('click', function (event) {
    event.preventDefault();
    window.location.href = 'createProfilePage2.html';
});

// Récupération des centres d'intérêt

if (document.getElementById('interests') !== null)
console.log("coucou");
