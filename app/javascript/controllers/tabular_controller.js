import { Controller } from "stimulus"
import ApplicationController from "./application_controller"
import { headers } from '../src/js/csrf'

export default class extends ApplicationController {

  // action
  destroy(event) {
    const user = this.data.get('id')

    let attachmentId = event.currentTarget.dataset.uploadId
    let uploadHolder = event.currentTarget.closest('.attachment__holder')
    fetch('/users/' + user, {
      method: 'delete',
      headers: headers,
    }).then(response => {
      if (response.ok) {
        this.element.remove()
      } else {
        console.error(response)
      }
    }).catch(err => console.error('we got an error: ', err))
  }

}
