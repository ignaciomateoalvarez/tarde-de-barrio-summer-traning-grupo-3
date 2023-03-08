import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ['files','list']
  connect() {
    this.filesTarget.addEventListener('change', e =>{
      this.filesList()
    })
  }

  filesList(){
    for (let i=0; i < this.filesTarget.files.length; i++){
      const file = this.filesTarget.files[i]
      const listItem = document.createElement('li')
      listItem.innerHTML = `<p>${file.name}</p>`
      this.listTarget.appendChild(listItem)
    }
  }
}