import "bootstrap";
// import 'mapbox-gl/dist/mapbox-gl.css';
import { initThemechoices } from "../plugins/theme_choices";
import {showHide} from "../plugins/show_hide";
import {complaintFiller} from "../plugins/complaint_filler";
import "../plugins/flatpickr";
import { formEmail } from "../plugins/preview_email";
import { copyURL } from "../plugins/copy_url";
import {initAutocomplete} from "../plugins/init_autocomplete";
import {audioFeature} from "../plugins/record_audio";
import { Chart } from 'chart.js'
import { initMapbox } from '../plugins/init_mapbox';


initThemechoices();
showHide();
complaintFiller();
formEmail();
copyURL();
initAutocomplete();
audioFeature();
initMapbox();


// My Chart

var ctx = document.getElementById('myChart');
if (ctx) {
  var acts = Number.parseInt(document.querySelector('#number-acts').dataset.acts, 10);
  var actsLocalized = Number.parseInt(document.querySelector('#number-acts-localized').dataset.actsLocalized, 10);
  var actsFiles = Number.parseInt(document.querySelector('#number-files').dataset.actsFiles, 10);
  var myChart = new Chart(ctx, {
      type: 'bar',
      data: {
          labels: ['Actes signalés', 'Actes géolocalisés', 'Dossiers créés'],
          datasets: [{
              label: "Nombre d'actes signalés sur Breakfree",
              data: [acts, actsLocalized, actsFiles],
              backgroundColor: [
                  '#9D5C63',
                  '#471F44',
                  '#C78283'
              ],
              borderColor: [
                  '#9D5C63',
                  '#471F44',
                  '#C78283'
              ],
              borderWidth: 0
          }]
      },
      options: {
        scales: {
          yAxes: [{
              barPercentage: 0.5,
              barThickness: 6,
              maxBarThickness: 8,
              minBarLength: 1,
              ticks: {
                  beginAtZero: true
              }
          }]
        }
      }
  });
}
