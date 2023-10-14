import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
// You can open the modal by default with data-modal-open-on-connect-value="true"

export default class extends Controller {
  static targets = ['modal']
  static values = {
    openOnConnect: { type: Boolean, default: false }
  }

  connect() {
    if (this.openOnConnectValue) {
      this.modalTarget.classList.remove("hidden")
    }
  }

  close() {
    this.modalTarget.classList.add("hidden")
  }

  open() {
    this.modalTarget.classList.remove("hidden")
  }

  toggle() {
    this.modalTarget.classList.toggle("hidden")
  }
}
