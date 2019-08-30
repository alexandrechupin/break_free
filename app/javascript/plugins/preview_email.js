const previewEmail = document.getElementById("inputEmail3");
const preview = document.querySelector(".preview-box");
const emailEstablishment = document.getElementById("email_establishment");
const validateButton = document.getElementById("validate-button");

validateButton.addEventListener("click", (event) => {
  preview.style.display = "";
  emailEstablishment.value = `${inputEmail3.value}`;
});

export { validateButton };



// // Hide
// preview.style.display = "none";

// // Show
// preview.style.display = "";


// // Write
// emailEstablishment.value = `${inputEmail3.value}`;
