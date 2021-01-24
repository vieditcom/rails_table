import Turbolinks from 'turbolinks'
import ApplicationController from './application_controller'

export default class extends ApplicationController {

  reload() {
    console.log('reload triggered')
    Turbolinks.visit('/')
  }

  test() {
    // code
  }

}
