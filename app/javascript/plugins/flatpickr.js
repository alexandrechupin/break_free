import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import French from "flatpickr/dist/l10n/fr.js";
flatpickr.localize(flatpickr.l10ns.fr);

function sleep(ms) {
  return new Promise(resolve => setTimeout(resolve, ms));
};

async function load_flatpicker() {
  await sleep(1000);
  flatpickr(".datepicker", {
    enableTime: false,
    format: "d-m-Y",
    altFormat: "d-m-Y",
    altInput: true,
    "locale": French,
  });
};

load_flatpicker();



