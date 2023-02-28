import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  connect() {}

  close() {
    this.sidebarTarget;
  }
}
