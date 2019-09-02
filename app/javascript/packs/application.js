import "bootstrap";
import { initThemechoices } from "../plugins/theme_choices";
import {showHide} from "../plugins/show_hide";
import {complaintFiller} from "../plugins/complaint_filler";
import "../plugins/flatpickr";
import { formEmail } from "../plugins/preview_email";

initThemechoices();
showHide();
complaintFiller();
formEmail();

