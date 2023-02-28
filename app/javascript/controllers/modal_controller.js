import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  connect() {}

  close() {
    this.sidebarTarget.classList.remove("translate-x-0");
    this.sidebarTarget.classList.add("translate-x-full");

    // this.element refers to html element who has modal-controller registered
    // en nuestro caso, todo lo que está dentro del turbo_frame
    setTimeout(() => {
      this.element.remove();
    }, 300);
  }
}
