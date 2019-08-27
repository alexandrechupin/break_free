const initThemechoices = () => {
  $(".theme-tag").click(function(){
    $(this).toggleClass("active");
  });
}

export { initThemechoices };
