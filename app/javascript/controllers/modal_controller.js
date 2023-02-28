import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["sidebar"];

  connect() {
    // este metodo se ejecuta el html al que esa asociado es montado,
    // en nuestro caso, cuando el turbo_frame traiga los resultados del backend
    // y los imprima en el turbo_frame 'modal'
    setTimeout(() => {
      this.sidebarTarget.classList.remove("translate-x-full");
      this.sidebarTarget.classList.add("translate-x-0");
    }, 50);
  }

  close() {
    this.sidebarTarget.classList.remove("translate-x-0");
    this.sidebarTarget.classList.add("translate-x-full");

    // this.element refers to html element who has modal-controller registered
    // en nuestro caso, todo lo que está dentro del turbo_frame
    setTimeout(() => {
      this.element.remove();
    }, 250);
  }
}
