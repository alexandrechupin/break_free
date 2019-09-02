import flatpickr from "flatpickr"
import "flatpickr/dist/flatpickr.min.css" // Note this is important!
import French from "flatpickr/dist/l10n/fr.js";
flatpickr.localize(flatpickr.l10ns.fr);

flatpickr(".datepicker", {
  enableTime: false,
  format: "d-m-Y",
  altFormat: "d-m-Y",
  altInput: true,
  "locale": French
})

