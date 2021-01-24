// reusable functions for fetch

export function csrfToken() {
  const csrfToken = document.querySelector("[name='csrf-token']")
  if (csrfToken) {
    return csrfToken.content
  } else {
    return null
  }
}

export const headers = new Headers({
  'Content-Type': 'application/json',
  'Accept': 'application/json', // showing 'as JSON' in rails console
  'X-CSRF-Token': csrfToken()
})
