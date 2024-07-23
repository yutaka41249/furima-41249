console.log("OK");  // JavaScriptが正しくロードされたことを確認
import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    this.element.textContent = "Hello World!"
  }
}
