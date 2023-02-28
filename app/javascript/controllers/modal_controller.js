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

    // esto es para redirigir despues de haber agregado el producto
    // calculo que ya no es necesario, pero lo dejo encendido
    this.element.addEventListener("turbo:submit-end", (event) => {
      if (event.details.success) {
        Turbo.visit(event.detail.fetchResponse.response.url);
      }
    });
  }

  close() {
    this.sidebarTarget.classList.remove("translate-x-0");
    this.sidebarTarget.classList.add("translate-x-full");

    // this.element refers to html element who has modal-controller registered
    // en nuestro caso, todo lo que está dentro del turbo_frame
    setTimeout(() => {
      // Cleaning el atributo src del turbo_frame from html
      this.element.parentElement.removeAttribute("src");
      this.element.remove();
    }, 250);
  }
}
