import ApplicationController from "./application_controller"
import { headers } from '../src/js/csrf'

export default class extends ApplicationController {

  // action
  destroy(event) {
    if (confirm('Are you sure?')) {
      const user = this.data.get('id')
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

}
