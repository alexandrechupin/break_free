const complaintFiller = () => {

  const userInputs = ["first-name", "last-name", "address", "zipcode", "city", "phone"];

  const updatePreview = ((inputType) => {
    const input = document.getElementById(`user-${inputType}`);
    if (input) {
      input.addEventListener('input', function (event) {
        var inputValue = input.value;
        var inputPreviews = document.querySelectorAll(`.user-${inputType}-preview`);
          inputPreviews.forEach((inputPreview) => {
            inputPreview.innerHTML = inputValue;
          });
      });
    };
  });

  userInputs.forEach((inputType) => {
    updatePreview(inputType);
  });
};

export { complaintFiller };

