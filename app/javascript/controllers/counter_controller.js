import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="counter"
export default class extends Controller {
  static targets = ["output"];
  connect() {
    console.log("Aboba1");
    console.log(this.outputTarget);
  }
}
