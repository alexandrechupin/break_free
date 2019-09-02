const showHide = () => {
// Show an element
const show = function (elem) {
  elem.classList.add('is-visible');
};

// Hide an element
const hide = function (elem) {
  elem.classList.remove('is-visible');
};

// Toggle element visibility
const toggle = function (elem) {
  elem.classList.toggle('is-visible');
};

// Listen for click events
document.querySelectorAll('.toggle').forEach((link) => {
  link.addEventListener('click', function (event) {
    // event.preventDefault();
    var content = document.querySelector(event.currentTarget.hash);
    const icon = event.currentTarget.querySelector('.fas');
    icon.classList.toggle('fa-rotate-180');

    if (!content) return;
    toggle(content);
  }, false);
});

}

export {showHide};
