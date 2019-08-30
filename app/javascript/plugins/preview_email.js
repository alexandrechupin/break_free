const formEmail = () => {

  const emailEstablishment = document.querySelector("#email_establishment span");
  const validateButton = document.getElementById("validate-button");

  validateButton.addEventListener("click", (event) => {
    const previewEmail = document.getElementById("inputEmail3").value;
    // console.log(previewEmail);
    const preview = document.querySelector(".preview-box");
    preview.style.display = "block";
    emailEstablishment.innerHTML = previewEmail;
  });

};

export { formEmail };



// // Hide
// preview.style.display = "none";

// // Show
// preview.style.display = "";


// // Write
// emailEstablishment.value = `${inputEmail3.value}`;
