const formEmail = () => {

  const emailEstablishment = document.querySelector("#email_establishment span");
  const validateButton = document.getElementById("validate-button");

  if(validateButton){
    validateButton.addEventListener("click", (event) => {
      const previewEmail = document.getElementById("inputEmail3").value;
      // console.log(previewEmail);
      const preview = document.querySelector(".preview-box");
      preview.style.display = "block";
      emailEstablishment.innerHTML = previewEmail;
    });
  };

};

export { formEmail };


