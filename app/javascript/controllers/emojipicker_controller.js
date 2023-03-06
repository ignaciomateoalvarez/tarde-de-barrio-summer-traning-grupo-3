import { Controller } from "@hotwired/stimulus"
import { createPopup } from '@picmo/popup-picker'

export default class extends Controller {
  static targets = ['button','textArea','container']
  connect() {
    this.picker = createPopup({
      rootElement: this.containerTarget,
      hideOnEmojiSelect: false,
      hideOnClickOutside: false,

    },{
      referenceElement: this.buttonTarget,
      triggerElement: this.buttonTarget,
      position: 'bottom-start',
    })
    this.picker.addEventListener('emoji:select', selection => {
      const textAreaArray= this.textAreaTarget.value.split("")
      textAreaArray.splice(this.textAreaTarget.selectionStart, 0, selection.emoji)
      this.textAreaTarget.value = textAreaArray.join("")

    });
    
  }

  openPicker(){
    this.picker.toggle()
  }
  
}