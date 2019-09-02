function copyURL() {
  /* Get the text field */
  const copyText = document.getElementById("myInput");

  /* Select the text field */
  if(copyText) {
    copyText.select();
    copyText.setSelectionRange(0, 99999); /*For mobile devices*/

    /* Copy the text inside the text field */
    document.execCommand("copy");

    /* Alert the copied text */
    alert("Copied the text: " + copyText.value);
  }
}

export { copyURL };
