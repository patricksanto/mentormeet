import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr";

// Connects to data-controller="flatpickr"
export default class extends Controller {
  // Inform the controller that it has two targets in the form, which are our inputs
  static targets = [ "startTime" ]

  connect() {
    flatpickr(this.startTimeTarget, {
      enableTime: true,
      dateFormat: "Y-m-d H:i",
      minDate: "today"
    })
  }
}
