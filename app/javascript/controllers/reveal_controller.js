import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="reveal"
// Shows and hides elements given a trigger
// Set data-reveal-target="hideable" on the thing you want to hide
// Set data-action="click->reveal#toggle" to toggle
// Set data-reveal-hidden-class-value="hidden" to customise the class toggled (defaults to "hidden")
// Alternatively you can have different toggleable triggers...
// Set data-reveal-target="openTrigger"
// Set data-reveal-target="closeTrigger"
// Set data-action="click->reveal#toggle" on both triggers
// Set one of them to hidden, and it'll switch between them on open/close states

export default class extends Controller {
  static targets = ["hideable", "openTrigger", "closeTrigger"]
  static values = {
    hiddenClass: {type: String, default: "hidden"}
  }

  toggle() {
    this.hideableTargets.forEach(el => {
      console.log(this.hiddenClassValue)
      el.classList.toggle("lg:flex")

      if(this.hasOpenTriggerTarget) {
        this.openTriggerTarget.classList.toggle("hidden")
        this.closeTriggerTarget.classList.toggle("hidden")
      }
    })
  }
}

