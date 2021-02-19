// app/javascript/plugins/flatpickr.js

import flatpickr from "flatpickr"


const flatpickrInit = () => {
  const calendar = document.querySelector('.datepicker');
  if (calendar) {
	flatpickr(".datepicker", {
	    minDate: "today",
	    dateFormat: "d-m-Y",
	});
  }

  const calendar = document.querySelector('.datepickerbooking');
  if (calendar) {
	flatpickr(".datepickerbooking", {
	    minDate: "today",
		inline: true,
	    dateFormat: "d-m-Y",
	});
  }

}

export { flatpickrInit };
