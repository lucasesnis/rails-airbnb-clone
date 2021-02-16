// app/javascript/plugins/flatpickr.js

import flatpickr from "flatpickr"


const flatpickrInit = () => {
  const calendar = document.querySelector('.datepicker');
  if (calendar) {
	flatpickr(".datepicker", {
	    enableTime: true,
	    dateFormat: "Y-m-d H:i",
	    time_24hr: true,
	    minDate: "today",
	    minTime: "09:00",
        maxTime: "19:00"
	});
  }

}

export { flatpickrInit };
