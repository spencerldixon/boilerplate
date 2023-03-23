import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="modal"
export default class extends Controller {
  static targets = ['modal']

  close() {
    this.modalTarget.classList.add("hidden")
  }

  open() {
    this.modalTarget.classList.remove("hidden")
  }
}
