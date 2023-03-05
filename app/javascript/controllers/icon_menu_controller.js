import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="icon-menu"
export default class extends Controller {
  connect() {
    console.log('teste de controller')
  }
}
