function addGuest() {
  let name = document.getElementById("guest-name").value;
  let gender = document.querySelector('input[name="gender"]:checked').value;

  if (name === "") return;

  let container = document.getElementById("guest-container");

  let guestDiv = document.createElement("div");
  guestDiv.style.display = "inline-block";
  guestDiv.style.padding = "10px";
  guestDiv.style.margin = "5px";
  guestDiv.style.border = "1px solid black";
  guestDiv.style.borderRadius = "5px";

  // couleur
  if (gender === "f") guestDiv.style.color = "purple";
  if (gender === "m") guestDiv.style.color = "green";
  if (gender === "n") guestDiv.style.color = "black";

  // nom
  let text = document.createElement("span");
  text.innerText = name;

  // bouton supprimer
  let removeBtn = document.createElement("span");
  removeBtn.innerText = " ❌";
  removeBtn.style.cursor = "pointer";

  removeBtn.onclick = function() {
    container.removeChild(guestDiv);
  };

  guestDiv.appendChild(text);
  guestDiv.appendChild(removeBtn);

  container.appendChild(guestDiv);

  // reset input
  document.getElementById("guest-name").value = "";
}

function inviteAll() {
  document.getElementById("invite-all-message").style.display = "block";
  document.getElementById("guest-container").innerHTML = "";

  document.getElementById("add-btn").disabled = true;
}
