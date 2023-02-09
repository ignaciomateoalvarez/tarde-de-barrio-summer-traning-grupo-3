import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = [ "checkbox","display"]

  connect() {
  }

  changeActive(){
    this.element.parentElement.submit()
  }
}